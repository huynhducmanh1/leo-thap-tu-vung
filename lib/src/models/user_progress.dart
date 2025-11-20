import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_progress.freezed.dart';
part 'user_progress.g.dart';

@freezed
abstract class UserProgress with _$UserProgress {
  const factory UserProgress({
    required String vocabularyId,
    required int srsStage,
    required DateTime nextReviewDate,
    
    // --- NEW SRS FIELDS ---
    @Default(0) int correctStreak,
    @Default(0) int totalReviews,
    @Default(0) int correctReviews,
    @Default(1.0) double difficultyMultiplier,
    DateTime? lastReviewDate,
    @Default(false) bool isLearned,
  }) = _UserProgress;

  factory UserProgress.fromJson(Map<String, dynamic> json) =>
      _$UserProgressFromJson(json);
}