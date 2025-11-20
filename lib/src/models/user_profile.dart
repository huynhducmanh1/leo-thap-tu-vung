import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String email,
    @Default(1) int level,
    @Default(0) int xp,
    String? activeCourseId,
    
    // --- NEW GAMIFICATION FIELDS ---
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    @Default(0) int totalWordsLearned,
    @Default(0) int totalReviewsCompleted,
    DateTime? lastStudyDate,
    @Default([]) List<String> unlockedAchievements, 
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}