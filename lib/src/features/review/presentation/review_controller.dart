import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leo_thap_tu_vung/src/features/auth/presentation/auth_providers.dart';
import 'package:leo_thap_tu_vung/src/features/review/presentation/question.dart';
import 'package:leo_thap_tu_vung/src/features/vocabulary/data/database_providers.dart';
import 'package:leo_thap_tu_vung/src/features/vocabulary/data/database_repository.dart';
import 'package:leo_thap_tu_vung/src/features/vocabulary/data/vocabulary_repository.dart';
import 'package:leo_thap_tu_vung/src/models/user_progress.dart';
import 'package:leo_thap_tu_vung/src/models/vocabulary_item.dart';
import 'package:leo_thap_tu_vung/src/services/srs_service.dart';

part 'review_controller.freezed.dart';

class AnswerResult {
  AnswerResult({
    required this.wasCorrect,
    required this.correctAnswer,
    required this.updatedProgress,
  });
  final bool wasCorrect;
  final VocabularyItem correctAnswer;
  final UserProgress updatedProgress;
}

@freezed
abstract class ReviewState with _$ReviewState {
  const factory ReviewState({
    @Default(true) bool isLoading,
    String? errorMessage,
    @Default([]) List<UserProgress> reviewQueue,
    @Default(0) int currentIndex,
    Question? currentQuestion,
    AnswerResult? lastAnswerResult,
  }) = _ReviewState;
}

class ReviewController extends StateNotifier<ReviewState> {
  ReviewController(
    this._databaseRepository,
    this._vocabularyRepository,
    this._srsService,
    this._userId,
  ) : super(const ReviewState()) {
    _fetchAndGenerateFirstQuestion();
  }

  final DatabaseRepository _databaseRepository;
  final VocabularyRepository _vocabularyRepository;
  final SrsService _srsService;
  final String? _userId;

  Future<void> _fetchAndGenerateFirstQuestion() async {
    if (_userId == null) {
      state = state.copyWith(isLoading: false);
      return;
    }
    try {
      final progressList = await _databaseRepository.getReviewQueue(userId: _userId!);
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
    final progress = state.reviewQueue[state.currentIndex];
    final allVocab = await _vocabularyRepository.getInitialVocabulary();
    final word = allVocab.firstWhereOrNull((v) => v.id == progress.vocabularyId);

    if (word == null) {
      state = state.copyWith(errorMessage: "Vocabulary item not found!");
      return;
    }

    Question question;
    if (progress.srsStage <= 4) { // Apprentice
      final distractors = allVocab.where((v) => v.id != word.id).toList();
      distractors.shuffle();
      final options = [word, ...distractors.take(3)];
      options.shuffle();
      question = Question.multipleChoice(correctWord: word, options: options);
    } else { // Guru and above
      question = Question.typing(wordToReview: word);
    }

    state = state.copyWith(currentQuestion: question, isLoading: false);
  }

  Future<void> submitAnswer(dynamic userAnswer) async {
    if (_userId == null) return;

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

    await _databaseRepository.updateUserProgress(progress: updatedProgress, userId: _userId!);

    if (isCorrect) {
      await _databaseRepository.incrementXpForUser(userId: _userId!, amount: 1);
    }

    state = state.copyWith(
      lastAnswerResult: AnswerResult(
        wasCorrect: isCorrect,
        correctAnswer: question.map(
          multipleChoice: (q) => q.correctWord,
          typing: (q) => q.wordToReview,
        ),
        updatedProgress: updatedProgress,
      ),
    );
  }

  Future<void> nextItem() async {
    if (state.currentIndex < state.reviewQueue.length - 1) {
      state = state.copyWith(
        currentIndex: state.currentIndex + 1,
        lastAnswerResult: null,
        currentQuestion: null, // Set to null to show loading for next question
      );
      await _generateQuestionForCurrentIndex();
    } else {
      print("Review session complete!");
      // This is where we will navigate to the summary screen
      state = state.copyWith(lastAnswerResult: null, reviewQueue: []);
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