import 'package:flutter/material.dart';
import 'package:pokemon_task/feature/home/presentation/widgets/pokemon_details_card.dart';
import 'package:pokemon_task/feature/pokemon/domain/entities/game_result.dart';

class ResultWidget extends StatelessWidget {
  final GameResult result;
  final int streak;
  final int currentRound;
  final int totalRounds;
  final VoidCallback onNextRound;
  final VoidCallback onViewResults;

  const ResultWidget({
    super.key,
    required this.result,
    required this.streak,
    required this.currentRound,
    required this.totalRounds,
    required this.onNextRound,
    required this.onViewResults,
  });

  @override
  Widget build(BuildContext context) {
    final correctPokemon = result.correctPokemon;
    final isCorrect = result.isCorrect;
    final theme = Theme.of(context);
    final isLightTheme = theme.brightness == Brightness.light;

    // Define colors based on theme
    Color roundInfoBackgroundColor =
        isLightTheme ? Colors.blue.shade100 : theme.colorScheme.surfaceVariant;
    Color roundInfoIconColor =
        isLightTheme
            ? Colors.blue.shade800
            : theme.colorScheme.onSurfaceVariant;
    Color roundInfoTextColor =
        isLightTheme ? Colors.black87 : theme.colorScheme.onSurfaceVariant;

    Color streakBackgroundColor =
        isLightTheme
            ? Colors.amber.shade100
            : theme.colorScheme.secondaryContainer;
    Color streakIconColor =
        isLightTheme ? Colors.orangeAccent : theme.colorScheme.secondary;
    Color streakTextColor =
        isLightTheme ? Colors.black87 : theme.colorScheme.onSecondaryContainer;

    Color resultMessageBackgroundColor =
        isCorrect
            ? (isLightTheme
                ? Colors.green.shade100
                : theme.colorScheme.primaryContainer)
            : (isLightTheme
                ? Colors.red.shade100
                : theme.colorScheme.errorContainer);
    Color resultMessageTextColor =
        isCorrect
            ? (isLightTheme
                ? Colors.green.shade800
                : theme.colorScheme.onPrimaryContainer)
            : (isLightTheme
                ? Colors.red.shade800
                : theme.colorScheme.onErrorContainer);

    Color buttonViewResultsBackgroundColor =
        isLightTheme ? Colors.green : theme.colorScheme.secondary;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: roundInfoBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.sports_score, color: roundInfoIconColor),
                  const SizedBox(width: 8),
                  Text(
                    'Round $currentRound of $totalRounds',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: roundInfoTextColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: streakBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.local_fire_department, color: streakIconColor),
                  const SizedBox(width: 8),
                  Text(
                    'Current Streak: $streak',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: streakTextColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: resultMessageBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                isCorrect
                    ? 'You caught it! 🎉'
                    : 'Oops! It was ${_formatPokemonName(correctPokemon.name)} 😅',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: resultMessageTextColor,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Center(child: PokemonDetailsCard(pokemon: correctPokemon)),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    currentRound < totalRounds ? onNextRound : onViewResults,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor:
                      currentRound < totalRounds
                          ? theme
                              .colorScheme
                              .primary // This should be fine for both themes as it's the primary action
                          : buttonViewResultsBackgroundColor,
                ),
                child: Text(
                  currentRound < totalRounds ? 'Next Round' : 'View Results',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
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
