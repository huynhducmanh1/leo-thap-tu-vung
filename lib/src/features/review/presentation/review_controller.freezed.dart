// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReviewState {

 bool get isLoading; String? get errorMessage; List<UserProgress> get reviewQueue; int get currentIndex; Question? get currentQuestion; AnswerResult? get lastAnswerResult; UserProfile? get currentUserProfile;
/// Create a copy of ReviewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewStateCopyWith<ReviewState> get copyWith => _$ReviewStateCopyWithImpl<ReviewState>(this as ReviewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.reviewQueue, reviewQueue)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.currentQuestion, currentQuestion) || other.currentQuestion == currentQuestion)&&(identical(other.lastAnswerResult, lastAnswerResult) || other.lastAnswerResult == lastAnswerResult)&&(identical(other.currentUserProfile, currentUserProfile) || other.currentUserProfile == currentUserProfile));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,errorMessage,const DeepCollectionEquality().hash(reviewQueue),currentIndex,currentQuestion,lastAnswerResult,currentUserProfile);

@override
String toString() {
  return 'ReviewState(isLoading: $isLoading, errorMessage: $errorMessage, reviewQueue: $reviewQueue, currentIndex: $currentIndex, currentQuestion: $currentQuestion, lastAnswerResult: $lastAnswerResult, currentUserProfile: $currentUserProfile)';
}


}

/// @nodoc
abstract mixin class $ReviewStateCopyWith<$Res>  {
  factory $ReviewStateCopyWith(ReviewState value, $Res Function(ReviewState) _then) = _$ReviewStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? errorMessage, List<UserProgress> reviewQueue, int currentIndex, Question? currentQuestion, AnswerResult? lastAnswerResult, UserProfile? currentUserProfile
});


$QuestionCopyWith<$Res>? get currentQuestion;$UserProfileCopyWith<$Res>? get currentUserProfile;

}
/// @nodoc
class _$ReviewStateCopyWithImpl<$Res>
    implements $ReviewStateCopyWith<$Res> {
  _$ReviewStateCopyWithImpl(this._self, this._then);

  final ReviewState _self;
  final $Res Function(ReviewState) _then;

/// Create a copy of ReviewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? errorMessage = freezed,Object? reviewQueue = null,Object? currentIndex = null,Object? currentQuestion = freezed,Object? lastAnswerResult = freezed,Object? currentUserProfile = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,reviewQueue: null == reviewQueue ? _self.reviewQueue : reviewQueue // ignore: cast_nullable_to_non_nullable
as List<UserProgress>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,currentQuestion: freezed == currentQuestion ? _self.currentQuestion : currentQuestion // ignore: cast_nullable_to_non_nullable
as Question?,lastAnswerResult: freezed == lastAnswerResult ? _self.lastAnswerResult : lastAnswerResult // ignore: cast_nullable_to_non_nullable
as AnswerResult?,currentUserProfile: freezed == currentUserProfile ? _self.currentUserProfile : currentUserProfile // ignore: cast_nullable_to_non_nullable
as UserProfile?,
  ));
}
/// Create a copy of ReviewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionCopyWith<$Res>? get currentQuestion {
    if (_self.currentQuestion == null) {
    return null;
  }

  return $QuestionCopyWith<$Res>(_self.currentQuestion!, (value) {
    return _then(_self.copyWith(currentQuestion: value));
  });
}/// Create a copy of ReviewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get currentUserProfile {
    if (_self.currentUserProfile == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.currentUserProfile!, (value) {
    return _then(_self.copyWith(currentUserProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReviewState].
extension ReviewStatePatterns on ReviewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewState value)  $default,){
final _that = this;
switch (_that) {
case _ReviewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewState value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? errorMessage,  List<UserProgress> reviewQueue,  int currentIndex,  Question? currentQuestion,  AnswerResult? lastAnswerResult,  UserProfile? currentUserProfile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewState() when $default != null:
return $default(_that.isLoading,_that.errorMessage,_that.reviewQueue,_that.currentIndex,_that.currentQuestion,_that.lastAnswerResult,_that.currentUserProfile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? errorMessage,  List<UserProgress> reviewQueue,  int currentIndex,  Question? currentQuestion,  AnswerResult? lastAnswerResult,  UserProfile? currentUserProfile)  $default,) {final _that = this;
switch (_that) {
case _ReviewState():
return $default(_that.isLoading,_that.errorMessage,_that.reviewQueue,_that.currentIndex,_that.currentQuestion,_that.lastAnswerResult,_that.currentUserProfile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? errorMessage,  List<UserProgress> reviewQueue,  int currentIndex,  Question? currentQuestion,  AnswerResult? lastAnswerResult,  UserProfile? currentUserProfile)?  $default,) {final _that = this;
switch (_that) {
case _ReviewState() when $default != null:
return $default(_that.isLoading,_that.errorMessage,_that.reviewQueue,_that.currentIndex,_that.currentQuestion,_that.lastAnswerResult,_that.currentUserProfile);case _:
  return null;

}
}

}

/// @nodoc


class _ReviewState implements ReviewState {
  const _ReviewState({this.isLoading = true, this.errorMessage, final  List<UserProgress> reviewQueue = const [], this.currentIndex = 0, this.currentQuestion, this.lastAnswerResult, this.currentUserProfile}): _reviewQueue = reviewQueue;
  

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
 final  List<UserProgress> _reviewQueue;
@override@JsonKey() List<UserProgress> get reviewQueue {
  if (_reviewQueue is EqualUnmodifiableListView) return _reviewQueue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviewQueue);
}

@override@JsonKey() final  int currentIndex;
@override final  Question? currentQuestion;
@override final  AnswerResult? lastAnswerResult;
@override final  UserProfile? currentUserProfile;

/// Create a copy of ReviewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewStateCopyWith<_ReviewState> get copyWith => __$ReviewStateCopyWithImpl<_ReviewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._reviewQueue, _reviewQueue)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.currentQuestion, currentQuestion) || other.currentQuestion == currentQuestion)&&(identical(other.lastAnswerResult, lastAnswerResult) || other.lastAnswerResult == lastAnswerResult)&&(identical(other.currentUserProfile, currentUserProfile) || other.currentUserProfile == currentUserProfile));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,errorMessage,const DeepCollectionEquality().hash(_reviewQueue),currentIndex,currentQuestion,lastAnswerResult,currentUserProfile);

@override
String toString() {
  return 'ReviewState(isLoading: $isLoading, errorMessage: $errorMessage, reviewQueue: $reviewQueue, currentIndex: $currentIndex, currentQuestion: $currentQuestion, lastAnswerResult: $lastAnswerResult, currentUserProfile: $currentUserProfile)';
}


}

/// @nodoc
abstract mixin class _$ReviewStateCopyWith<$Res> implements $ReviewStateCopyWith<$Res> {
  factory _$ReviewStateCopyWith(_ReviewState value, $Res Function(_ReviewState) _then) = __$ReviewStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? errorMessage, List<UserProgress> reviewQueue, int currentIndex, Question? currentQuestion, AnswerResult? lastAnswerResult, UserProfile? currentUserProfile
});


