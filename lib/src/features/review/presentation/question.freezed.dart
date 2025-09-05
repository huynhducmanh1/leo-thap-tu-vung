// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Question {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Question);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Question()';
}


}

/// @nodoc
class $QuestionCopyWith<$Res>  {
$QuestionCopyWith(Question _, $Res Function(Question) __);
}


/// Adds pattern-matching-related methods to [Question].
extension QuestionPatterns on Question {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MultipleChoiceQuestion value)?  multipleChoice,TResult Function( TypingQuestion value)?  typing,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MultipleChoiceQuestion() when multipleChoice != null:
return multipleChoice(_that);case TypingQuestion() when typing != null:
return typing(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MultipleChoiceQuestion value)  multipleChoice,required TResult Function( TypingQuestion value)  typing,}){
final _that = this;
switch (_that) {
case MultipleChoiceQuestion():
return multipleChoice(_that);case TypingQuestion():
return typing(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MultipleChoiceQuestion value)?  multipleChoice,TResult? Function( TypingQuestion value)?  typing,}){
final _that = this;
switch (_that) {
case MultipleChoiceQuestion() when multipleChoice != null:
return multipleChoice(_that);case TypingQuestion() when typing != null:
return typing(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( VocabularyItem correctWord,  List<VocabularyItem> options)?  multipleChoice,TResult Function( VocabularyItem wordToReview)?  typing,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MultipleChoiceQuestion() when multipleChoice != null:
return multipleChoice(_that.correctWord,_that.options);case TypingQuestion() when typing != null:
return typing(_that.wordToReview);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( VocabularyItem correctWord,  List<VocabularyItem> options)  multipleChoice,required TResult Function( VocabularyItem wordToReview)  typing,}) {final _that = this;
switch (_that) {
case MultipleChoiceQuestion():
return multipleChoice(_that.correctWord,_that.options);case TypingQuestion():
return typing(_that.wordToReview);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( VocabularyItem correctWord,  List<VocabularyItem> options)?  multipleChoice,TResult? Function( VocabularyItem wordToReview)?  typing,}) {final _that = this;
switch (_that) {
case MultipleChoiceQuestion() when multipleChoice != null:
return multipleChoice(_that.correctWord,_that.options);case TypingQuestion() when typing != null:
return typing(_that.wordToReview);case _:
  return null;

}
}

}

/// @nodoc


class MultipleChoiceQuestion implements Question {
  const MultipleChoiceQuestion({required this.correctWord, required final  List<VocabularyItem> options}): _options = options;
  

 final  VocabularyItem correctWord;
 final  List<VocabularyItem> _options;
 List<VocabularyItem> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MultipleChoiceQuestionCopyWith<MultipleChoiceQuestion> get copyWith => _$MultipleChoiceQuestionCopyWithImpl<MultipleChoiceQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MultipleChoiceQuestion&&(identical(other.correctWord, correctWord) || other.correctWord == correctWord)&&const DeepCollectionEquality().equals(other._options, _options));
}


@override
int get hashCode => Object.hash(runtimeType,correctWord,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'Question.multipleChoice(correctWord: $correctWord, options: $options)';
}


}

/// @nodoc
abstract mixin class $MultipleChoiceQuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory $MultipleChoiceQuestionCopyWith(MultipleChoiceQuestion value, $Res Function(MultipleChoiceQuestion) _then) = _$MultipleChoiceQuestionCopyWithImpl;
@useResult
$Res call({
 VocabularyItem correctWord, List<VocabularyItem> options
});


$VocabularyItemCopyWith<$Res> get correctWord;

}
/// @nodoc
class _$MultipleChoiceQuestionCopyWithImpl<$Res>
    implements $MultipleChoiceQuestionCopyWith<$Res> {
  _$MultipleChoiceQuestionCopyWithImpl(this._self, this._then);

  final MultipleChoiceQuestion _self;
  final $Res Function(MultipleChoiceQuestion) _then;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? correctWord = null,Object? options = null,}) {
  return _then(MultipleChoiceQuestion(
correctWord: null == correctWord ? _self.correctWord : correctWord // ignore: cast_nullable_to_non_nullable
as VocabularyItem,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<VocabularyItem>,
  ));
}

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VocabularyItemCopyWith<$Res> get correctWord {
  
  return $VocabularyItemCopyWith<$Res>(_self.correctWord, (value) {
    return _then(_self.copyWith(correctWord: value));
  });
}
}

/// @nodoc


class TypingQuestion implements Question {
  const TypingQuestion({required this.wordToReview});
  

 final  VocabularyItem wordToReview;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypingQuestionCopyWith<TypingQuestion> get copyWith => _$TypingQuestionCopyWithImpl<TypingQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypingQuestion&&(identical(other.wordToReview, wordToReview) || other.wordToReview == wordToReview));
}


@override
int get hashCode => Object.hash(runtimeType,wordToReview);

@override
String toString() {
  return 'Question.typing(wordToReview: $wordToReview)';
}


}

/// @nodoc
abstract mixin class $TypingQuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory $TypingQuestionCopyWith(TypingQuestion value, $Res Function(TypingQuestion) _then) = _$TypingQuestionCopyWithImpl;
@useResult
$Res call({
 VocabularyItem wordToReview
});


$VocabularyItemCopyWith<$Res> get wordToReview;

}
/// @nodoc
class _$TypingQuestionCopyWithImpl<$Res>
    implements $TypingQuestionCopyWith<$Res> {
  _$TypingQuestionCopyWithImpl(this._self, this._then);

  final TypingQuestion _self;
  final $Res Function(TypingQuestion) _then;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? wordToReview = null,}) {
  return _then(TypingQuestion(
wordToReview: null == wordToReview ? _self.wordToReview : wordToReview // ignore: cast_nullable_to_non_nullable
as VocabularyItem,
  ));
}

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VocabularyItemCopyWith<$Res> get wordToReview {
  
  return $VocabularyItemCopyWith<$Res>(_self.wordToReview, (value) {
    return _then(_self.copyWith(wordToReview: value));
  });
}
}

// dart format on
