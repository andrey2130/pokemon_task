import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_task/feature/pokemon/domain/entities/pokemon_entity.dart';

class PokemonSilhouette extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonSilhouette({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: pokemon.imageUrl,
              placeholder:
                  (context, url) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
              errorWidget:
                  (context, url, error) =>
                      Icon(Icons.error, color: theme.colorScheme.error),
            ),
          ),
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                theme.colorScheme.primary.withOpacity(0.85),
                BlendMode.modulate,
              ),
              child: Container(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
