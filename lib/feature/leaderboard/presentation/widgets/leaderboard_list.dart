import 'package:flutter/material.dart';
import '../../domain/entities/leaderboard_entry.dart';
import '../bloc/leaderboard_state.dart';

class LeaderboardList extends StatelessWidget {
  final List<LeaderboardEntry> entries;
  final String? currentUserId;
  final LeaderboardTab leaderboardType;

  const LeaderboardList({
    super.key,
    required this.entries,
    this.currentUserId,
    required this.leaderboardType,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        final isCurrentUser = entry.userId == currentUserId;

        return Card(
          elevation: isCurrentUser ? 4 : 1,
          margin: const EdgeInsets.symmetric(vertical: 8),
          color: isCurrentUser ? Colors.blue.withOpacity(0.1) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side:
                isCurrentUser
                    ? BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    )
                    : BorderSide.none,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                _buildRank(index),
                const SizedBox(width: 16),
                _buildUserInfo(entry),
                const Spacer(),
                _buildScore(entry),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRank(int index) {
    final rankColors = [
      Colors.amber, // Gold
      Colors.grey.shade400, // Silver
      Colors.brown.shade300, // Bronze
    ];

    final rankColor = index < 3 ? rankColors[index] : Colors.blue.shade200;
    final rankSize = index < 3 ? 24.0 : 20.0;

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: rankColor.withOpacity(0.2),
        shape: BoxShape.circle,
        border: Border.all(color: rankColor, width: 2),
      ),
      child: Center(
        child: Text(
          '${index + 1}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: rankSize,
            color: rankColor,
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo(LeaderboardEntry entry) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entry.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.access_time, size: 14, color: Colors.grey.shade600),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  'Last played: ${_formatDate(entry.lastPlayed)}',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScore(LeaderboardEntry entry) {
    IconData icon;
    String label;
    Color color;
    String value;

    switch (leaderboardType) {
      case LeaderboardTab.scores:
        icon = Icons.score;
        label = 'Score';
        color = Colors.green;
        value = entry.score.toString();
        break;
      case LeaderboardTab.streaks:
        icon = Icons.local_fire_department;
        label = 'Best Streak';
        color = Colors.orange;
        value = entry.streak.toString();
        break;
      case LeaderboardTab.dailyStreaks:
        icon = Icons.calendar_today;
        label = 'Daily Streak';
        color = Colors.purple;
        value = entry.dailyStreak.toString();
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
