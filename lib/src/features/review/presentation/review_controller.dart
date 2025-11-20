import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leo_thap_tu_vung/src/features/auth/presentation/auth_providers.dart';
import 'package:leo_thap_tu_vung/src/features/review/presentation/question.dart';
import 'package:leo_thap_tu_vung/src/features/vocabulary/data/database_providers.dart';
import 'package:leo_thap_tu_vung/src/features/vocabulary/data/database_repository.dart';
import 'package:leo_thap_tu_vung/src/features/vocabulary/data/vocabulary_repository.dart';
import 'package:leo_thap_tu_vung/src/models/achievement.dart'; // Ensure this is here
import 'package:leo_thap_tu_vung/src/models/user_profile.dart';
import 'package:leo_thap_tu_vung/src/models/user_progress.dart';
import 'package:leo_thap_tu_vung/src/models/vocabulary_item.dart';
import 'package:leo_thap_tu_vung/src/services/achievement_service.dart';
import 'package:leo_thap_tu_vung/src/services/srs_service.dart';

part 'review_controller.freezed.dart';

class AnswerResult {
  AnswerResult({
    required this.wasCorrect,
    required this.correctAnswer,
    required this.updatedProgress,
    this.newAchievements = const [],
  });
  final bool wasCorrect;
  final VocabularyItem correctAnswer;
  final UserProgress updatedProgress;
  final List<Achievement> newAchievements;
}

@freezed
class ReviewState with _$ReviewState {
  const factory ReviewState({
    @Default(true) bool isLoading,
    String? errorMessage,
    @Default([]) List<UserProgress> reviewQueue,
    @Default(0) int currentIndex,
    Question? currentQuestion,
    AnswerResult? lastAnswerResult,
    UserProfile? currentUserProfile,
  }) = _ReviewState;
}

class ReviewController extends StateNotifier<ReviewState> {
  ReviewController(
    this._databaseRepository,
    this._vocabularyRepository,
    this._srsService,
    this._userId,
  ) : super(const ReviewState()) {
    _init();
  }

  final DatabaseRepository _databaseRepository;
  final VocabularyRepository _vocabularyRepository;
  final SrsService _srsService;
  final String? _userId;

  Future<void> _init() async {
    if (_userId == null) {
      state = state.copyWith(isLoading: false);
      return;
    }
    try {
      final progressList = await _databaseRepository.getReviewQueue(userId: _userId!);
      
      // Listen to Profile for Streak/Achievement calculations
      _databaseRepository.watchUserProfile(userId: _userId!).listen((profile) {
         if (mounted) state = state.copyWith(currentUserProfile: profile);
      });

      state = state.copyWith(reviewQueue: progressList);
      
      if (state.reviewQueue.isNotEmpty) {
        await _generateQuestionForCurrentIndex();
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> _generateQuestionForCurrentIndex() async {
    if (state.reviewQueue.isEmpty) return;
    
    final currentProgress = state.reviewQueue[state.currentIndex];
    final vocabItem = await _vocabularyRepository.getVocabularyById(currentProgress.vocabularyId);
    
    if (vocabItem == null) {
      await nextItem();
      return;
    }

    Question question;
    if (currentProgress.srsStage < 3) {
      final options = await _vocabularyRepository.getDistractors(vocabItem, 3);
      question = Question.multipleChoice(correctWord: vocabItem, options: options);
    } else {
      question = Question.typing(wordToReview: vocabItem);
    }

    state = state.copyWith(currentQuestion: question, isLoading: false);
  }

  Future<void> submitAnswer(dynamic userAnswer) async {
    if (_userId == null || state.currentUserProfile == null) return;

    final progress = state.reviewQueue[state.currentIndex];
    final question = state.currentQuestion!;
    
    final bool isCorrect = question.when(
      multipleChoice: (correctWord, _) => (userAnswer as VocabularyItem).id == correctWord.id,
      typing: (wordToReview) => (userAnswer as String).trim().toLowerCase() == wordToReview.word.toLowerCase(),
    );
    
    final updatedProgress = _srsService.processReview(
      userProgress: progress,
      wasCorrect: isCorrect,
    );

    // Streak Logic
    final profile = state.currentUserProfile!;
    final now = DateTime.now();
    final lastStudy = profile.lastStudyDate;
    
    bool isNewDay = lastStudy == null || 
                    lastStudy.day != now.day || 
                    lastStudy.month != now.month || 
                    lastStudy.year != now.year;

    int newStreak = profile.currentStreak;
    if (isNewDay) {
       final yesterday = now.subtract(const Duration(days: 1));
       final wasYesterday = lastStudy != null && 
                            lastStudy.day == yesterday.day && 
                            lastStudy.month == yesterday.month && 
                            lastStudy.year == yesterday.year;
       
       if (wasYesterday) {
         newStreak++;
       } else if (lastStudy == null || !wasYesterday) {
         newStreak = 1; 
       }
    }

    // Achievement Check
    final simulatedProfile = profile.copyWith(
       currentStreak: newStreak,
       totalWordsLearned: profile.totalWordsLearned + (updatedProgress.isLearned && !progress.isLearned ? 1 : 0),
       totalReviewsCompleted: profile.totalReviewsCompleted + 1,
    );

    final newAchievements = AchievementService.checkForNewAchievements(
      userProfile: simulatedProfile,
      currentUnlockedIds: profile.unlockedAchievements,
    );

    try {
      await _databaseRepository.updateUserProgress(progress: updatedProgress, userId: _userId!);
      
      await _databaseRepository.updateUserStats(
        userId: _userId!,
        wordsLearnedDelta: updatedProgress.isLearned && !progress.isLearned ? 1 : 0,
        reviewsCompletedDelta: 1,
        streakUpdated: isNewDay,
        newStreak: newStreak,
        newAchievements: newAchievements,
      );

      state = state.copyWith(
        lastAnswerResult: AnswerResult(
          wasCorrect: isCorrect,
          correctAnswer: question.map(
            multipleChoice: (q) => q.correctWord,
            typing: (q) => q.wordToReview,
          ),
          updatedProgress: updatedProgress,
          newAchievements: newAchievements,
        ),
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> nextItem() async {
     if (state.currentIndex < state.reviewQueue.length - 1) {
       state = state.copyWith(
         currentIndex: state.currentIndex + 1,
         lastAnswerResult: null,
         currentQuestion: null,
         isLoading: true,
       );
       await _generateQuestionForCurrentIndex();
     } else {
       state = state.copyWith(reviewQueue: [], currentQuestion: null);
     }
  }
}

final srsServiceProvider = Provider((ref) => SrsService());
final vocabularyRepositoryProvider = Provider((ref) => VocabularyRepository()); 

final reviewControllerProvider =
    StateNotifierProvider.autoDispose<ReviewController, ReviewState>((ref) {
  final userId = ref.watch(authStateChangesProvider).value?.uid;
  return ReviewController(
    ref.watch(databaseRepositoryProvider),
    ref.watch(vocabularyRepositoryProvider),
    ref.watch(srsServiceProvider),
    userId,
  );
});