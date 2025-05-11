// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserEntity {

 String get uid; String get email; String get displayName; int get bestStreak; int get gamesPlayed; int get correctAnswers; int get totalAnswers; int get dailyStreak; int get currentStreak;
/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEntityCopyWith<UserEntity> get copyWith => _$UserEntityCopyWithImpl<UserEntity>(this as UserEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEntity&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.bestStreak, bestStreak) || other.bestStreak == bestStreak)&&(identical(other.gamesPlayed, gamesPlayed) || other.gamesPlayed == gamesPlayed)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.totalAnswers, totalAnswers) || other.totalAnswers == totalAnswers)&&(identical(other.dailyStreak, dailyStreak) || other.dailyStreak == dailyStreak)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak));
}


@override
int get hashCode => Object.hash(runtimeType,uid,email,displayName,bestStreak,gamesPlayed,correctAnswers,totalAnswers,dailyStreak,currentStreak);

@override
String toString() {
  return 'UserEntity(uid: $uid, email: $email, displayName: $displayName, bestStreak: $bestStreak, gamesPlayed: $gamesPlayed, correctAnswers: $correctAnswers, totalAnswers: $totalAnswers, dailyStreak: $dailyStreak, currentStreak: $currentStreak)';
}


}

/// @nodoc
abstract mixin class $UserEntityCopyWith<$Res>  {
  factory $UserEntityCopyWith(UserEntity value, $Res Function(UserEntity) _then) = _$UserEntityCopyWithImpl;
@useResult
$Res call({
 String uid, String email, String displayName, int bestStreak, int gamesPlayed, int correctAnswers, int totalAnswers, int dailyStreak, int currentStreak
});




}
/// @nodoc
class _$UserEntityCopyWithImpl<$Res>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._self, this._then);

  final UserEntity _self;
  final $Res Function(UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? email = null,Object? displayName = null,Object? bestStreak = null,Object? gamesPlayed = null,Object? correctAnswers = null,Object? totalAnswers = null,Object? dailyStreak = null,Object? currentStreak = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,bestStreak: null == bestStreak ? _self.bestStreak : bestStreak // ignore: cast_nullable_to_non_nullable
as int,gamesPlayed: null == gamesPlayed ? _self.gamesPlayed : gamesPlayed // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,totalAnswers: null == totalAnswers ? _self.totalAnswers : totalAnswers // ignore: cast_nullable_to_non_nullable
as int,dailyStreak: null == dailyStreak ? _self.dailyStreak : dailyStreak // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _UserEntity implements UserEntity {
  const _UserEntity({required this.uid, required this.email, required this.displayName, this.bestStreak = 0, this.gamesPlayed = 0, this.correctAnswers = 0, this.totalAnswers = 0, this.dailyStreak = 0, this.currentStreak = 0});
  

@override final  String uid;
@override final  String email;
@override final  String displayName;
@override@JsonKey() final  int bestStreak;
@override@JsonKey() final  int gamesPlayed;
@override@JsonKey() final  int correctAnswers;
@override@JsonKey() final  int totalAnswers;
@override@JsonKey() final  int dailyStreak;
@override@JsonKey() final  int currentStreak;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEntityCopyWith<_UserEntity> get copyWith => __$UserEntityCopyWithImpl<_UserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEntity&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.bestStreak, bestStreak) || other.bestStreak == bestStreak)&&(identical(other.gamesPlayed, gamesPlayed) || other.gamesPlayed == gamesPlayed)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.totalAnswers, totalAnswers) || other.totalAnswers == totalAnswers)&&(identical(other.dailyStreak, dailyStreak) || other.dailyStreak == dailyStreak)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak));
}


@override
int get hashCode => Object.hash(runtimeType,uid,email,displayName,bestStreak,gamesPlayed,correctAnswers,totalAnswers,dailyStreak,currentStreak);

@override
String toString() {
  return 'UserEntity(uid: $uid, email: $email, displayName: $displayName, bestStreak: $bestStreak, gamesPlayed: $gamesPlayed, correctAnswers: $correctAnswers, totalAnswers: $totalAnswers, dailyStreak: $dailyStreak, currentStreak: $currentStreak)';
}


}

/// @nodoc
abstract mixin class _$UserEntityCopyWith<$Res> implements $UserEntityCopyWith<$Res> {
  factory _$UserEntityCopyWith(_UserEntity value, $Res Function(_UserEntity) _then) = __$UserEntityCopyWithImpl;
@override @useResult
$Res call({
 String uid, String email, String displayName, int bestStreak, int gamesPlayed, int correctAnswers, int totalAnswers, int dailyStreak, int currentStreak
});




}
/// @nodoc
class __$UserEntityCopyWithImpl<$Res>
    implements _$UserEntityCopyWith<$Res> {
  __$UserEntityCopyWithImpl(this._self, this._then);

  final _UserEntity _self;
  final $Res Function(_UserEntity) _then;

/// Create a copy of UserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? email = null,Object? displayName = null,Object? bestStreak = null,Object? gamesPlayed = null,Object? correctAnswers = null,Object? totalAnswers = null,Object? dailyStreak = null,Object? currentStreak = null,}) {
  return _then(_UserEntity(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,bestStreak: null == bestStreak ? _self.bestStreak : bestStreak // ignore: cast_nullable_to_non_nullable
as int,gamesPlayed: null == gamesPlayed ? _self.gamesPlayed : gamesPlayed // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,totalAnswers: null == totalAnswers ? _self.totalAnswers : totalAnswers // ignore: cast_nullable_to_non_nullable
as int,dailyStreak: null == dailyStreak ? _self.dailyStreak : dailyStreak // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
