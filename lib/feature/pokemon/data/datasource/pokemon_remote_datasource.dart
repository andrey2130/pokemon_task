import 'dart:math';

import 'package:dio/dio.dart';
import 'package:pokemon_task/feature/pokemon/domain/entities/pokemon_entity.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonEntity> getPokemonById(int id);
  Future<List<int>> getRandomPokemonIds(int count);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio _dio;
  final String _baseUrl = 'https://pokeapi.co/api/v2';
  final int _maxPokemonId = 898; // Total number of pokemons in the API

  PokemonRemoteDataSourceImpl(this._dio);

  @override
  Future<PokemonEntity> getPokemonById(int id) async {
    try {
      final response = await _dio.get('$_baseUrl/pokemon/$id');
      return _mapResponseToPokemonEntity(response.data);
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch Pokemon data');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<int>> getRandomPokemonIds(int count) async {
    try {
      final random = Random();
      final Set<int> uniqueIds = {};

      // Generate unique random IDs
      while (uniqueIds.length < count) {
        final id = random.nextInt(_maxPokemonId) + 1;
        uniqueIds.add(id);
      }

      return uniqueIds.toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Helper method to convert the API response to our model
  PokemonEntity _mapResponseToPokemonEntity(Map<String, dynamic> data) {
    final types =
        (data['types'] as List)
            .map((type) => type['type']['name'] as String)
            .toList();

    final stats = data['stats'] as List;

    // Create the URL for the silhouette (use the same URL, but we will apply the filter in the UI)
    final imageUrl =
        data['sprites']['other']['official-artwork']['front_default'];

    return PokemonEntity(
      id: data['id'],
      name: data['name'],
      imageUrl: imageUrl,
      silhouetteUrl:
          imageUrl, // Use the same URL, but we will apply the filter in the UI
      types: types,
      stats: PokemonStatsEntity(
        hp: _findStat(stats, 'hp'),
        attack: _findStat(stats, 'attack'),
        defense: _findStat(stats, 'defense'),
        specialAttack: _findStat(stats, 'special-attack'),
        specialDefense: _findStat(stats, 'special-defense'),
        speed: _findStat(stats, 'speed'),
      ),
    );
  }

  int _findStat(List stats, String name) {
    final stat = stats.firstWhere(
      (stat) => stat['stat']['name'] == name,
      orElse: () => {'base_stat': 0},
    );
    return stat['base_stat'];
  }
}
