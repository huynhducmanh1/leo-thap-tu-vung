// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocabulary_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VocabularyItem {

// Mandatory fields
 String get id; String get word; WordType get wordType; String get vietnameseMeaning; String get englishDefinition; String get ipaPhonetic; String get exampleSentence; String get pronunciationAudioUrl;// Link to audio file in Firebase Storage
// Optional fields
 List<String>? get synonyms;// Note the name change to plural
 String? get pictureUrl;
/// Create a copy of VocabularyItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VocabularyItemCopyWith<VocabularyItem> get copyWith => _$VocabularyItemCopyWithImpl<VocabularyItem>(this as VocabularyItem, _$identity);

  /// Serializes this VocabularyItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VocabularyItem&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.wordType, wordType) || other.wordType == wordType)&&(identical(other.vietnameseMeaning, vietnameseMeaning) || other.vietnameseMeaning == vietnameseMeaning)&&(identical(other.englishDefinition, englishDefinition) || other.englishDefinition == englishDefinition)&&(identical(other.ipaPhonetic, ipaPhonetic) || other.ipaPhonetic == ipaPhonetic)&&(identical(other.exampleSentence, exampleSentence) || other.exampleSentence == exampleSentence)&&(identical(other.pronunciationAudioUrl, pronunciationAudioUrl) || other.pronunciationAudioUrl == pronunciationAudioUrl)&&const DeepCollectionEquality().equals(other.synonyms, synonyms)&&(identical(other.pictureUrl, pictureUrl) || other.pictureUrl == pictureUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,word,wordType,vietnameseMeaning,englishDefinition,ipaPhonetic,exampleSentence,pronunciationAudioUrl,const DeepCollectionEquality().hash(synonyms),pictureUrl);

@override
String toString() {
  return 'VocabularyItem(id: $id, word: $word, wordType: $wordType, vietnameseMeaning: $vietnameseMeaning, englishDefinition: $englishDefinition, ipaPhonetic: $ipaPhonetic, exampleSentence: $exampleSentence, pronunciationAudioUrl: $pronunciationAudioUrl, synonyms: $synonyms, pictureUrl: $pictureUrl)';
}


}

