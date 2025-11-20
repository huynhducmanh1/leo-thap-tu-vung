// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Achievement _$AchievementFromJson(Map<String, dynamic> json) => _Achievement(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  type: $enumDecode(_$AchievementTypeEnumMap, json['type']),
  requiredValue: (json['requiredValue'] as num).toInt(),
  isUnlocked: json['isUnlocked'] as bool? ?? false,
  iconName: json['iconName'] as String?,
  unlockedAt: json['unlockedAt'] == null
      ? null
      : DateTime.parse(json['unlockedAt'] as String),
);

Map<String, dynamic> _$AchievementToJson(_Achievement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$AchievementTypeEnumMap[instance.type]!,
      'requiredValue': instance.requiredValue,
      'isUnlocked': instance.isUnlocked,
      'iconName': instance.iconName,
      'unlockedAt': instance.unlockedAt?.toIso8601String(),
    };

const _$AchievementTypeEnumMap = {
  AchievementType.streak: 'streak',
  AchievementType.totalWords: 'totalWords',
  AchievementType.levelReached: 'levelReached',
  AchievementType.reviewsCompleted: 'reviewsCompleted',
  AchievementType.perfectDays: 'perfectDays',
};
