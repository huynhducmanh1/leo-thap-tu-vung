import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leo_thap_tu_vung/src/features/auth/presentation/auth_providers.dart';
import 'package:leo_thap_tu_vung/src/features/review/presentation/review_controller.dart';
import 'package:leo_thap_tu_vung/src/features/vocabulary/data/database_providers.dart';
import 'package:leo_thap_tu_vung/src/features/vocabulary/data/database_repository.dart';
import 'package:leo_thap_tu_vung/src/features/vocabulary/data/vocabulary_repository.dart';
import 'package:leo_thap_tu_vung/src/models/user_progress.dart';
import 'package:leo_thap_tu_vung/src/models/vocabulary_item.dart';

part 'lesson_controller.freezed.dart';

@freezed
abstract class LessonState with _$LessonState {
  const factory LessonState({
    @Default([]) List<VocabularyItem> words,
    @Default(0) int currentIndex,
    @Default(true) bool isLoading,
    String? errorMessage,
  }) = _LessonState;
}

class LessonController extends StateNotifier<LessonState> {
  // The controller now needs more information to do its job
  LessonController(
    this._vocabularyRepository,
    this._databaseRepository,
    this._userId,
    this._ref, // We pass in the ref to invalidate other providers
  ) : super(const LessonState()) {
    _fetchLessons();
  }

  final VocabularyRepository _vocabularyRepository;
  final DatabaseRepository _databaseRepository;
  final String? _userId;
  final Ref _ref;

  Future<void> _fetchLessons() async {
    // In the future, this will be much smarter, fetching words the user hasn't seen.
    // For now, we fetch the first 5 words from our test JSON.
    try {
      final allWords = await _vocabularyRepository.getInitialVocabulary();
      final lessonWords = allWords.take(5).toList();
      state = state.copyWith(words: lessonWords, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  void nextWord() {
    if (state.currentIndex < state.words.length - 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    }
  }

  // This is the new method to save progress
  Future<void> completeLessonSession() async {
    if (_userId == null) return; // Can't save progress if not logged in

    for (final word in state.words) {
      final progress = UserProgress(
        vocabularyId: word.id,
        srsStage: 1, // Start at Apprentice 1
        nextReviewDate: DateTime.now(), // Make it available for review now
      );
      await _databaseRepository.updateUserProgress(progress: progress, userId: _userId!);
    }

    // Invalidate the review controller so the HomeScreen count updates
    _ref.invalidate(reviewControllerProvider);
    print("Lesson session completed and progress saved for ${state.words.length} words.");
  }
}

final vocabularyRepositoryProvider = Provider((ref) => VocabularyRepository());

final lessonControllerProvider =
    StateNotifierProvider.autoDispose<LessonController, LessonState>((ref) {
  final vocabRepo = ref.watch(vocabularyRepositoryProvider);
  final dbRepo = ref.watch(databaseRepositoryProvider);
  final userId = ref.watch(authStateChangesProvider).value?.uid;
  // We pass the ref itself so the controller can invalidate other providers
  return LessonController(vocabRepo, dbRepo, userId, ref);
});