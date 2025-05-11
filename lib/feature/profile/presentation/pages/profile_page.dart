import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_task/feature/auth/presentation/bloc/auth_bloc_bloc.dart'
    as auth;
import 'package:pokemon_task/core/theme/bloc/theme_bloc.dart';
import 'package:pokemon_task/feature/profile/domain/entities/user_entity.dart';
import 'package:pokemon_task/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:pokemon_task/service_locator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => sl<ProfileBloc>()..add(const ProfileEvent.loadProfile()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is Initial) {
              return const Center(child: Text('Initializing...'));
            } else if (state is Loading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is Refreshing) {
              return _buildProfileContent(
                context,
                state.user,
                isRefreshing: true,
              );
            } else if (state is Loaded) {
              return _buildProfileContent(context, state.user);
            } else if (state is Error) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error: ${state.message}',
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed:
                          () => context.read<ProfileBloc>().add(
                            const ProfileEvent.loadProfile(),
                          ),
                      child: const Text('Try again'),
                    ),
                  ],
                ),
              );
            }

            return const Center(child: Text('Unknown state'));
          },
        ),
      ),
    );
  }

  Widget _buildProfileContent(
    BuildContext context,
    UserEntity user, {
    bool isRefreshing = false,
  }) {
    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async {
            context.read<ProfileBloc>().add(
              const ProfileEvent.refreshProfile(),
            );
            await Future.delayed(const Duration(milliseconds: 800));
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _UserInfoSection(user: user),
                  const Divider(),
                  const SizedBox(height: 20),
                  _UserStatsSection(user: user),
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
          ),
        ),
        if (isRefreshing)
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(),
          ),
      ],
    );
  }
}

class _UserInfoSection extends StatelessWidget {
  final UserEntity user;

  const _UserInfoSection({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          user.displayName,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          user.email,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}

class _UserStatsSection extends StatelessWidget {
  final UserEntity user;

  const _UserStatsSection({required this.user});

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

class _ThemeToggleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dark mode',
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
        context.read<auth.AuthBlocBloc>().add(
          const auth.AuthBlocEvent.signOut(),
        );
      },
      child: const Text(
        'Sign out',
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
