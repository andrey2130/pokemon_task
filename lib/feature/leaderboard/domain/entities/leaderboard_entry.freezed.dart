// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaderboardEntry {

 String get userId; String get name; int get score; int get streak; int get dailyStreak; DateTime get lastPlayed;
/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaderboardEntryCopyWith<LeaderboardEntry> get copyWith => _$LeaderboardEntryCopyWithImpl<LeaderboardEntry>(this as LeaderboardEntry, _$identity);

  /// Serializes this LeaderboardEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaderboardEntry&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.score, score) || other.score == score)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.dailyStreak, dailyStreak) || other.dailyStreak == dailyStreak)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,score,streak,dailyStreak,lastPlayed);

@override
String toString() {
  return 'LeaderboardEntry(userId: $userId, name: $name, score: $score, streak: $streak, dailyStreak: $dailyStreak, lastPlayed: $lastPlayed)';
}


}

/// @nodoc
abstract mixin class $LeaderboardEntryCopyWith<$Res>  {
  factory $LeaderboardEntryCopyWith(LeaderboardEntry value, $Res Function(LeaderboardEntry) _then) = _$LeaderboardEntryCopyWithImpl;
@useResult
$Res call({
 String userId, String name, int score, int streak, int dailyStreak, DateTime lastPlayed
});




}
/// @nodoc
class _$LeaderboardEntryCopyWithImpl<$Res>
    implements $LeaderboardEntryCopyWith<$Res> {
  _$LeaderboardEntryCopyWithImpl(this._self, this._then);

  final LeaderboardEntry _self;
  final $Res Function(LeaderboardEntry) _then;

/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? name = null,Object? score = null,Object? streak = null,Object? dailyStreak = null,Object? lastPlayed = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as int,dailyStreak: null == dailyStreak ? _self.dailyStreak : dailyStreak // ignore: cast_nullable_to_non_nullable
as int,lastPlayed: null == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LeaderboardEntry extends LeaderboardEntry {
  const _LeaderboardEntry({required this.userId, required this.name, required this.score, required this.streak, required this.dailyStreak, required this.lastPlayed}): super._();
  factory _LeaderboardEntry.fromJson(Map<String, dynamic> json) => _$LeaderboardEntryFromJson(json);

@override final  String userId;
@override final  String name;
@override final  int score;
@override final  int streak;
@override final  int dailyStreak;
@override final  DateTime lastPlayed;

/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaderboardEntryCopyWith<_LeaderboardEntry> get copyWith => __$LeaderboardEntryCopyWithImpl<_LeaderboardEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaderboardEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaderboardEntry&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.score, score) || other.score == score)&&(identical(other.streak, streak) || other.streak == streak)&&(identical(other.dailyStreak, dailyStreak) || other.dailyStreak == dailyStreak)&&(identical(other.lastPlayed, lastPlayed) || other.lastPlayed == lastPlayed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,score,streak,dailyStreak,lastPlayed);

@override
String toString() {
  return 'LeaderboardEntry(userId: $userId, name: $name, score: $score, streak: $streak, dailyStreak: $dailyStreak, lastPlayed: $lastPlayed)';
}


}

/// @nodoc
abstract mixin class _$LeaderboardEntryCopyWith<$Res> implements $LeaderboardEntryCopyWith<$Res> {
  factory _$LeaderboardEntryCopyWith(_LeaderboardEntry value, $Res Function(_LeaderboardEntry) _then) = __$LeaderboardEntryCopyWithImpl;
@override @useResult
$Res call({
 String userId, String name, int score, int streak, int dailyStreak, DateTime lastPlayed
});




}
/// @nodoc
class __$LeaderboardEntryCopyWithImpl<$Res>
    implements _$LeaderboardEntryCopyWith<$Res> {
  __$LeaderboardEntryCopyWithImpl(this._self, this._then);

  final _LeaderboardEntry _self;
  final $Res Function(_LeaderboardEntry) _then;

/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? name = null,Object? score = null,Object? streak = null,Object? dailyStreak = null,Object? lastPlayed = null,}) {
  return _then(_LeaderboardEntry(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as int,dailyStreak: null == dailyStreak ? _self.dailyStreak : dailyStreak // ignore: cast_nullable_to_non_nullable
as int,lastPlayed: null == lastPlayed ? _self.lastPlayed : lastPlayed // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
