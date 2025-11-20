// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProgress {

 String get vocabularyId; int get srsStage;@TimestampConverter() DateTime get nextReviewDate;// --- NEW FIELDS REQUIRED FOR REVIEW CONTROLLER ---
 int get correctStreak; int get totalReviews; int get correctReviews; double get difficultyMultiplier; DateTime? get lastReviewDate; bool get isLearned;
/// Create a copy of UserProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProgressCopyWith<UserProgress> get copyWith => _$UserProgressCopyWithImpl<UserProgress>(this as UserProgress, _$identity);

  /// Serializes this UserProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProgress&&(identical(other.vocabularyId, vocabularyId) || other.vocabularyId == vocabularyId)&&(identical(other.srsStage, srsStage) || other.srsStage == srsStage)&&(identical(other.nextReviewDate, nextReviewDate) || other.nextReviewDate == nextReviewDate)&&(identical(other.correctStreak, correctStreak) || other.correctStreak == correctStreak)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.correctReviews, correctReviews) || other.correctReviews == correctReviews)&&(identical(other.difficultyMultiplier, difficultyMultiplier) || other.difficultyMultiplier == difficultyMultiplier)&&(identical(other.lastReviewDate, lastReviewDate) || other.lastReviewDate == lastReviewDate)&&(identical(other.isLearned, isLearned) || other.isLearned == isLearned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vocabularyId,srsStage,nextReviewDate,correctStreak,totalReviews,correctReviews,difficultyMultiplier,lastReviewDate,isLearned);

@override
String toString() {
  return 'UserProgress(vocabularyId: $vocabularyId, srsStage: $srsStage, nextReviewDate: $nextReviewDate, correctStreak: $correctStreak, totalReviews: $totalReviews, correctReviews: $correctReviews, difficultyMultiplier: $difficultyMultiplier, lastReviewDate: $lastReviewDate, isLearned: $isLearned)';
}


}

