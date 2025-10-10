import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement.freezed.dart';
part 'achievement.g.dart';

enum AchievementType {
  streak,
  wordsLearned,
  level,
  reviewsCompleted,
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
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}