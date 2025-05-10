// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameResult {

 PokemonEntity get correctPokemon; String get selectedName; bool get isCorrect; int get timeSpent;
/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameResultCopyWith<GameResult> get copyWith => _$GameResultCopyWithImpl<GameResult>(this as GameResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameResult&&(identical(other.correctPokemon, correctPokemon) || other.correctPokemon == correctPokemon)&&(identical(other.selectedName, selectedName) || other.selectedName == selectedName)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.timeSpent, timeSpent) || other.timeSpent == timeSpent));
}


@override
int get hashCode => Object.hash(runtimeType,correctPokemon,selectedName,isCorrect,timeSpent);

@override
String toString() {
  return 'GameResult(correctPokemon: $correctPokemon, selectedName: $selectedName, isCorrect: $isCorrect, timeSpent: $timeSpent)';
}


}

/// @nodoc
abstract mixin class $GameResultCopyWith<$Res>  {
  factory $GameResultCopyWith(GameResult value, $Res Function(GameResult) _then) = _$GameResultCopyWithImpl;
@useResult
$Res call({
 PokemonEntity correctPokemon, String selectedName, bool isCorrect, int timeSpent
});


$PokemonEntityCopyWith<$Res> get correctPokemon;

}
/// @nodoc
class _$GameResultCopyWithImpl<$Res>
    implements $GameResultCopyWith<$Res> {
  _$GameResultCopyWithImpl(this._self, this._then);

  final GameResult _self;
  final $Res Function(GameResult) _then;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? correctPokemon = null,Object? selectedName = null,Object? isCorrect = null,Object? timeSpent = null,}) {
  return _then(_self.copyWith(
correctPokemon: null == correctPokemon ? _self.correctPokemon : correctPokemon // ignore: cast_nullable_to_non_nullable
as PokemonEntity,selectedName: null == selectedName ? _self.selectedName : selectedName // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,timeSpent: null == timeSpent ? _self.timeSpent : timeSpent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonEntityCopyWith<$Res> get correctPokemon {
  
  return $PokemonEntityCopyWith<$Res>(_self.correctPokemon, (value) {
    return _then(_self.copyWith(correctPokemon: value));
  });
}
}


/// @nodoc


class _GameResult implements GameResult {
  const _GameResult({required this.correctPokemon, required this.selectedName, required this.isCorrect, required this.timeSpent});
  

@override final  PokemonEntity correctPokemon;
@override final  String selectedName;
@override final  bool isCorrect;
@override final  int timeSpent;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameResultCopyWith<_GameResult> get copyWith => __$GameResultCopyWithImpl<_GameResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameResult&&(identical(other.correctPokemon, correctPokemon) || other.correctPokemon == correctPokemon)&&(identical(other.selectedName, selectedName) || other.selectedName == selectedName)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.timeSpent, timeSpent) || other.timeSpent == timeSpent));
}


@override
int get hashCode => Object.hash(runtimeType,correctPokemon,selectedName,isCorrect,timeSpent);

@override
String toString() {
  return 'GameResult(correctPokemon: $correctPokemon, selectedName: $selectedName, isCorrect: $isCorrect, timeSpent: $timeSpent)';
}


}

/// @nodoc
abstract mixin class _$GameResultCopyWith<$Res> implements $GameResultCopyWith<$Res> {
  factory _$GameResultCopyWith(_GameResult value, $Res Function(_GameResult) _then) = __$GameResultCopyWithImpl;
@override @useResult
$Res call({
 PokemonEntity correctPokemon, String selectedName, bool isCorrect, int timeSpent
});


@override $PokemonEntityCopyWith<$Res> get correctPokemon;

}
/// @nodoc
class __$GameResultCopyWithImpl<$Res>
    implements _$GameResultCopyWith<$Res> {
  __$GameResultCopyWithImpl(this._self, this._then);

  final _GameResult _self;
  final $Res Function(_GameResult) _then;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? correctPokemon = null,Object? selectedName = null,Object? isCorrect = null,Object? timeSpent = null,}) {
  return _then(_GameResult(
correctPokemon: null == correctPokemon ? _self.correctPokemon : correctPokemon // ignore: cast_nullable_to_non_nullable
as PokemonEntity,selectedName: null == selectedName ? _self.selectedName : selectedName // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,timeSpent: null == timeSpent ? _self.timeSpent : timeSpent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PokemonEntityCopyWith<$Res> get correctPokemon {
  
  return $PokemonEntityCopyWith<$Res>(_self.correctPokemon, (value) {
    return _then(_self.copyWith(correctPokemon: value));
  });
}
}

// dart format on
