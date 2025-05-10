import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_entity.freezed.dart';
part 'pokemon_entity.g.dart';

@freezed
abstract class PokemonEntity with _$PokemonEntity {
  const factory PokemonEntity({
    required int id,
    required String name,
    required String imageUrl,
    required String silhouetteUrl,
    required List<String> types,
    required PokemonStatsEntity stats,
  }) = _PokemonEntity;

  factory PokemonEntity.fromJson(Map<String, dynamic> json) =>
      _$PokemonEntityFromJson(json);
}

@freezed
abstract class PokemonStatsEntity with _$PokemonStatsEntity {
  const factory PokemonStatsEntity({
    required int hp,
    required int attack,
    required int defense,
    required int specialAttack,
    required int specialDefense,
    required int speed,
  }) = _PokemonStatsEntity;

  factory PokemonStatsEntity.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatsEntityFromJson(json);
}
