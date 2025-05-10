// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeaderboardEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaderboardEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LeaderboardEvent()';
}


}

/// @nodoc
class $LeaderboardEventCopyWith<$Res>  {
$LeaderboardEventCopyWith(LeaderboardEvent _, $Res Function(LeaderboardEvent) __);
}


/// @nodoc


class LoadTopScores implements LeaderboardEvent {
  const LoadTopScores({this.limit = 10});
  

@JsonKey() final  int limit;

/// Create a copy of LeaderboardEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadTopScoresCopyWith<LoadTopScores> get copyWith => _$LoadTopScoresCopyWithImpl<LoadTopScores>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTopScores&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString() {
  return 'LeaderboardEvent.loadTopScores(limit: $limit)';
}


}

/// @nodoc
abstract mixin class $LoadTopScoresCopyWith<$Res> implements $LeaderboardEventCopyWith<$Res> {
  factory $LoadTopScoresCopyWith(LoadTopScores value, $Res Function(LoadTopScores) _then) = _$LoadTopScoresCopyWithImpl;
@useResult
$Res call({
 int limit
});




}
/// @nodoc
class _$LoadTopScoresCopyWithImpl<$Res>
    implements $LoadTopScoresCopyWith<$Res> {
  _$LoadTopScoresCopyWithImpl(this._self, this._then);

  final LoadTopScores _self;
  final $Res Function(LoadTopScores) _then;

/// Create a copy of LeaderboardEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? limit = null,}) {
  return _then(LoadTopScores(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class LoadTopStreaks implements LeaderboardEvent {
  const LoadTopStreaks({this.limit = 10});
  

@JsonKey() final  int limit;

/// Create a copy of LeaderboardEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadTopStreaksCopyWith<LoadTopStreaks> get copyWith => _$LoadTopStreaksCopyWithImpl<LoadTopStreaks>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTopStreaks&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString() {
  return 'LeaderboardEvent.loadTopStreaks(limit: $limit)';
}


}

/// @nodoc
abstract mixin class $LoadTopStreaksCopyWith<$Res> implements $LeaderboardEventCopyWith<$Res> {
  factory $LoadTopStreaksCopyWith(LoadTopStreaks value, $Res Function(LoadTopStreaks) _then) = _$LoadTopStreaksCopyWithImpl;
@useResult
$Res call({
 int limit
});




}
/// @nodoc
class _$LoadTopStreaksCopyWithImpl<$Res>
    implements $LoadTopStreaksCopyWith<$Res> {
  _$LoadTopStreaksCopyWithImpl(this._self, this._then);

  final LoadTopStreaks _self;
  final $Res Function(LoadTopStreaks) _then;

/// Create a copy of LeaderboardEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? limit = null,}) {
  return _then(LoadTopStreaks(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class LoadTopDailyStreaks implements LeaderboardEvent {
  const LoadTopDailyStreaks({this.limit = 10});
  

@JsonKey() final  int limit;

/// Create a copy of LeaderboardEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadTopDailyStreaksCopyWith<LoadTopDailyStreaks> get copyWith => _$LoadTopDailyStreaksCopyWithImpl<LoadTopDailyStreaks>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTopDailyStreaks&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString() {
  return 'LeaderboardEvent.loadTopDailyStreaks(limit: $limit)';
}


}

/// @nodoc
abstract mixin class $LoadTopDailyStreaksCopyWith<$Res> implements $LeaderboardEventCopyWith<$Res> {
  factory $LoadTopDailyStreaksCopyWith(LoadTopDailyStreaks value, $Res Function(LoadTopDailyStreaks) _then) = _$LoadTopDailyStreaksCopyWithImpl;
@useResult
$Res call({
 int limit
});




}
/// @nodoc
class _$LoadTopDailyStreaksCopyWithImpl<$Res>
    implements $LoadTopDailyStreaksCopyWith<$Res> {
  _$LoadTopDailyStreaksCopyWithImpl(this._self, this._then);

  final LoadTopDailyStreaks _self;
  final $Res Function(LoadTopDailyStreaks) _then;

/// Create a copy of LeaderboardEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? limit = null,}) {
  return _then(LoadTopDailyStreaks(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class UpdateUserScoreEvent implements LeaderboardEvent {
  const UpdateUserScoreEvent({required this.userId, required this.name, required this.scoreToAdd, required this.isCorrectAnswer});
  

 final  String userId;
 final  String name;
 final  int scoreToAdd;
 final  bool isCorrectAnswer;

/// Create a copy of LeaderboardEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserScoreEventCopyWith<UpdateUserScoreEvent> get copyWith => _$UpdateUserScoreEventCopyWithImpl<UpdateUserScoreEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserScoreEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.scoreToAdd, scoreToAdd) || other.scoreToAdd == scoreToAdd)&&(identical(other.isCorrectAnswer, isCorrectAnswer) || other.isCorrectAnswer == isCorrectAnswer));
}


@override
int get hashCode => Object.hash(runtimeType,userId,name,scoreToAdd,isCorrectAnswer);

@override
String toString() {
  return 'LeaderboardEvent.updateUserScore(userId: $userId, name: $name, scoreToAdd: $scoreToAdd, isCorrectAnswer: $isCorrectAnswer)';
}


}

/// @nodoc
abstract mixin class $UpdateUserScoreEventCopyWith<$Res> implements $LeaderboardEventCopyWith<$Res> {
  factory $UpdateUserScoreEventCopyWith(UpdateUserScoreEvent value, $Res Function(UpdateUserScoreEvent) _then) = _$UpdateUserScoreEventCopyWithImpl;
@useResult
$Res call({
 String userId, String name, int scoreToAdd, bool isCorrectAnswer
});




}
/// @nodoc
class _$UpdateUserScoreEventCopyWithImpl<$Res>
    implements $UpdateUserScoreEventCopyWith<$Res> {
  _$UpdateUserScoreEventCopyWithImpl(this._self, this._then);

  final UpdateUserScoreEvent _self;
  final $Res Function(UpdateUserScoreEvent) _then;

/// Create a copy of LeaderboardEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? name = null,Object? scoreToAdd = null,Object? isCorrectAnswer = null,}) {
  return _then(UpdateUserScoreEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,scoreToAdd: null == scoreToAdd ? _self.scoreToAdd : scoreToAdd // ignore: cast_nullable_to_non_nullable
as int,isCorrectAnswer: null == isCorrectAnswer ? _self.isCorrectAnswer : isCorrectAnswer // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
