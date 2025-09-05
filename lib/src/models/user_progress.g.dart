// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProgress _$UserProgressFromJson(Map<String, dynamic> json) =>
    _UserProgress(
      vocabularyId: json['vocabularyId'] as String,
      srsStage: (json['srsStage'] as num).toInt(),
      nextReviewDate: const TimestampConverter().fromJson(
        json['nextReviewDate'] as Timestamp,
      ),
    );

Map<String, dynamic> _$UserProgressToJson(
  _UserProgress instance,
) => <String, dynamic>{
  'vocabularyId': instance.vocabularyId,
  'srsStage': instance.srsStage,
  'nextReviewDate': const TimestampConverter().toJson(instance.nextReviewDate),
};
