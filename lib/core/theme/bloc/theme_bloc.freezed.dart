// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemeEvent()';
}


}

/// @nodoc
class $ThemeEventCopyWith<$Res>  {
$ThemeEventCopyWith(ThemeEvent _, $Res Function(ThemeEvent) __);
}


/// @nodoc


class _ToggleTheme implements ThemeEvent {
  const _ToggleTheme();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleTheme);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemeEvent.toggleTheme()';
}


}




/// @nodoc


class _SetTheme implements ThemeEvent {
  const _SetTheme(this.themeMode);
  

 final  AppThemeMode themeMode;

/// Create a copy of ThemeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetThemeCopyWith<_SetTheme> get copyWith => __$SetThemeCopyWithImpl<_SetTheme>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetTheme&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode);

@override
String toString() {
  return 'ThemeEvent.setTheme(themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class _$SetThemeCopyWith<$Res> implements $ThemeEventCopyWith<$Res> {
  factory _$SetThemeCopyWith(_SetTheme value, $Res Function(_SetTheme) _then) = __$SetThemeCopyWithImpl;
@useResult
$Res call({
 AppThemeMode themeMode
});




}
/// @nodoc
class __$SetThemeCopyWithImpl<$Res>
    implements _$SetThemeCopyWith<$Res> {
  __$SetThemeCopyWithImpl(this._self, this._then);

  final _SetTheme _self;
  final $Res Function(_SetTheme) _then;

/// Create a copy of ThemeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? themeMode = null,}) {
  return _then(_SetTheme(
null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,
  ));
}


}

/// @nodoc


class _LoadTheme implements ThemeEvent {
  const _LoadTheme();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadTheme);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ThemeEvent.loadTheme()';
}


}




/// @nodoc
mixin _$ThemeState {

 ThemeData get themeData; AppThemeMode get themeMode;
/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeStateCopyWith<ThemeState> get copyWith => _$ThemeStateCopyWithImpl<ThemeState>(this as ThemeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeState&&(identical(other.themeData, themeData) || other.themeData == themeData)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,themeData,themeMode);

@override
String toString() {
  return 'ThemeState(themeData: $themeData, themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class $ThemeStateCopyWith<$Res>  {
  factory $ThemeStateCopyWith(ThemeState value, $Res Function(ThemeState) _then) = _$ThemeStateCopyWithImpl;
@useResult
$Res call({
 ThemeData themeData, AppThemeMode themeMode
});




}
/// @nodoc
class _$ThemeStateCopyWithImpl<$Res>
    implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._self, this._then);

  final ThemeState _self;
  final $Res Function(ThemeState) _then;

/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeData = null,Object? themeMode = null,}) {
  return _then(_self.copyWith(
themeData: null == themeData ? _self.themeData : themeData // ignore: cast_nullable_to_non_nullable
as ThemeData,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,
  ));
}

}


/// @nodoc


class _ThemeStateData implements ThemeState {
  const _ThemeStateData({required this.themeData, required this.themeMode});
  

@override final  ThemeData themeData;
@override final  AppThemeMode themeMode;

/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeStateDataCopyWith<_ThemeStateData> get copyWith => __$ThemeStateDataCopyWithImpl<_ThemeStateData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeStateData&&(identical(other.themeData, themeData) || other.themeData == themeData)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,themeData,themeMode);

@override
String toString() {
  return 'ThemeState(themeData: $themeData, themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class _$ThemeStateDataCopyWith<$Res> implements $ThemeStateCopyWith<$Res> {
  factory _$ThemeStateDataCopyWith(_ThemeStateData value, $Res Function(_ThemeStateData) _then) = __$ThemeStateDataCopyWithImpl;
@override @useResult
$Res call({
 ThemeData themeData, AppThemeMode themeMode
});




}
/// @nodoc
class __$ThemeStateDataCopyWithImpl<$Res>
    implements _$ThemeStateDataCopyWith<$Res> {
  __$ThemeStateDataCopyWithImpl(this._self, this._then);

  final _ThemeStateData _self;
  final $Res Function(_ThemeStateData) _then;

/// Create a copy of ThemeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeData = null,Object? themeMode = null,}) {
  return _then(_ThemeStateData(
themeData: null == themeData ? _self.themeData : themeData // ignore: cast_nullable_to_non_nullable
as ThemeData,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,
  ));
}


}

// dart format on
