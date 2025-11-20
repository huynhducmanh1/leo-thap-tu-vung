// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProgress _$UserProgressFromJson(Map<String, dynamic> json) =>
    _UserProgress(
      vocabularyId: json['vocabularyId'] as String,
      srsStage: (json['srsStage'] as num).toInt(),
      nextReviewDate: DateTime.parse(json['nextReviewDate'] as String),
      correctStreak: (json['correctStreak'] as num?)?.toInt() ?? 0,
      totalReviews: (json['totalReviews'] as num?)?.toInt() ?? 0,
      correctReviews: (json['correctReviews'] as num?)?.toInt() ?? 0,
      difficultyMultiplier:
          (json['difficultyMultiplier'] as num?)?.toDouble() ?? 1.0,
      lastReviewDate: json['lastReviewDate'] == null
          ? null
          : DateTime.parse(json['lastReviewDate'] as String),
      isLearned: json['isLearned'] as bool? ?? false,
    );

Map<String, dynamic> _$UserProgressToJson(_UserProgress instance) =>
    <String, dynamic>{
      'vocabularyId': instance.vocabularyId,
      'srsStage': instance.srsStage,
      'nextReviewDate': instance.nextReviewDate.toIso8601String(),
      'correctStreak': instance.correctStreak,
      'totalReviews': instance.totalReviews,
      'correctReviews': instance.correctReviews,
      'difficultyMultiplier': instance.difficultyMultiplier,
      'lastReviewDate': instance.lastReviewDate?.toIso8601String(),
      'isLearned': instance.isLearned,
    };
