import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_task/feature/auth/presentation/bloc/auth_bloc_bloc.dart'
    as auth;

import 'package:pokemon_task/feature/profile/domain/entities/user_entity.dart';
import 'package:pokemon_task/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:pokemon_task/feature/profile/presentation/pages/widgets/theme_toggle.dart';
import 'package:pokemon_task/feature/profile/presentation/pages/widgets/user_info_section.dart';
import 'package:pokemon_task/feature/profile/presentation/pages/widgets/user_stats.dart';
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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserInfoSection(user: user),
                const Divider(),
                const SizedBox(height: 20),
                UserStatsSection(user: user),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),
                ThemeToggleSection(),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 20),
                _SignOutButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
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
