// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaderboardParams {

 int get limit;
/// Create a copy of LeaderboardParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaderboardParamsCopyWith<LeaderboardParams> get copyWith => _$LeaderboardParamsCopyWithImpl<LeaderboardParams>(this as LeaderboardParams, _$identity);

  /// Serializes this LeaderboardParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaderboardParams&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString() {
  return 'LeaderboardParams(limit: $limit)';
}


}

/// @nodoc
abstract mixin class $LeaderboardParamsCopyWith<$Res>  {
  factory $LeaderboardParamsCopyWith(LeaderboardParams value, $Res Function(LeaderboardParams) _then) = _$LeaderboardParamsCopyWithImpl;
@useResult
$Res call({
 int limit
});




}
/// @nodoc
class _$LeaderboardParamsCopyWithImpl<$Res>
    implements $LeaderboardParamsCopyWith<$Res> {
  _$LeaderboardParamsCopyWithImpl(this._self, this._then);

  final LeaderboardParams _self;
  final $Res Function(LeaderboardParams) _then;

/// Create a copy of LeaderboardParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LeaderboardParams implements LeaderboardParams {
  const _LeaderboardParams({this.limit = 10});
  factory _LeaderboardParams.fromJson(Map<String, dynamic> json) => _$LeaderboardParamsFromJson(json);

@override@JsonKey() final  int limit;

/// Create a copy of LeaderboardParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaderboardParamsCopyWith<_LeaderboardParams> get copyWith => __$LeaderboardParamsCopyWithImpl<_LeaderboardParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaderboardParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaderboardParams&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString() {
  return 'LeaderboardParams(limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$LeaderboardParamsCopyWith<$Res> implements $LeaderboardParamsCopyWith<$Res> {
  factory _$LeaderboardParamsCopyWith(_LeaderboardParams value, $Res Function(_LeaderboardParams) _then) = __$LeaderboardParamsCopyWithImpl;
@override @useResult
$Res call({
 int limit
});




}
/// @nodoc
class __$LeaderboardParamsCopyWithImpl<$Res>
    implements _$LeaderboardParamsCopyWith<$Res> {
  __$LeaderboardParamsCopyWithImpl(this._self, this._then);

  final _LeaderboardParams _self;
  final $Res Function(_LeaderboardParams) _then;

/// Create a copy of LeaderboardParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,}) {
  return _then(_LeaderboardParams(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$UserScoreParams {

 String get userId; String get name; int get scoreToAdd; bool get isCorrectAnswer; DateTime? get playedAt;
/// Create a copy of UserScoreParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserScoreParamsCopyWith<UserScoreParams> get copyWith => _$UserScoreParamsCopyWithImpl<UserScoreParams>(this as UserScoreParams, _$identity);

  /// Serializes this UserScoreParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserScoreParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.scoreToAdd, scoreToAdd) || other.scoreToAdd == scoreToAdd)&&(identical(other.isCorrectAnswer, isCorrectAnswer) || other.isCorrectAnswer == isCorrectAnswer)&&(identical(other.playedAt, playedAt) || other.playedAt == playedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,scoreToAdd,isCorrectAnswer,playedAt);

@override
String toString() {
  return 'UserScoreParams(userId: $userId, name: $name, scoreToAdd: $scoreToAdd, isCorrectAnswer: $isCorrectAnswer, playedAt: $playedAt)';
}


}

/// @nodoc
abstract mixin class $UserScoreParamsCopyWith<$Res>  {
  factory $UserScoreParamsCopyWith(UserScoreParams value, $Res Function(UserScoreParams) _then) = _$UserScoreParamsCopyWithImpl;
@useResult
$Res call({
 String userId, String name, int scoreToAdd, bool isCorrectAnswer, DateTime? playedAt
});




}
/// @nodoc
class _$UserScoreParamsCopyWithImpl<$Res>
    implements $UserScoreParamsCopyWith<$Res> {
  _$UserScoreParamsCopyWithImpl(this._self, this._then);

  final UserScoreParams _self;
  final $Res Function(UserScoreParams) _then;

/// Create a copy of UserScoreParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? name = null,Object? scoreToAdd = null,Object? isCorrectAnswer = null,Object? playedAt = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,scoreToAdd: null == scoreToAdd ? _self.scoreToAdd : scoreToAdd // ignore: cast_nullable_to_non_nullable
as int,isCorrectAnswer: null == isCorrectAnswer ? _self.isCorrectAnswer : isCorrectAnswer // ignore: cast_nullable_to_non_nullable
as bool,playedAt: freezed == playedAt ? _self.playedAt : playedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserScoreParams implements UserScoreParams {
  const _UserScoreParams({required this.userId, required this.name, required this.scoreToAdd, required this.isCorrectAnswer, this.playedAt});
  factory _UserScoreParams.fromJson(Map<String, dynamic> json) => _$UserScoreParamsFromJson(json);

@override final  String userId;
@override final  String name;
@override final  int scoreToAdd;
@override final  bool isCorrectAnswer;
@override final  DateTime? playedAt;

/// Create a copy of UserScoreParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserScoreParamsCopyWith<_UserScoreParams> get copyWith => __$UserScoreParamsCopyWithImpl<_UserScoreParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserScoreParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserScoreParams&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.scoreToAdd, scoreToAdd) || other.scoreToAdd == scoreToAdd)&&(identical(other.isCorrectAnswer, isCorrectAnswer) || other.isCorrectAnswer == isCorrectAnswer)&&(identical(other.playedAt, playedAt) || other.playedAt == playedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,scoreToAdd,isCorrectAnswer,playedAt);

@override
String toString() {
  return 'UserScoreParams(userId: $userId, name: $name, scoreToAdd: $scoreToAdd, isCorrectAnswer: $isCorrectAnswer, playedAt: $playedAt)';
}


}

/// @nodoc
abstract mixin class _$UserScoreParamsCopyWith<$Res> implements $UserScoreParamsCopyWith<$Res> {
  factory _$UserScoreParamsCopyWith(_UserScoreParams value, $Res Function(_UserScoreParams) _then) = __$UserScoreParamsCopyWithImpl;
@override @useResult
$Res call({
 String userId, String name, int scoreToAdd, bool isCorrectAnswer, DateTime? playedAt
});




}
/// @nodoc
class __$UserScoreParamsCopyWithImpl<$Res>
    implements _$UserScoreParamsCopyWith<$Res> {
  __$UserScoreParamsCopyWithImpl(this._self, this._then);

  final _UserScoreParams _self;
  final $Res Function(_UserScoreParams) _then;

/// Create a copy of UserScoreParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? name = null,Object? scoreToAdd = null,Object? isCorrectAnswer = null,Object? playedAt = freezed,}) {
  return _then(_UserScoreParams(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,scoreToAdd: null == scoreToAdd ? _self.scoreToAdd : scoreToAdd // ignore: cast_nullable_to_non_nullable
as int,isCorrectAnswer: null == isCorrectAnswer ? _self.isCorrectAnswer : isCorrectAnswer // ignore: cast_nullable_to_non_nullable
as bool,playedAt: freezed == playedAt ? _self.playedAt : playedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
