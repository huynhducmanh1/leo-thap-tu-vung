// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 String get id; String get email; int get level; int get xp; String? get activeCourseId;// --- NEW GAMIFICATION FIELDS ---
 int get currentStreak; int get longestStreak; int get totalWordsLearned; int get totalReviewsCompleted; DateTime? get lastStudyDate; List<String> get unlockedAchievements;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.level, level) || other.level == level)&&(identical(other.xp, xp) || other.xp == xp)&&(identical(other.activeCourseId, activeCourseId) || other.activeCourseId == activeCourseId)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.totalWordsLearned, totalWordsLearned) || other.totalWordsLearned == totalWordsLearned)&&(identical(other.totalReviewsCompleted, totalReviewsCompleted) || other.totalReviewsCompleted == totalReviewsCompleted)&&(identical(other.lastStudyDate, lastStudyDate) || other.lastStudyDate == lastStudyDate)&&const DeepCollectionEquality().equals(other.unlockedAchievements, unlockedAchievements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,level,xp,activeCourseId,currentStreak,longestStreak,totalWordsLearned,totalReviewsCompleted,lastStudyDate,const DeepCollectionEquality().hash(unlockedAchievements));

@override
String toString() {
  return 'UserProfile(id: $id, email: $email, level: $level, xp: $xp, activeCourseId: $activeCourseId, currentStreak: $currentStreak, longestStreak: $longestStreak, totalWordsLearned: $totalWordsLearned, totalReviewsCompleted: $totalReviewsCompleted, lastStudyDate: $lastStudyDate, unlockedAchievements: $unlockedAchievements)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String id, String email, int level, int xp, String? activeCourseId, int currentStreak, int longestStreak, int totalWordsLearned, int totalReviewsCompleted, DateTime? lastStudyDate, List<String> unlockedAchievements
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? level = null,Object? xp = null,Object? activeCourseId = freezed,Object? currentStreak = null,Object? longestStreak = null,Object? totalWordsLearned = null,Object? totalReviewsCompleted = null,Object? lastStudyDate = freezed,Object? unlockedAchievements = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,activeCourseId: freezed == activeCourseId ? _self.activeCourseId : activeCourseId // ignore: cast_nullable_to_non_nullable
as String?,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,totalWordsLearned: null == totalWordsLearned ? _self.totalWordsLearned : totalWordsLearned // ignore: cast_nullable_to_non_nullable
as int,totalReviewsCompleted: null == totalReviewsCompleted ? _self.totalReviewsCompleted : totalReviewsCompleted // ignore: cast_nullable_to_non_nullable
as int,lastStudyDate: freezed == lastStudyDate ? _self.lastStudyDate : lastStudyDate // ignore: cast_nullable_to_non_nullable
as DateTime?,unlockedAchievements: null == unlockedAchievements ? _self.unlockedAchievements : unlockedAchievements // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  int level,  int xp,  String? activeCourseId,  int currentStreak,  int longestStreak,  int totalWordsLearned,  int totalReviewsCompleted,  DateTime? lastStudyDate,  List<String> unlockedAchievements)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.email,_that.level,_that.xp,_that.activeCourseId,_that.currentStreak,_that.longestStreak,_that.totalWordsLearned,_that.totalReviewsCompleted,_that.lastStudyDate,_that.unlockedAchievements);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  int level,  int xp,  String? activeCourseId,  int currentStreak,  int longestStreak,  int totalWordsLearned,  int totalReviewsCompleted,  DateTime? lastStudyDate,  List<String> unlockedAchievements)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.id,_that.email,_that.level,_that.xp,_that.activeCourseId,_that.currentStreak,_that.longestStreak,_that.totalWordsLearned,_that.totalReviewsCompleted,_that.lastStudyDate,_that.unlockedAchievements);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  int level,  int xp,  String? activeCourseId,  int currentStreak,  int longestStreak,  int totalWordsLearned,  int totalReviewsCompleted,  DateTime? lastStudyDate,  List<String> unlockedAchievements)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.email,_that.level,_that.xp,_that.activeCourseId,_that.currentStreak,_that.longestStreak,_that.totalWordsLearned,_that.totalReviewsCompleted,_that.lastStudyDate,_that.unlockedAchievements);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({required this.id, required this.email, this.level = 1, this.xp = 0, this.activeCourseId, this.currentStreak = 0, this.longestStreak = 0, this.totalWordsLearned = 0, this.totalReviewsCompleted = 0, this.lastStudyDate, final  List<String> unlockedAchievements = const []}): _unlockedAchievements = unlockedAchievements;
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  String id;
@override final  String email;
@override@JsonKey() final  int level;
@override@JsonKey() final  int xp;
@override final  String? activeCourseId;
// --- NEW GAMIFICATION FIELDS ---
@override@JsonKey() final  int currentStreak;
@override@JsonKey() final  int longestStreak;
@override@JsonKey() final  int totalWordsLearned;
@override@JsonKey() final  int totalReviewsCompleted;
@override final  DateTime? lastStudyDate;
 final  List<String> _unlockedAchievements;
@override@JsonKey() List<String> get unlockedAchievements {
  if (_unlockedAchievements is EqualUnmodifiableListView) return _unlockedAchievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unlockedAchievements);
}