@override $QuestionCopyWith<$Res>? get currentQuestion;@override $UserProfileCopyWith<$Res>? get currentUserProfile;

}
/// @nodoc
class __$ReviewStateCopyWithImpl<$Res>
    implements _$ReviewStateCopyWith<$Res> {
  __$ReviewStateCopyWithImpl(this._self, this._then);

  final _ReviewState _self;
  final $Res Function(_ReviewState) _then;

/// Create a copy of ReviewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? errorMessage = freezed,Object? reviewQueue = null,Object? currentIndex = null,Object? currentQuestion = freezed,Object? lastAnswerResult = freezed,Object? currentUserProfile = freezed,}) {
  return _then(_ReviewState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,reviewQueue: null == reviewQueue ? _self._reviewQueue : reviewQueue // ignore: cast_nullable_to_non_nullable
as List<UserProgress>,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,currentQuestion: freezed == currentQuestion ? _self.currentQuestion : currentQuestion // ignore: cast_nullable_to_non_nullable
as Question?,lastAnswerResult: freezed == lastAnswerResult ? _self.lastAnswerResult : lastAnswerResult // ignore: cast_nullable_to_non_nullable
as AnswerResult?,currentUserProfile: freezed == currentUserProfile ? _self.currentUserProfile : currentUserProfile // ignore: cast_nullable_to_non_nullable
as UserProfile?,
  ));
}

/// Create a copy of ReviewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionCopyWith<$Res>? get currentQuestion {
    if (_self.currentQuestion == null) {
    return null;
  }

  return $QuestionCopyWith<$Res>(_self.currentQuestion!, (value) {
    return _then(_self.copyWith(currentQuestion: value));
  });
}/// Create a copy of ReviewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get currentUserProfile {
    if (_self.currentUserProfile == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.currentUserProfile!, (value) {
    return _then(_self.copyWith(currentUserProfile: value));
  });
}
}

// dart format on
