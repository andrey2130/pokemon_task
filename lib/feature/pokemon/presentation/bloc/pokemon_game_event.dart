part of 'pokemon_game_bloc.dart';

@freezed
class PokemonGameEvent with _$PokemonGameEvent {
  const factory PokemonGameEvent.startGame({GameOptionsParams? options}) =
      StartGame;
  const factory PokemonGameEvent.makeGuess(String name) = MakeGuess;
  const factory PokemonGameEvent.startNewRound({GameOptionsParams? options}) =
      StartNewRound;
  const factory PokemonGameEvent.timerTick(int secondsElapsed) = TimerTick;
}
