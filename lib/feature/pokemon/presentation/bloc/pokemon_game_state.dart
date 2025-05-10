part of 'pokemon_game_bloc.dart';

@freezed
class PokemonGameState with _$PokemonGameState {
  const factory PokemonGameState.initial() = Initial;
  const factory PokemonGameState.loading() = Loading;
  const factory PokemonGameState.error(String message) = Error;

  const factory PokemonGameState.inProgress({
    required List<PokemonEntity> pokemons,
    required PokemonEntity correctPokemon,
    required int secondsLeft,
    @Default(0) int streak,
  }) = InProgress;

  const factory PokemonGameState.result({
    required GameResult result,
    @Default(0) int streak,
  }) = Result;
}
