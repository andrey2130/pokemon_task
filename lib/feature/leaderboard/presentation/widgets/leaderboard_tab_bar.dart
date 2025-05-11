import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/leaderboard_bloc.dart';

class LeaderboardTabBar extends StatelessWidget {
  const LeaderboardTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaderboardBloc, LeaderboardState>(
      buildWhen:
          (previous, current) => previous.currentTab != current.currentTab,
      builder: (context, state) {
        return Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              _buildTabItem(
                context,
                icon: Icons.score,
                label: 'Scores',
                isSelected: state.isScoresTab,
                onTap: () => _onTabSelected(context, LeaderboardTab.scores),
              ),
              _buildTabItem(
                context,
                icon: Icons.local_fire_department,
                label: 'Streaks',
                isSelected: state.isStreaksTab,
                onTap: () => _onTabSelected(context, LeaderboardTab.streaks),
              ),
              _buildTabItem(
                context,
                icon: Icons.calendar_today,
                label: 'Daily',
                isSelected: state.isDailyStreaksTab,
                onTap:
                    () => _onTabSelected(context, LeaderboardTab.dailyStreaks),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTabSelected(BuildContext context, LeaderboardTab tab) {
    final bloc = context.read<LeaderboardBloc>();

    switch (tab) {
      case LeaderboardTab.scores:
        bloc.add(const LeaderboardEvent.loadTopScores());
        break;
      case LeaderboardTab.streaks:
        bloc.add(const LeaderboardEvent.loadTopStreaks());
        break;
      case LeaderboardTab.dailyStreaks:
        bloc.add(const LeaderboardEvent.loadTopDailyStreaks());
        break;
    }
  }
}
