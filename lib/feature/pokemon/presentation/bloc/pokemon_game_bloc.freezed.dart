// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PokemonGameEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonGameEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PokemonGameEvent()';
}


}

/// @nodoc
class $PokemonGameEventCopyWith<$Res>  {
$PokemonGameEventCopyWith(PokemonGameEvent _, $Res Function(PokemonGameEvent) __);
}


/// @nodoc


class StartGame implements PokemonGameEvent {
  const StartGame({this.options});
  

 final  GameOptionsParams? options;

/// Create a copy of PokemonGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartGameCopyWith<StartGame> get copyWith => _$StartGameCopyWithImpl<StartGame>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartGame&&(identical(other.options, options) || other.options == options));
}


@override
int get hashCode => Object.hash(runtimeType,options);

@override
String toString() {
  return 'PokemonGameEvent.startGame(options: $options)';
}


}

/// @nodoc
abstract mixin class $StartGameCopyWith<$Res> implements $PokemonGameEventCopyWith<$Res> {
  factory $StartGameCopyWith(StartGame value, $Res Function(StartGame) _then) = _$StartGameCopyWithImpl;
@useResult
$Res call({
 GameOptionsParams? options
});


$GameOptionsParamsCopyWith<$Res>? get options;

}
/// @nodoc
class _$StartGameCopyWithImpl<$Res>
    implements $StartGameCopyWith<$Res> {
  _$StartGameCopyWithImpl(this._self, this._then);

  final StartGame _self;
  final $Res Function(StartGame) _then;

/// Create a copy of PokemonGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? options = freezed,}) {
  return _then(StartGame(
options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as GameOptionsParams?,
  ));
}

/// Create a copy of PokemonGameEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameOptionsParamsCopyWith<$Res>? get options {
    if (_self.options == null) {
    return null;
  }

  return $GameOptionsParamsCopyWith<$Res>(_self.options!, (value) {
    return _then(_self.copyWith(options: value));
  });
}
}

/// @nodoc


class MakeGuess implements PokemonGameEvent {
  const MakeGuess(this.name);
  

 final  String name;

/// Create a copy of PokemonGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MakeGuessCopyWith<MakeGuess> get copyWith => _$MakeGuessCopyWithImpl<MakeGuess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MakeGuess&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'PokemonGameEvent.makeGuess(name: $name)';
}


}

/// @nodoc
abstract mixin class $MakeGuessCopyWith<$Res> implements $PokemonGameEventCopyWith<$Res> {
  factory $MakeGuessCopyWith(MakeGuess value, $Res Function(MakeGuess) _then) = _$MakeGuessCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$MakeGuessCopyWithImpl<$Res>
    implements $MakeGuessCopyWith<$Res> {
  _$MakeGuessCopyWithImpl(this._self, this._then);

  final MakeGuess _self;
  final $Res Function(MakeGuess) _then;

/// Create a copy of PokemonGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(MakeGuess(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StartNewRound implements PokemonGameEvent {
  const StartNewRound({this.options});
  

 final  GameOptionsParams? options;

/// Create a copy of PokemonGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartNewRoundCopyWith<StartNewRound> get copyWith => _$StartNewRoundCopyWithImpl<StartNewRound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartNewRound&&(identical(other.options, options) || other.options == options));
}


@override
int get hashCode => Object.hash(runtimeType,options);

@override
String toString() {
  return 'PokemonGameEvent.startNewRound(options: $options)';
}


}

/// @nodoc
abstract mixin class $StartNewRoundCopyWith<$Res> implements $PokemonGameEventCopyWith<$Res> {
  factory $StartNewRoundCopyWith(StartNewRound value, $Res Function(StartNewRound) _then) = _$StartNewRoundCopyWithImpl;
@useResult
$Res call({
 GameOptionsParams? options
});


$GameOptionsParamsCopyWith<$Res>? get options;

}
/// @nodoc
class _$StartNewRoundCopyWithImpl<$Res>
    implements $StartNewRoundCopyWith<$Res> {
  _$StartNewRoundCopyWithImpl(this._self, this._then);

  final StartNewRound _self;
  final $Res Function(StartNewRound) _then;

/// Create a copy of PokemonGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? options = freezed,}) {
  return _then(StartNewRound(
options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as GameOptionsParams?,
  ));
}

/// Create a copy of PokemonGameEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameOptionsParamsCopyWith<$Res>? get options {
    if (_self.options == null) {
    return null;
  }

  return $GameOptionsParamsCopyWith<$Res>(_self.options!, (value) {
    return _then(_self.copyWith(options: value));
  });
}
}

/// @nodoc


class TimerTick implements PokemonGameEvent {
  const TimerTick(this.secondsElapsed);
  

 final  int secondsElapsed;

/// Create a copy of PokemonGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerTickCopyWith<TimerTick> get copyWith => _$TimerTickCopyWithImpl<TimerTick>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerTick&&(identical(other.secondsElapsed, secondsElapsed) || other.secondsElapsed == secondsElapsed));
}


@override
int get hashCode => Object.hash(runtimeType,secondsElapsed);

@override
String toString() {
  return 'PokemonGameEvent.timerTick(secondsElapsed: $secondsElapsed)';
}


}

