import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_task/feature/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:pokemon_task/core/theme/bloc/theme_bloc.dart';
import 'package:pokemon_task/core/usecase/usecases.dart';
import 'package:pokemon_task/feature/game/domain/repositories/user_stats_repository.dart';
import 'package:pokemon_task/feature/game/domain/usecases/get_user_info_usecase.dart';
import 'package:pokemon_task/feature/game/domain/usecases/get_user_stats_stream_usecase.dart';
import 'package:pokemon_task/service_locator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getUserInfo = sl<GetUserInfoUseCase>();
    final getUserStats = sl<GetUserStatsStreamUseCase>();

    return FutureBuilder<UserBasicInfo?>(
      future: getUserInfo(const NoParams()),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator.adaptive()),
          );
        }

        final userInfo = userSnapshot.data;
        if (userInfo == null) {
          return const Scaffold(
            body: Center(child: Text('Not able to load user data')),
          );
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Profile')),
          body: FutureBuilder<Stream<UserStats?>>(
            future: getUserStats(const NoParams()),
            builder: (context, streamSnapshot) {
              if (!streamSnapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              return StreamBuilder<UserStats?>(
                stream: streamSnapshot.data,
                builder: (context, statsSnapshot) {
                  UserStats stats = statsSnapshot.data ?? UserStats();

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _UserInfoSection(userInfo: userInfo),
                          const Divider(),
                          const SizedBox(height: 20),
                          _UserStatsSection(stats: stats),
                          const SizedBox(height: 20),
                          const Divider(),
                          const SizedBox(height: 10),
                          _ThemeToggleSection(),
                          const SizedBox(height: 10),
                          const Divider(),
                          const SizedBox(height: 20),
                          _SignOutButton(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _UserInfoSection extends StatelessWidget {
  final UserBasicInfo userInfo;

  const _UserInfoSection({required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          userInfo.displayName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          userInfo.email,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}

class _UserStatsSection extends StatelessWidget {
  final UserStats stats;

  const _UserStatsSection({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Game Statistics',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatCard(
              context,
              'Current Streak',
              stats.currentStreak.toString(),
              Icons.local_fire_department,
              Colors.deepOrange,
            ),
            _buildStatCard(
              context,
              'Best Streak',
              stats.bestStreak.toString(),
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
              'Daily Streak',
              stats.dailyStreak.toString(),
              Icons.calendar_today,
              Colors.purple,
            ),
            _buildStatCard(
              context,
              'Games Played',
              stats.gamesPlayed.toString(),
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
              'Correct Answers',
              stats.correctAnswers.toString(),
              Icons.check_circle,
              Colors.green,
            ),
            if (stats.totalAnswers > 0)
              _buildStatCard(
                context,
                'Accuracy',
                '${((stats.correctAnswers / stats.totalAnswers) * 100).toStringAsFixed(1)}%',
                Icons.analytics,
                Colors.teal,
              ),
            if (stats.totalAnswers == 0)
              _buildStatCard(
                context,
                'Accuracy',
                '0%',
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

class _ThemeToggleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dark Mode',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            Switch.adaptive(
              value: themeState.themeMode == AppThemeMode.dark,
              onChanged: (value) {
                context.read<ThemeBloc>().add(const ThemeEvent.toggleTheme());
              },
            ),
          ],
        );
      },
    );
  }
}

class _SignOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<AuthBlocBloc>().add(const AuthBlocEvent.signOut());
      },
      child: const Text(
        'Sign Out',
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
