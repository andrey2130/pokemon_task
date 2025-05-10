import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../bloc/leaderboard_bloc.dart';
import '../bloc/leaderboard_event.dart';
import '../bloc/leaderboard_state.dart';
import '../widgets/leaderboard_tab_bar.dart';
import '../widgets/leaderboard_list.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<LeaderboardBloc>(context)
        ..add(const LeaderboardEvent.loadTopScores()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Leaderboard')),
        body: Column(
          children: [
            const LeaderboardTabBar(),
            Expanded(child: _buildLeaderboardContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaderboardContent() {
    return BlocBuilder<LeaderboardBloc, LeaderboardState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  state.error!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final bloc = context.read<LeaderboardBloc>();
                    switch (state.currentTab) {
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
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          );
        }

        final entries = state.currentData;
        if (entries.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.emoji_events_outlined,
                  size: 64,
                  color: Colors.amber.withOpacity(0.5),
                ),
                const SizedBox(height: 16),
                const Text(
                  'No data yet!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Play games to start competing!',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        // Get current user ID to highlight their position
        final currentUserId = FirebaseAuth.instance.currentUser?.uid;

        return LeaderboardList(
          entries: entries,
          currentUserId: currentUserId,
          leaderboardType: state.currentTab,
        );
      },
    );
  }
}
