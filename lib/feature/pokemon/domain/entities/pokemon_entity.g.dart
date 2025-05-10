// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PokemonEntity _$PokemonEntityFromJson(Map<String, dynamic> json) =>
    _PokemonEntity(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      silhouetteUrl: json['silhouetteUrl'] as String,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      stats: PokemonStatsEntity.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonEntityToJson(_PokemonEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'silhouetteUrl': instance.silhouetteUrl,
      'types': instance.types,
      'stats': instance.stats,
    };

_PokemonStatsEntity _$PokemonStatsEntityFromJson(Map<String, dynamic> json) =>
    _PokemonStatsEntity(
      hp: (json['hp'] as num).toInt(),
      attack: (json['attack'] as num).toInt(),
      defense: (json['defense'] as num).toInt(),
      specialAttack: (json['specialAttack'] as num).toInt(),
      specialDefense: (json['specialDefense'] as num).toInt(),
      speed: (json['speed'] as num).toInt(),
    );

Map<String, dynamic> _$PokemonStatsEntityToJson(_PokemonStatsEntity instance) =>
    <String, dynamic>{
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'specialAttack': instance.specialAttack,
      'specialDefense': instance.specialDefense,
      'speed': instance.speed,
    };
