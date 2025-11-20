// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  id: json['id'] as String,
  email: json['email'] as String,
  level: (json['level'] as num?)?.toInt() ?? 1,
  xp: (json['xp'] as num?)?.toInt() ?? 0,
  activeCourseId: json['activeCourseId'] as String?,
  currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
  longestStreak: (json['longestStreak'] as num?)?.toInt() ?? 0,
  totalWordsLearned: (json['totalWordsLearned'] as num?)?.toInt() ?? 0,
  totalReviewsCompleted: (json['totalReviewsCompleted'] as num?)?.toInt() ?? 0,
  lastStudyDate: json['lastStudyDate'] == null
      ? null
      : DateTime.parse(json['lastStudyDate'] as String),
  unlockedAchievements:
      (json['unlockedAchievements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'level': instance.level,
      'xp': instance.xp,
      'activeCourseId': instance.activeCourseId,
      'currentStreak': instance.currentStreak,
      'longestStreak': instance.longestStreak,
      'totalWordsLearned': instance.totalWordsLearned,
      'totalReviewsCompleted': instance.totalReviewsCompleted,
      'lastStudyDate': instance.lastStudyDate?.toIso8601String(),
      'unlockedAchievements': instance.unlockedAchievements,
    };
