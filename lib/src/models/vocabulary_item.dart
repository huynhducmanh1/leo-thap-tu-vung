import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:leo_thap_tu_vung/src/models/word_type.dart';

part 'vocabulary_item.freezed.dart';
part 'vocabulary_item.g.dart';

@freezed
abstract class VocabularyItem with _$VocabularyItem {
  const factory VocabularyItem({
    // Mandatory fields
    required String id,
    required String word,
    required WordType wordType,
    required String vietnameseMeaning,
    required String englishDefinition,
    required String ipaPhonetic,
    required String exampleSentence,
    required String pronunciationAudioUrl, // Link to audio file in Firebase Storage

    // Optional fields
    List<String>? synonyms, // Note the name change to plural
    String? pictureUrl, // Link to image file in Firebase Storage
  }) = _VocabularyItem;

  factory VocabularyItem.fromJson(Map<String, dynamic> json) =>
      _$VocabularyItemFromJson(json);
}