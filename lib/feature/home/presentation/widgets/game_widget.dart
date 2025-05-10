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
    final isLightTheme = theme.brightness == Brightness.light;

    // Define colors based on theme
    Color streakBackgroundColor =
        isLightTheme
            ? Colors.blue.shade100
            : theme.colorScheme.secondaryContainer;
    Color streakIconColor =
        isLightTheme ? Colors.orangeAccent : theme.colorScheme.secondary;
    Color streakTextColor =
        isLightTheme ? Colors.black87 : theme.colorScheme.onSecondaryContainer;

    Color timerBackgroundColor;
    Color timerIconColor;
    Color timerTextColor;

    if (secondsLeft < 10) {
      timerBackgroundColor =
          isLightTheme ? Colors.red.shade100 : theme.colorScheme.errorContainer;
      timerIconColor =
          isLightTheme ? Colors.red.shade700 : theme.colorScheme.error;
      timerTextColor =
          isLightTheme
              ? Colors.red.shade900
              : theme.colorScheme.onErrorContainer;
    } else if (secondsLeft < 15) {
      timerBackgroundColor =
          isLightTheme
              ? Colors.amber.shade100
              : theme.colorScheme.tertiaryContainer;
      timerIconColor =
          isLightTheme
              ? Colors.amber.shade700
              : theme
                  .colorScheme
                  .tertiary; // Or theme.colorScheme.primary for dark
      timerTextColor =
          isLightTheme
              ? Colors.amber.shade900
              : theme.colorScheme.onTertiaryContainer;
    } else {
      timerBackgroundColor =
          isLightTheme
              ? Colors.green.shade100
              : theme.colorScheme.primaryContainer;
      timerIconColor =
          isLightTheme ? Colors.green.shade700 : theme.colorScheme.primary;
      timerTextColor =
          isLightTheme
              ? Colors.green.shade900
              : theme.colorScheme.onPrimaryContainer;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: streakBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(Icons.local_fire_department, color: streakIconColor),
              const SizedBox(width: 4),
              Text(
                'Streak: $streak',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: streakTextColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: timerBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(Icons.timer, color: timerIconColor),
              const SizedBox(width: 4),
              Text(
                '$secondsLeft s',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: timerTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