/// @nodoc
abstract mixin class $TimerTickCopyWith<$Res> implements $PokemonGameEventCopyWith<$Res> {
  factory $TimerTickCopyWith(TimerTick value, $Res Function(TimerTick) _then) = _$TimerTickCopyWithImpl;
@useResult
$Res call({
 int secondsElapsed
});




}
/// @nodoc
class _$TimerTickCopyWithImpl<$Res>
    implements $TimerTickCopyWith<$Res> {
  _$TimerTickCopyWithImpl(this._self, this._then);

  final TimerTick _self;
  final $Res Function(TimerTick) _then;

/// Create a copy of PokemonGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? secondsElapsed = null,}) {
  return _then(TimerTick(
null == secondsElapsed ? _self.secondsElapsed : secondsElapsed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$PokemonGameState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonGameState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PokemonGameState()';
}


}

/// @nodoc
class $PokemonGameStateCopyWith<$Res>  {
$PokemonGameStateCopyWith(PokemonGameState _, $Res Function(PokemonGameState) __);
}


/// @nodoc


class Initial implements PokemonGameState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PokemonGameState.initial()';
}


}




/// @nodoc


class Loading implements PokemonGameState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PokemonGameState.loading()';
}


}




/// @nodoc


class Error implements PokemonGameState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of PokemonGameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PokemonGameState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $PokemonGameStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of PokemonGameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InProgress implements PokemonGameState {
  const InProgress({required final  List<PokemonEntity> pokemons, required this.correctPokemon, required this.secondsLeft, this.streak = 0}): _pokemons = pokemons;
  

 final  List<PokemonEntity> _pokemons;
 List<PokemonEntity> get pokemons {
  if (_pokemons is EqualUnmodifiableListView) return _pokemons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pokemons);
}

 final  PokemonEntity correctPokemon;
 final  int secondsLeft;
@JsonKey() final  int streak;

/// Create a copy of PokemonGameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InProgressCopyWith<InProgress> get copyWith => _$InProgressCopyWithImpl<InProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InProgress&&const DeepCollectionEquality().equals(other._pokemons, _pokemons)&&(identical(other.correctPokemon, correctPokemon) || other.correctPokemon == correctPokemon)&&(identical(other.secondsLeft, secondsLeft) || other.secondsLeft == secondsLeft)&&(identical(other.streak, streak) || other.streak == streak));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pokemons),correctPokemon,secondsLeft,streak);

@override
String toString() {
  return 'PokemonGameState.inProgress(pokemons: $pokemons, correctPokemon: $correctPokemon, secondsLeft: $secondsLeft, streak: $streak)';
}


}

/// @nodoc
abstract mixin class $InProgressCopyWith<$Res> implements $PokemonGameStateCopyWith<$Res> {
  factory $InProgressCopyWith(InProgress value, $Res Function(InProgress) _then) = _$InProgressCopyWithImpl;
@useResult
$Res call({
 List<PokemonEntity> pokemons, PokemonEntity correctPokemon, int secondsLeft, int streak
});


$PokemonEntityCopyWith<$Res> get correctPokemon;

}
/// @nodoc
class _$InProgressCopyWithImpl<$Res>
    implements $InProgressCopyWith<$Res> {
  _$InProgressCopyWithImpl(this._self, this._then);

  final InProgress _self;
  final $Res Function(InProgress) _then;

/// Create a copy of PokemonGameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pokemons = null,Object? correctPokemon = null,Object? secondsLeft = null,Object? streak = null,}) {
  return _then(InProgress(
pokemons: null == pokemons ? _self._pokemons : pokemons // ignore: cast_nullable_to_non_nullable
as List<PokemonEntity>,correctPokemon: null == correctPokemon ? _self.correctPokemon : correctPokemon // ignore: cast_nullable_to_non_nullable
as PokemonEntity,secondsLeft: null == secondsLeft ? _self.secondsLeft : secondsLeft // ignore: cast_nullable_to_non_nullable
as int,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of PokemonGameState
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


class Result implements PokemonGameState {
  const Result({required this.result, this.streak = 0});
  

 final  GameResult result;
@JsonKey() final  int streak;

/// Create a copy of PokemonGameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultCopyWith<Result> get copyWith => _$ResultCopyWithImpl<Result>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result&&(identical(other.result, result) || other.result == result)&&(identical(other.streak, streak) || other.streak == streak));
}


@override
int get hashCode => Object.hash(runtimeType,result,streak);

@override
String toString() {
  return 'PokemonGameState.result(result: $result, streak: $streak)';
}


}

/// @nodoc
abstract mixin class $ResultCopyWith<$Res> implements $PokemonGameStateCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) _then) = _$ResultCopyWithImpl;
@useResult
$Res call({
 GameResult result, int streak
});


$GameResultCopyWith<$Res> get result;

}
/// @nodoc
class _$ResultCopyWithImpl<$Res>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._self, this._then);

  final Result _self;
  final $Res Function(Result) _then;

/// Create a copy of PokemonGameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,Object? streak = null,}) {
  return _then(Result(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as GameResult,streak: null == streak ? _self.streak : streak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of PokemonGameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameResultCopyWith<$Res> get result {
  
  return $GameResultCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
