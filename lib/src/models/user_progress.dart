import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_progress.freezed.dart';
part 'user_progress.g.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();
  @override
  DateTime fromJson(Timestamp timestamp) => timestamp.toDate();
  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

@freezed
abstract class UserProgress with _$UserProgress {
  const factory UserProgress({
    required String vocabularyId,
    required int srsStage,
    @TimestampConverter() required DateTime nextReviewDate,
    
    // --- NEW FIELDS REQUIRED FOR REVIEW CONTROLLER ---
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