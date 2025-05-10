import 'package:fpdart/fpdart.dart';
import 'package:pokemon_task/core/error_handling/failure.dart';
import 'package:pokemon_task/feature/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemon_task/feature/pokemon/domain/params/game_options_params.dart';
import 'package:pokemon_task/feature/pokemon/domain/repositories/pokemon_repository.dart';

class GetRandomPokemonUsecase {
  final PokemonRepository _repository;

  GetRandomPokemonUsecase(this._repository);

  Future<Either<Failure, List<PokemonEntity>>> call(
    GameOptionsParams params,
  ) async {
    // Get random pokemon IDs
    final idsResult = await _repository.getRandomPokemonIds(
      params.optionsCount,
    );

    return idsResult.fold((failure) => left(failure), (ids) async {
      // Load all pokemons
      final pokemonResults = await Future.wait(
        ids.map((id) => _repository.getPokemonById(id)),
      );

      // Check if there are any errors
      for (final result in pokemonResults) {
        if (result.isLeft()) {
          return left(result.getLeft().toNullable()!);
        }
      }

      // Get the list of pokemons
      final pokemons =
          pokemonResults
              .map((result) => result.getRight().toNullable()!)
              .toList();

      return right(pokemons);
    });
  }
}
