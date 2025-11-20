import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement.freezed.dart';
part 'achievement.g.dart';

enum AchievementType {
  streak,
  totalWords, // Changed from 'wordsLearned' to match your Service
  levelReached,
  reviewsCompleted,
  perfectDays,
}

@freezed
abstract class Achievement with _$Achievement {
  const factory Achievement({
    required String id,
    required String title,
    required String description,
    required AchievementType type,
    required int requiredValue,
    @Default(false) bool isUnlocked,
    // NEW FIELDS needed by your Service
    String? iconName, 
    DateTime? unlockedAt,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}