import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_task/feature/game/presentation/widgets/pokemon_stat_column.dart';
import 'package:pokemon_task/feature/game/presentation/widgets/pokemon_type_badge.dart';
import 'package:pokemon_task/feature/game/domain/entities/pokemon_entity.dart';

class PokemonDetailsCard extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonDetailsCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: pokemon.imageUrl,
          height: 200,
          placeholder:
              (context, url) => const CircularProgressIndicator.adaptive(),
          errorWidget:
              (context, url, error) =>
                  Icon(Icons.error, color: Theme.of(context).colorScheme.error),
        ),
        const SizedBox(height: 16),
        Text(
          _formatPokemonName(pokemon.name),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              pokemon.types
                  .map((type) => PokemonTypeBadge(type: type))
                  .toList(),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PokemonStatColumn(label: 'HP', value: pokemon.stats.hp),
            PokemonStatColumn(label: 'ATK', value: pokemon.stats.attack),
            PokemonStatColumn(label: 'DEF', value: pokemon.stats.defense),
            PokemonStatColumn(label: 'SPD', value: pokemon.stats.speed),
            PokemonStatColumn(
              label: 'SP.ATK',
              value: pokemon.stats.specialAttack,
            ),
            PokemonStatColumn(
              label: 'SP.DEF',
              value: pokemon.stats.specialDefense,
            ),
          ],
        ),
      ],
    );
  }

  /// Formats a pokemon name by capitalizing parts and replacing hyphens with spaces
  String _formatPokemonName(String name) {
    return name
        .split('-')
        .map((part) => part.substring(0, 1).toUpperCase() + part.substring(1))
        .join(' ');
  }
}
