// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LessonState {

 List<VocabularyItem> get words; int get currentIndex; bool get isLoading; String? get errorMessage;
/// Create a copy of LessonState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonStateCopyWith<LessonState> get copyWith => _$LessonStateCopyWithImpl<LessonState>(this as LessonState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonState&&const DeepCollectionEquality().equals(other.words, words)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(words),currentIndex,isLoading,errorMessage);

@override
String toString() {
  return 'LessonState(words: $words, currentIndex: $currentIndex, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $LessonStateCopyWith<$Res>  {
  factory $LessonStateCopyWith(LessonState value, $Res Function(LessonState) _then) = _$LessonStateCopyWithImpl;
@useResult
$Res call({
 List<VocabularyItem> words, int currentIndex, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$LessonStateCopyWithImpl<$Res>
    implements $LessonStateCopyWith<$Res> {
  _$LessonStateCopyWithImpl(this._self, this._then);

  final LessonState _self;
  final $Res Function(LessonState) _then;

/// Create a copy of LessonState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? words = null,Object? currentIndex = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
words: null == words ? _self.words : words // ignore: cast_nullable_to_non_nullable
as List<VocabularyItem>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LessonState].
extension LessonStatePatterns on LessonState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LessonState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LessonState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LessonState value)  $default,){
final _that = this;
switch (_that) {
case _LessonState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LessonState value)?  $default,){
final _that = this;
switch (_that) {
case _LessonState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VocabularyItem> words,  int currentIndex,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonState() when $default != null:
return $default(_that.words,_that.currentIndex,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VocabularyItem> words,  int currentIndex,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _LessonState():
return $default(_that.words,_that.currentIndex,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VocabularyItem> words,  int currentIndex,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _LessonState() when $default != null:
return $default(_that.words,_that.currentIndex,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _LessonState implements LessonState {
  const _LessonState({final  List<VocabularyItem> words = const [], this.currentIndex = 0, this.isLoading = true, this.errorMessage}): _words = words;
  

 final  List<VocabularyItem> _words;
@override@JsonKey() List<VocabularyItem> get words {
  if (_words is EqualUnmodifiableListView) return _words;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_words);
}

@override@JsonKey() final  int currentIndex;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of LessonState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonStateCopyWith<_LessonState> get copyWith => __$LessonStateCopyWithImpl<_LessonState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonState&&const DeepCollectionEquality().equals(other._words, _words)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_words),currentIndex,isLoading,errorMessage);

@override
String toString() {
  return 'LessonState(words: $words, currentIndex: $currentIndex, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$LessonStateCopyWith<$Res> implements $LessonStateCopyWith<$Res> {
  factory _$LessonStateCopyWith(_LessonState value, $Res Function(_LessonState) _then) = __$LessonStateCopyWithImpl;
@override @useResult
$Res call({
 List<VocabularyItem> words, int currentIndex, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$LessonStateCopyWithImpl<$Res>
    implements _$LessonStateCopyWith<$Res> {
  __$LessonStateCopyWithImpl(this._self, this._then);

  final _LessonState _self;
  final $Res Function(_LessonState) _then;

/// Create a copy of LessonState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? words = null,Object? currentIndex = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_LessonState(
words: null == words ? _self._words : words // ignore: cast_nullable_to_non_nullable
as List<VocabularyItem>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
