import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String email,
    @Default(1) int level,
    @Default(0) int xp,
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    @Default(0) int totalWordsLearned,
    @Default(0) int totalReviewsCompleted,
    @TimestampConverter() DateTime? lastStudyDate,
    @Default([]) List<String> unlockedAchievements,
    String? activeCourseId,
    @Default('beginner') String difficultyLevel,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}