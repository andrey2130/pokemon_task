import 'package:flutter/material.dart';
import 'package:pokemon_task/feature/home/presentation/widgets/pokemon_details_card.dart';
import 'package:pokemon_task/feature/pokemon/domain/entities/game_result.dart';

/// Screen that displays the result of a guess
class ResultScreen extends StatelessWidget {
  final GameResult result;
  final int streak;
  final int currentRound;
  final int totalRounds;
  final VoidCallback onNextRound;
  final VoidCallback onViewResults;

  const ResultScreen({
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

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.sports_score, color: Colors.blue.shade800),
                const SizedBox(width: 8),
                Text(
                  'Round $currentRound of $totalRounds',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.local_fire_department,
                  color: Colors.orangeAccent,
                ),
                const SizedBox(width: 8),
                Text(
                  'Current Streak: $streak',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: isCorrect ? Colors.green.shade100 : Colors.red.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              isCorrect
                  ? 'You caught it! 🎉'
                  : 'Oops! It was ${_formatPokemonName(correctPokemon.name)} 😅',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isCorrect ? Colors.green.shade800 : Colors.red.shade800,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: Center(child: PokemonDetailsCard(pokemon: correctPokemon)),
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:
                  currentRound < totalRounds ? onNextRound : onViewResults,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor:
                    currentRound < totalRounds
                        ? Theme.of(context).primaryColor
                        : Colors.green,
              ),
              child: Text(
                currentRound < totalRounds ? 'Next Round' : 'View Results',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
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
