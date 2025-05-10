// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaderboardState {

 LeaderboardTab get currentTab; List<LeaderboardEntry> get topScores; List<LeaderboardEntry> get topStreaks; List<LeaderboardEntry> get topDailyStreaks; bool get isLoading; String? get error;
/// Create a copy of LeaderboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaderboardStateCopyWith<LeaderboardState> get copyWith => _$LeaderboardStateCopyWithImpl<LeaderboardState>(this as LeaderboardState, _$identity);

  /// Serializes this LeaderboardState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaderboardState&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&const DeepCollectionEquality().equals(other.topScores, topScores)&&const DeepCollectionEquality().equals(other.topStreaks, topStreaks)&&const DeepCollectionEquality().equals(other.topDailyStreaks, topDailyStreaks)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentTab,const DeepCollectionEquality().hash(topScores),const DeepCollectionEquality().hash(topStreaks),const DeepCollectionEquality().hash(topDailyStreaks),isLoading,error);

@override
String toString() {
  return 'LeaderboardState(currentTab: $currentTab, topScores: $topScores, topStreaks: $topStreaks, topDailyStreaks: $topDailyStreaks, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $LeaderboardStateCopyWith<$Res>  {
  factory $LeaderboardStateCopyWith(LeaderboardState value, $Res Function(LeaderboardState) _then) = _$LeaderboardStateCopyWithImpl;
@useResult
$Res call({
 LeaderboardTab currentTab, List<LeaderboardEntry> topScores, List<LeaderboardEntry> topStreaks, List<LeaderboardEntry> topDailyStreaks, bool isLoading, String? error
});




}
/// @nodoc
class _$LeaderboardStateCopyWithImpl<$Res>
    implements $LeaderboardStateCopyWith<$Res> {
  _$LeaderboardStateCopyWithImpl(this._self, this._then);

  final LeaderboardState _self;
  final $Res Function(LeaderboardState) _then;

/// Create a copy of LeaderboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentTab = null,Object? topScores = null,Object? topStreaks = null,Object? topDailyStreaks = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as LeaderboardTab,topScores: null == topScores ? _self.topScores : topScores // ignore: cast_nullable_to_non_nullable
as List<LeaderboardEntry>,topStreaks: null == topStreaks ? _self.topStreaks : topStreaks // ignore: cast_nullable_to_non_nullable
as List<LeaderboardEntry>,topDailyStreaks: null == topDailyStreaks ? _self.topDailyStreaks : topDailyStreaks // ignore: cast_nullable_to_non_nullable
as List<LeaderboardEntry>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LeaderboardState extends LeaderboardState {
  const _LeaderboardState({this.currentTab = LeaderboardTab.scores, final  List<LeaderboardEntry> topScores = const [], final  List<LeaderboardEntry> topStreaks = const [], final  List<LeaderboardEntry> topDailyStreaks = const [], this.isLoading = false, this.error}): _topScores = topScores,_topStreaks = topStreaks,_topDailyStreaks = topDailyStreaks,super._();
  factory _LeaderboardState.fromJson(Map<String, dynamic> json) => _$LeaderboardStateFromJson(json);

@override@JsonKey() final  LeaderboardTab currentTab;
 final  List<LeaderboardEntry> _topScores;
@override@JsonKey() List<LeaderboardEntry> get topScores {
  if (_topScores is EqualUnmodifiableListView) return _topScores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topScores);
}

 final  List<LeaderboardEntry> _topStreaks;
@override@JsonKey() List<LeaderboardEntry> get topStreaks {
  if (_topStreaks is EqualUnmodifiableListView) return _topStreaks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topStreaks);
}

 final  List<LeaderboardEntry> _topDailyStreaks;
@override@JsonKey() List<LeaderboardEntry> get topDailyStreaks {
  if (_topDailyStreaks is EqualUnmodifiableListView) return _topDailyStreaks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topDailyStreaks);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of LeaderboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaderboardStateCopyWith<_LeaderboardState> get copyWith => __$LeaderboardStateCopyWithImpl<_LeaderboardState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaderboardStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaderboardState&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&const DeepCollectionEquality().equals(other._topScores, _topScores)&&const DeepCollectionEquality().equals(other._topStreaks, _topStreaks)&&const DeepCollectionEquality().equals(other._topDailyStreaks, _topDailyStreaks)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentTab,const DeepCollectionEquality().hash(_topScores),const DeepCollectionEquality().hash(_topStreaks),const DeepCollectionEquality().hash(_topDailyStreaks),isLoading,error);

@override
String toString() {
  return 'LeaderboardState(currentTab: $currentTab, topScores: $topScores, topStreaks: $topStreaks, topDailyStreaks: $topDailyStreaks, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$LeaderboardStateCopyWith<$Res> implements $LeaderboardStateCopyWith<$Res> {
  factory _$LeaderboardStateCopyWith(_LeaderboardState value, $Res Function(_LeaderboardState) _then) = __$LeaderboardStateCopyWithImpl;
@override @useResult
$Res call({
 LeaderboardTab currentTab, List<LeaderboardEntry> topScores, List<LeaderboardEntry> topStreaks, List<LeaderboardEntry> topDailyStreaks, bool isLoading, String? error
});




}
/// @nodoc
class __$LeaderboardStateCopyWithImpl<$Res>
    implements _$LeaderboardStateCopyWith<$Res> {
  __$LeaderboardStateCopyWithImpl(this._self, this._then);

  final _LeaderboardState _self;
  final $Res Function(_LeaderboardState) _then;

/// Create a copy of LeaderboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTab = null,Object? topScores = null,Object? topStreaks = null,Object? topDailyStreaks = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_LeaderboardState(
currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as LeaderboardTab,topScores: null == topScores ? _self._topScores : topScores // ignore: cast_nullable_to_non_nullable
as List<LeaderboardEntry>,topStreaks: null == topStreaks ? _self._topStreaks : topStreaks // ignore: cast_nullable_to_non_nullable
as List<LeaderboardEntry>,topDailyStreaks: null == topDailyStreaks ? _self._topDailyStreaks : topDailyStreaks // ignore: cast_nullable_to_non_nullable
as List<LeaderboardEntry>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
