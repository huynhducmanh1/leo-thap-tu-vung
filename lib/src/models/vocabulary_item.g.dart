// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VocabularyItem _$VocabularyItemFromJson(Map<String, dynamic> json) =>
    _VocabularyItem(
      id: json['id'] as String,
      word: json['word'] as String,
      wordType: $enumDecode(_$WordTypeEnumMap, json['wordType']),
      vietnameseMeaning: json['vietnameseMeaning'] as String,
      englishDefinition: json['englishDefinition'] as String,
      ipaPhonetic: json['ipaPhonetic'] as String,
      exampleSentence: json['exampleSentence'] as String,
      pronunciationAudioUrl: json['pronunciationAudioUrl'] as String,
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pictureUrl: json['pictureUrl'] as String?,
    );

Map<String, dynamic> _$VocabularyItemToJson(_VocabularyItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'wordType': _$WordTypeEnumMap[instance.wordType]!,
      'vietnameseMeaning': instance.vietnameseMeaning,
      'englishDefinition': instance.englishDefinition,
      'ipaPhonetic': instance.ipaPhonetic,
      'exampleSentence': instance.exampleSentence,
      'pronunciationAudioUrl': instance.pronunciationAudioUrl,
      'synonyms': instance.synonyms,
      'pictureUrl': instance.pictureUrl,
    };

const _$WordTypeEnumMap = {
  WordType.noun: 'noun',
  WordType.verb: 'verb',
  WordType.adjective: 'adjective',
  WordType.adverb: 'adverb',
  WordType.preposition: 'preposition',
  WordType.pronoun: 'pronoun',
  WordType.other: 'other',
};