/// @nodoc
abstract mixin class $VocabularyItemCopyWith<$Res>  {
  factory $VocabularyItemCopyWith(VocabularyItem value, $Res Function(VocabularyItem) _then) = _$VocabularyItemCopyWithImpl;
@useResult
$Res call({
 String id, String word, WordType wordType, String vietnameseMeaning, String englishDefinition, String ipaPhonetic, String exampleSentence, String pronunciationAudioUrl, List<String>? synonyms, String? pictureUrl
});




}
/// @nodoc
class _$VocabularyItemCopyWithImpl<$Res>
    implements $VocabularyItemCopyWith<$Res> {
  _$VocabularyItemCopyWithImpl(this._self, this._then);

  final VocabularyItem _self;
  final $Res Function(VocabularyItem) _then;

/// Create a copy of VocabularyItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? word = null,Object? wordType = null,Object? vietnameseMeaning = null,Object? englishDefinition = null,Object? ipaPhonetic = null,Object? exampleSentence = null,Object? pronunciationAudioUrl = null,Object? synonyms = freezed,Object? pictureUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,wordType: null == wordType ? _self.wordType : wordType // ignore: cast_nullable_to_non_nullable
as WordType,vietnameseMeaning: null == vietnameseMeaning ? _self.vietnameseMeaning : vietnameseMeaning // ignore: cast_nullable_to_non_nullable
as String,englishDefinition: null == englishDefinition ? _self.englishDefinition : englishDefinition // ignore: cast_nullable_to_non_nullable
as String,ipaPhonetic: null == ipaPhonetic ? _self.ipaPhonetic : ipaPhonetic // ignore: cast_nullable_to_non_nullable
as String,exampleSentence: null == exampleSentence ? _self.exampleSentence : exampleSentence // ignore: cast_nullable_to_non_nullable
as String,pronunciationAudioUrl: null == pronunciationAudioUrl ? _self.pronunciationAudioUrl : pronunciationAudioUrl // ignore: cast_nullable_to_non_nullable
as String,synonyms: freezed == synonyms ? _self.synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>?,pictureUrl: freezed == pictureUrl ? _self.pictureUrl : pictureUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VocabularyItem].
extension VocabularyItemPatterns on VocabularyItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VocabularyItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VocabularyItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VocabularyItem value)  $default,){
final _that = this;
switch (_that) {
case _VocabularyItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VocabularyItem value)?  $default,){
final _that = this;
switch (_that) {
case _VocabularyItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String word,  WordType wordType,  String vietnameseMeaning,  String englishDefinition,  String ipaPhonetic,  String exampleSentence,  String pronunciationAudioUrl,  List<String>? synonyms,  String? pictureUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VocabularyItem() when $default != null:
return $default(_that.id,_that.word,_that.wordType,_that.vietnameseMeaning,_that.englishDefinition,_that.ipaPhonetic,_that.exampleSentence,_that.pronunciationAudioUrl,_that.synonyms,_that.pictureUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String word,  WordType wordType,  String vietnameseMeaning,  String englishDefinition,  String ipaPhonetic,  String exampleSentence,  String pronunciationAudioUrl,  List<String>? synonyms,  String? pictureUrl)  $default,) {final _that = this;
switch (_that) {
case _VocabularyItem():
return $default(_that.id,_that.word,_that.wordType,_that.vietnameseMeaning,_that.englishDefinition,_that.ipaPhonetic,_that.exampleSentence,_that.pronunciationAudioUrl,_that.synonyms,_that.pictureUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String word,  WordType wordType,  String vietnameseMeaning,  String englishDefinition,  String ipaPhonetic,  String exampleSentence,  String pronunciationAudioUrl,  List<String>? synonyms,  String? pictureUrl)?  $default,) {final _that = this;
switch (_that) {
case _VocabularyItem() when $default != null:
return $default(_that.id,_that.word,_that.wordType,_that.vietnameseMeaning,_that.englishDefinition,_that.ipaPhonetic,_that.exampleSentence,_that.pronunciationAudioUrl,_that.synonyms,_that.pictureUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VocabularyItem implements VocabularyItem {
  const _VocabularyItem({required this.id, required this.word, required this.wordType, required this.vietnameseMeaning, required this.englishDefinition, required this.ipaPhonetic, required this.exampleSentence, required this.pronunciationAudioUrl, final  List<String>? synonyms, this.pictureUrl}): _synonyms = synonyms;
  factory _VocabularyItem.fromJson(Map<String, dynamic> json) => _$VocabularyItemFromJson(json);

// Mandatory fields
@override final  String id;
@override final  String word;
@override final  WordType wordType;
@override final  String vietnameseMeaning;
@override final  String englishDefinition;
@override final  String ipaPhonetic;
@override final  String exampleSentence;
@override final  String pronunciationAudioUrl;
// Link to audio file in Firebase Storage
// Optional fields
 final  List<String>? _synonyms;
// Link to audio file in Firebase Storage
// Optional fields
@override List<String>? get synonyms {
  final value = _synonyms;
  if (value == null) return null;
  if (_synonyms is EqualUnmodifiableListView) return _synonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Note the name change to plural
@override final  String? pictureUrl;

/// Create a copy of VocabularyItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VocabularyItemCopyWith<_VocabularyItem> get copyWith => __$VocabularyItemCopyWithImpl<_VocabularyItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VocabularyItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VocabularyItem&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.wordType, wordType) || other.wordType == wordType)&&(identical(other.vietnameseMeaning, vietnameseMeaning) || other.vietnameseMeaning == vietnameseMeaning)&&(identical(other.englishDefinition, englishDefinition) || other.englishDefinition == englishDefinition)&&(identical(other.ipaPhonetic, ipaPhonetic) || other.ipaPhonetic == ipaPhonetic)&&(identical(other.exampleSentence, exampleSentence) || other.exampleSentence == exampleSentence)&&(identical(other.pronunciationAudioUrl, pronunciationAudioUrl) || other.pronunciationAudioUrl == pronunciationAudioUrl)&&const DeepCollectionEquality().equals(other._synonyms, _synonyms)&&(identical(other.pictureUrl, pictureUrl) || other.pictureUrl == pictureUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,word,wordType,vietnameseMeaning,englishDefinition,ipaPhonetic,exampleSentence,pronunciationAudioUrl,const DeepCollectionEquality().hash(_synonyms),pictureUrl);

@override
String toString() {
  return 'VocabularyItem(id: $id, word: $word, wordType: $wordType, vietnameseMeaning: $vietnameseMeaning, englishDefinition: $englishDefinition, ipaPhonetic: $ipaPhonetic, exampleSentence: $exampleSentence, pronunciationAudioUrl: $pronunciationAudioUrl, synonyms: $synonyms, pictureUrl: $pictureUrl)';
}


}

/// @nodoc
abstract mixin class _$VocabularyItemCopyWith<$Res> implements $VocabularyItemCopyWith<$Res> {
  factory _$VocabularyItemCopyWith(_VocabularyItem value, $Res Function(_VocabularyItem) _then) = __$VocabularyItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String word, WordType wordType, String vietnameseMeaning, String englishDefinition, String ipaPhonetic, String exampleSentence, String pronunciationAudioUrl, List<String>? synonyms, String? pictureUrl
});




}
/// @nodoc
class __$VocabularyItemCopyWithImpl<$Res>
    implements _$VocabularyItemCopyWith<$Res> {
  __$VocabularyItemCopyWithImpl(this._self, this._then);

  final _VocabularyItem _self;
  final $Res Function(_VocabularyItem) _then;

/// Create a copy of VocabularyItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? word = null,Object? wordType = null,Object? vietnameseMeaning = null,Object? englishDefinition = null,Object? ipaPhonetic = null,Object? exampleSentence = null,Object? pronunciationAudioUrl = null,Object? synonyms = freezed,Object? pictureUrl = freezed,}) {
  return _then(_VocabularyItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,wordType: null == wordType ? _self.wordType : wordType // ignore: cast_nullable_to_non_nullable
as WordType,vietnameseMeaning: null == vietnameseMeaning ? _self.vietnameseMeaning : vietnameseMeaning // ignore: cast_nullable_to_non_nullable
as String,englishDefinition: null == englishDefinition ? _self.englishDefinition : englishDefinition // ignore: cast_nullable_to_non_nullable
as String,ipaPhonetic: null == ipaPhonetic ? _self.ipaPhonetic : ipaPhonetic // ignore: cast_nullable_to_non_nullable
as String,exampleSentence: null == exampleSentence ? _self.exampleSentence : exampleSentence // ignore: cast_nullable_to_non_nullable
as String,pronunciationAudioUrl: null == pronunciationAudioUrl ? _self.pronunciationAudioUrl : pronunciationAudioUrl // ignore: cast_nullable_to_non_nullable
as String,synonyms: freezed == synonyms ? _self._synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>?,pictureUrl: freezed == pictureUrl ? _self.pictureUrl : pictureUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
