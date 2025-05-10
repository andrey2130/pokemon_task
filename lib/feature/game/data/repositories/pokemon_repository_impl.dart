import 'package:fpdart/fpdart.dart';
import 'package:pokemon_task/core/error_handling/failure.dart';
import 'package:pokemon_task/feature/game/data/datasource/pokemon_remote_datasource.dart';
import 'package:pokemon_task/feature/game/domain/entities/pokemon_entity.dart';
import 'package:pokemon_task/feature/game/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource _dataSource;

  PokemonRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, PokemonEntity>> getPokemonById(int id) async {
    try {
      final pokemon = await _dataSource.getPokemonById(id);
      return right(pokemon);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<int>>> getRandomPokemonIds(int count) async {
    try {
      final ids = await _dataSource.getRandomPokemonIds(count);
      return right(ids);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
