import 'package:flutter/material.dart';
import 'package:pokemon_task/feature/profile/domain/entities/user_entity.dart';

class UserStatsSection extends StatelessWidget {
  final UserEntity user;

  const UserStatsSection({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Game statistics',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatCard(
              context,
              'Current streak',
              user.currentStreak.toString(),
              Icons.local_fire_department,
              Colors.deepOrange,
            ),
            _buildStatCard(
              context,
              'Best streak',
              user.bestStreak.toString(),
              Icons.emoji_events,
              Colors.orange,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatCard(
              context,
              'Daily streak',
              user.dailyStreak.toString(),
              Icons.calendar_today,
              Colors.purple,
            ),
            _buildStatCard(
              context,
              'Games played',
              user.gamesPlayed.toString(),
              Icons.videogame_asset,
              Colors.blueAccent,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatCard(
              context,
              'Correct answers',
              user.correctAnswers.toString(),
              Icons.check_circle,
              Colors.green,
            ),
            _buildStatCard(
              context,
              'Accuracy',
              user.totalAnswers > 0
                  ? '${((user.correctAnswers / user.totalAnswers) * 100).toStringAsFixed(1)}%'
                  : '0%',
              Icons.analytics,
              Colors.teal,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: color.withOpacity(0.8),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}