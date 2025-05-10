import 'package:flutter/material.dart';

class GameFinishedWidget extends StatelessWidget {
  final int correctAnswers;
  final int totalRounds;
  final VoidCallback onPlayAgain;

  const GameFinishedWidget({
    super.key,
    required this.correctAnswers,
    required this.totalRounds,
    required this.onPlayAgain,
  });

  @override
  Widget build(BuildContext context) {
    final score = (correctAnswers / totalRounds * 100).toInt();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Game Finished!',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Your Score: $score%',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: _getScoreColor(score),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Correct Answers: $correctAnswers out of $totalRounds',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 30),
                Text(
                  _getScoreMessage(score),
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: onPlayAgain,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              backgroundColor: Colors.green,
            ),
            child: const Text('Play Again', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }

  /// Returns a message based on the player's score
  String _getScoreMessage(int score) {
    if (score >= 90) {
      return 'Amazing! You are a true Pokémon Master!';
    } else if (score >= 70) {
      return 'Great job! You know your Pokémon well!';
    } else if (score >= 50) {
      return 'Good effort! Keep training to become a Pokémon Master!';
    } else {
      return 'Keep practicing! Every Pokémon Master starts somewhere!';
    }
  }

  /// Returns a color based on the player's score
  Color _getScoreColor(int score) {
    if (score >= 90) {
      return Colors.purple;
    } else if (score >= 70) {
      return Colors.green.shade700;
    } else if (score >= 50) {
      return Colors.amber.shade700;
    } else {
      return Colors.red.shade700;
    }
  }
}
