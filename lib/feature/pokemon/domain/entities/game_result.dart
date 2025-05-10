import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokemon_task/feature/pokemon/domain/entities/pokemon_entity.dart';

part 'game_result.freezed.dart';

@freezed
abstract class GameResult with _$GameResult {
  const factory GameResult({
    required PokemonEntity correctPokemon,
    required String selectedName,
    required bool isCorrect,
    required int timeSpent,
  }) = _GameResult;
}