/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.level, level) || other.level == level)&&(identical(other.xp, xp) || other.xp == xp)&&(identical(other.activeCourseId, activeCourseId) || other.activeCourseId == activeCourseId)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.totalWordsLearned, totalWordsLearned) || other.totalWordsLearned == totalWordsLearned)&&(identical(other.totalReviewsCompleted, totalReviewsCompleted) || other.totalReviewsCompleted == totalReviewsCompleted)&&(identical(other.lastStudyDate, lastStudyDate) || other.lastStudyDate == lastStudyDate)&&const DeepCollectionEquality().equals(other._unlockedAchievements, _unlockedAchievements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,level,xp,activeCourseId,currentStreak,longestStreak,totalWordsLearned,totalReviewsCompleted,lastStudyDate,const DeepCollectionEquality().hash(_unlockedAchievements));

@override
String toString() {
  return 'UserProfile(id: $id, email: $email, level: $level, xp: $xp, activeCourseId: $activeCourseId, currentStreak: $currentStreak, longestStreak: $longestStreak, totalWordsLearned: $totalWordsLearned, totalReviewsCompleted: $totalReviewsCompleted, lastStudyDate: $lastStudyDate, unlockedAchievements: $unlockedAchievements)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, int level, int xp, String? activeCourseId, int currentStreak, int longestStreak, int totalWordsLearned, int totalReviewsCompleted, DateTime? lastStudyDate, List<String> unlockedAchievements
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? level = null,Object? xp = null,Object? activeCourseId = freezed,Object? currentStreak = null,Object? longestStreak = null,Object? totalWordsLearned = null,Object? totalReviewsCompleted = null,Object? lastStudyDate = freezed,Object? unlockedAchievements = null,}) {
  return _then(_UserProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,activeCourseId: freezed == activeCourseId ? _self.activeCourseId : activeCourseId // ignore: cast_nullable_to_non_nullable
as String?,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,totalWordsLearned: null == totalWordsLearned ? _self.totalWordsLearned : totalWordsLearned // ignore: cast_nullable_to_non_nullable
as int,totalReviewsCompleted: null == totalReviewsCompleted ? _self.totalReviewsCompleted : totalReviewsCompleted // ignore: cast_nullable_to_non_nullable
as int,lastStudyDate: freezed == lastStudyDate ? _self.lastStudyDate : lastStudyDate // ignore: cast_nullable_to_non_nullable
as DateTime?,unlockedAchievements: null == unlockedAchievements ? _self._unlockedAchievements : unlockedAchievements // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