/// @nodoc
abstract mixin class $UserProgressCopyWith<$Res>  {
  factory $UserProgressCopyWith(UserProgress value, $Res Function(UserProgress) _then) = _$UserProgressCopyWithImpl;
@useResult
$Res call({
 String vocabularyId, int srsStage,@TimestampConverter() DateTime nextReviewDate, int correctStreak, int totalReviews, int correctReviews, double difficultyMultiplier, DateTime? lastReviewDate, bool isLearned
});




}
/// @nodoc
class _$UserProgressCopyWithImpl<$Res>
    implements $UserProgressCopyWith<$Res> {
  _$UserProgressCopyWithImpl(this._self, this._then);

  final UserProgress _self;
  final $Res Function(UserProgress) _then;

/// Create a copy of UserProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vocabularyId = null,Object? srsStage = null,Object? nextReviewDate = null,Object? correctStreak = null,Object? totalReviews = null,Object? correctReviews = null,Object? difficultyMultiplier = null,Object? lastReviewDate = freezed,Object? isLearned = null,}) {
  return _then(_self.copyWith(
vocabularyId: null == vocabularyId ? _self.vocabularyId : vocabularyId // ignore: cast_nullable_to_non_nullable
as String,srsStage: null == srsStage ? _self.srsStage : srsStage // ignore: cast_nullable_to_non_nullable
as int,nextReviewDate: null == nextReviewDate ? _self.nextReviewDate : nextReviewDate // ignore: cast_nullable_to_non_nullable
as DateTime,correctStreak: null == correctStreak ? _self.correctStreak : correctStreak // ignore: cast_nullable_to_non_nullable
as int,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,correctReviews: null == correctReviews ? _self.correctReviews : correctReviews // ignore: cast_nullable_to_non_nullable
as int,difficultyMultiplier: null == difficultyMultiplier ? _self.difficultyMultiplier : difficultyMultiplier // ignore: cast_nullable_to_non_nullable
as double,lastReviewDate: freezed == lastReviewDate ? _self.lastReviewDate : lastReviewDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isLearned: null == isLearned ? _self.isLearned : isLearned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProgress].
extension UserProgressPatterns on UserProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProgress value)  $default,){
final _that = this;
switch (_that) {
case _UserProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProgress value)?  $default,){
final _that = this;
switch (_that) {
case _UserProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String vocabularyId,  int srsStage, @TimestampConverter()  DateTime nextReviewDate,  int correctStreak,  int totalReviews,  int correctReviews,  double difficultyMultiplier,  DateTime? lastReviewDate,  bool isLearned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProgress() when $default != null:
return $default(_that.vocabularyId,_that.srsStage,_that.nextReviewDate,_that.correctStreak,_that.totalReviews,_that.correctReviews,_that.difficultyMultiplier,_that.lastReviewDate,_that.isLearned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String vocabularyId,  int srsStage, @TimestampConverter()  DateTime nextReviewDate,  int correctStreak,  int totalReviews,  int correctReviews,  double difficultyMultiplier,  DateTime? lastReviewDate,  bool isLearned)  $default,) {final _that = this;
switch (_that) {
case _UserProgress():
return $default(_that.vocabularyId,_that.srsStage,_that.nextReviewDate,_that.correctStreak,_that.totalReviews,_that.correctReviews,_that.difficultyMultiplier,_that.lastReviewDate,_that.isLearned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String vocabularyId,  int srsStage, @TimestampConverter()  DateTime nextReviewDate,  int correctStreak,  int totalReviews,  int correctReviews,  double difficultyMultiplier,  DateTime? lastReviewDate,  bool isLearned)?  $default,) {final _that = this;
switch (_that) {
case _UserProgress() when $default != null:
return $default(_that.vocabularyId,_that.srsStage,_that.nextReviewDate,_that.correctStreak,_that.totalReviews,_that.correctReviews,_that.difficultyMultiplier,_that.lastReviewDate,_that.isLearned);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProgress implements UserProgress {
  const _UserProgress({required this.vocabularyId, required this.srsStage, @TimestampConverter() required this.nextReviewDate, this.correctStreak = 0, this.totalReviews = 0, this.correctReviews = 0, this.difficultyMultiplier = 1.0, this.lastReviewDate, this.isLearned = false});
  factory _UserProgress.fromJson(Map<String, dynamic> json) => _$UserProgressFromJson(json);

@override final  String vocabularyId;
@override final  int srsStage;
@override@TimestampConverter() final  DateTime nextReviewDate;
// --- NEW FIELDS REQUIRED FOR REVIEW CONTROLLER ---
@override@JsonKey() final  int correctStreak;
@override@JsonKey() final  int totalReviews;
@override@JsonKey() final  int correctReviews;
@override@JsonKey() final  double difficultyMultiplier;
@override final  DateTime? lastReviewDate;
@override@JsonKey() final  bool isLearned;

/// Create a copy of UserProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProgressCopyWith<_UserProgress> get copyWith => __$UserProgressCopyWithImpl<_UserProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProgress&&(identical(other.vocabularyId, vocabularyId) || other.vocabularyId == vocabularyId)&&(identical(other.srsStage, srsStage) || other.srsStage == srsStage)&&(identical(other.nextReviewDate, nextReviewDate) || other.nextReviewDate == nextReviewDate)&&(identical(other.correctStreak, correctStreak) || other.correctStreak == correctStreak)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.correctReviews, correctReviews) || other.correctReviews == correctReviews)&&(identical(other.difficultyMultiplier, difficultyMultiplier) || other.difficultyMultiplier == difficultyMultiplier)&&(identical(other.lastReviewDate, lastReviewDate) || other.lastReviewDate == lastReviewDate)&&(identical(other.isLearned, isLearned) || other.isLearned == isLearned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vocabularyId,srsStage,nextReviewDate,correctStreak,totalReviews,correctReviews,difficultyMultiplier,lastReviewDate,isLearned);

@override
String toString() {
  return 'UserProgress(vocabularyId: $vocabularyId, srsStage: $srsStage, nextReviewDate: $nextReviewDate, correctStreak: $correctStreak, totalReviews: $totalReviews, correctReviews: $correctReviews, difficultyMultiplier: $difficultyMultiplier, lastReviewDate: $lastReviewDate, isLearned: $isLearned)';
}


}

/// @nodoc
abstract mixin class _$UserProgressCopyWith<$Res> implements $UserProgressCopyWith<$Res> {
  factory _$UserProgressCopyWith(_UserProgress value, $Res Function(_UserProgress) _then) = __$UserProgressCopyWithImpl;
@override @useResult
$Res call({
 String vocabularyId, int srsStage,@TimestampConverter() DateTime nextReviewDate, int correctStreak, int totalReviews, int correctReviews, double difficultyMultiplier, DateTime? lastReviewDate, bool isLearned
});




}
/// @nodoc
class __$UserProgressCopyWithImpl<$Res>
    implements _$UserProgressCopyWith<$Res> {
  __$UserProgressCopyWithImpl(this._self, this._then);

  final _UserProgress _self;
  final $Res Function(_UserProgress) _then;

/// Create a copy of UserProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vocabularyId = null,Object? srsStage = null,Object? nextReviewDate = null,Object? correctStreak = null,Object? totalReviews = null,Object? correctReviews = null,Object? difficultyMultiplier = null,Object? lastReviewDate = freezed,Object? isLearned = null,}) {
  return _then(_UserProgress(
vocabularyId: null == vocabularyId ? _self.vocabularyId : vocabularyId // ignore: cast_nullable_to_non_nullable
as String,srsStage: null == srsStage ? _self.srsStage : srsStage // ignore: cast_nullable_to_non_nullable
as int,nextReviewDate: null == nextReviewDate ? _self.nextReviewDate : nextReviewDate // ignore: cast_nullable_to_non_nullable
as DateTime,correctStreak: null == correctStreak ? _self.correctStreak : correctStreak // ignore: cast_nullable_to_non_nullable
as int,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,correctReviews: null == correctReviews ? _self.correctReviews : correctReviews // ignore: cast_nullable_to_non_nullable
as int,difficultyMultiplier: null == difficultyMultiplier ? _self.difficultyMultiplier : difficultyMultiplier // ignore: cast_nullable_to_non_nullable
as double,lastReviewDate: freezed == lastReviewDate ? _self.lastReviewDate : lastReviewDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isLearned: null == isLearned ? _self.isLearned : isLearned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
