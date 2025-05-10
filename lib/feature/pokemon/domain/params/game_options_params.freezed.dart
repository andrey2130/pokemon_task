// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_options_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameOptionsParams {

 int get optionsCount; int get timerSeconds;
/// Create a copy of GameOptionsParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameOptionsParamsCopyWith<GameOptionsParams> get copyWith => _$GameOptionsParamsCopyWithImpl<GameOptionsParams>(this as GameOptionsParams, _$identity);

  /// Serializes this GameOptionsParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameOptionsParams&&(identical(other.optionsCount, optionsCount) || other.optionsCount == optionsCount)&&(identical(other.timerSeconds, timerSeconds) || other.timerSeconds == timerSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,optionsCount,timerSeconds);

@override
String toString() {
  return 'GameOptionsParams(optionsCount: $optionsCount, timerSeconds: $timerSeconds)';
}


}

/// @nodoc
abstract mixin class $GameOptionsParamsCopyWith<$Res>  {
  factory $GameOptionsParamsCopyWith(GameOptionsParams value, $Res Function(GameOptionsParams) _then) = _$GameOptionsParamsCopyWithImpl;
@useResult
$Res call({
 int optionsCount, int timerSeconds
});




}
/// @nodoc
class _$GameOptionsParamsCopyWithImpl<$Res>
    implements $GameOptionsParamsCopyWith<$Res> {
  _$GameOptionsParamsCopyWithImpl(this._self, this._then);

  final GameOptionsParams _self;
  final $Res Function(GameOptionsParams) _then;

/// Create a copy of GameOptionsParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? optionsCount = null,Object? timerSeconds = null,}) {
  return _then(_self.copyWith(
optionsCount: null == optionsCount ? _self.optionsCount : optionsCount // ignore: cast_nullable_to_non_nullable
as int,timerSeconds: null == timerSeconds ? _self.timerSeconds : timerSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GameOptionsParams implements GameOptionsParams {
  const _GameOptionsParams({this.optionsCount = 4, this.timerSeconds = 30});
  factory _GameOptionsParams.fromJson(Map<String, dynamic> json) => _$GameOptionsParamsFromJson(json);

@override@JsonKey() final  int optionsCount;
@override@JsonKey() final  int timerSeconds;

/// Create a copy of GameOptionsParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameOptionsParamsCopyWith<_GameOptionsParams> get copyWith => __$GameOptionsParamsCopyWithImpl<_GameOptionsParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameOptionsParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameOptionsParams&&(identical(other.optionsCount, optionsCount) || other.optionsCount == optionsCount)&&(identical(other.timerSeconds, timerSeconds) || other.timerSeconds == timerSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,optionsCount,timerSeconds);

@override
String toString() {
  return 'GameOptionsParams(optionsCount: $optionsCount, timerSeconds: $timerSeconds)';
}


}

/// @nodoc
abstract mixin class _$GameOptionsParamsCopyWith<$Res> implements $GameOptionsParamsCopyWith<$Res> {
  factory _$GameOptionsParamsCopyWith(_GameOptionsParams value, $Res Function(_GameOptionsParams) _then) = __$GameOptionsParamsCopyWithImpl;
@override @useResult
$Res call({
 int optionsCount, int timerSeconds
});




}
/// @nodoc
class __$GameOptionsParamsCopyWithImpl<$Res>
    implements _$GameOptionsParamsCopyWith<$Res> {
  __$GameOptionsParamsCopyWithImpl(this._self, this._then);

  final _GameOptionsParams _self;
  final $Res Function(_GameOptionsParams) _then;

/// Create a copy of GameOptionsParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? optionsCount = null,Object? timerSeconds = null,}) {
  return _then(_GameOptionsParams(
optionsCount: null == optionsCount ? _self.optionsCount : optionsCount // ignore: cast_nullable_to_non_nullable
as int,timerSeconds: null == timerSeconds ? _self.timerSeconds : timerSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
