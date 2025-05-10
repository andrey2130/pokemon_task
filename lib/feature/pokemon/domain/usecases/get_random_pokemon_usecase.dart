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
    // Отримуємо випадкові ID покемонів
    final idsResult = await _repository.getRandomPokemonIds(
      params.optionsCount,
    );

    return idsResult.fold((failure) => left(failure), (ids) async {
      // Завантажуємо всіх покемонів
      final pokemonResults = await Future.wait(
        ids.map((id) => _repository.getPokemonById(id)),
      );

      // Перевіряємо чи є помилки
      for (final result in pokemonResults) {
        if (result.isLeft()) {
          return left(result.getLeft().toNullable()!);
        }
      }

      // Отримуємо список покемонів
      final pokemons =
          pokemonResults
              .map((result) => result.getRight().toNullable()!)
              .toList();

      return right(pokemons);
    });
  }
}
