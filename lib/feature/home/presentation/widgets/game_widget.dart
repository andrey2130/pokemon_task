import 'package:flutter/material.dart';
import 'package:pokemon_task/feature/home/presentation/widgets/pokemon_choice_grid.dart';
import 'package:pokemon_task/feature/home/presentation/widgets/pokemon_silhouette.dart';
import 'package:pokemon_task/feature/pokemon/domain/entities/pokemon_entity.dart';

class GameWidget extends StatelessWidget {
  final List<PokemonEntity> pokemons;
  final PokemonEntity correctPokemon;
  final int secondsLeft;
  final int streak;
  final int currentRound;
  final int totalRounds;

  const GameWidget({
    super.key,
    required this.pokemons,
    required this.correctPokemon,
    required this.secondsLeft,
    required this.streak,
    required this.currentRound,
    required this.totalRounds,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildHeader(context, streak, secondsLeft),
          const SizedBox(height: 20),
          Expanded(
            child: Center(child: PokemonSilhouette(pokemon: correctPokemon)),
          ),
          const SizedBox(height: 20),
          const Text(
            'Who\'s That Pokémon?',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(child: PokemonChoiceGrid(pokemons: pokemons)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, int streak, int secondsLeft) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(
                Icons.local_fire_department,
                color: theme.colorScheme.secondary,
              ),
              const SizedBox(width: 4),
              Text(
                'Streak: $streak',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color:
                secondsLeft < 10
                    ? theme.colorScheme.errorContainer
                    : secondsLeft < 15
                    ? theme.colorScheme.tertiaryContainer
                    : theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(
                Icons.timer,
                color:
                    secondsLeft < 10
                        ? theme.colorScheme.error
                        : theme.colorScheme.primary,
              ),
              const SizedBox(width: 4),
              Text(
                '$secondsLeft s',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      secondsLeft < 10
                          ? theme.colorScheme.onErrorContainer
                          : secondsLeft < 15
                          ? theme.colorScheme.onTertiaryContainer
                          : theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
