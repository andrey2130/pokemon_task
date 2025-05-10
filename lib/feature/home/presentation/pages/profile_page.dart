import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon_task/feature/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:pokemon_task/core/theme/bloc/theme_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? 'user@example.com';
    final displayName = user?.displayName ?? 'User';

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: StreamBuilder<DocumentSnapshot>(
        stream:
            FirebaseFirestore.instance
                .collection('users')
                .doc(user?.uid)
                .snapshots(),
        builder: (context, snapshot) {
          int bestStreak = 0;
          int gamesPlayed = 0;
          int correctAnswers = 0;
          int totalAnswers = 0;
          int dailyStreak = 0;
          int currentStreak = 0;

          if (snapshot.hasData && snapshot.data!.exists) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            bestStreak = userData['bestStreak'] ?? 0;
            gamesPlayed = userData['gamesPlayed'] ?? 0;
            correctAnswers = userData['correctAnswers'] ?? 0;
            totalAnswers = userData['totalAnswers'] ?? 0;
            dailyStreak = userData['dailyStreak'] ?? 0;
            currentStreak = userData['currentStreak'] ?? 0;
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    displayName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),

                  // Show the total score of the user
                  const Divider(),
                  const SizedBox(height: 20),
                  const Text(
                    'Game Statistics',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // Game statistics
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatCard(
                        context,
                        'Current Streak',
                        currentStreak.toString(),
                        Icons.local_fire_department,
                        Colors.deepOrange,
                      ),
                      _buildStatCard(
                        context,
                        'Best Streak',
                        bestStreak.toString(),
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
                        dailyStreak.toString(),
                        Icons.calendar_today,
                        Colors.purple,
                      ),
                      _buildStatCard(
                        context,
                        'Games Played',
                        gamesPlayed.toString(),
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
                        correctAnswers.toString(),
                        Icons.check_circle,
                        Colors.green,
                      ),
                      if (totalAnswers > 0)
                        _buildStatCard(
                          context,
                          'Accuracy',
                          '${((correctAnswers / totalAnswers) * 100).toStringAsFixed(1)}%',
                          Icons.analytics,
                          Colors.teal,
                        ),
                      if (totalAnswers == 0)
                        _buildStatCard(
                          context,
                          'Accuracy',
                          '0%',
                          Icons.analytics,
                          Colors.teal,
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 10),

                  // Theme toggle switch
                  BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, themeState) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dark Mode',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(context).textTheme.bodyLarge?.color,
                            ),
                          ),
                          Switch.adaptive(
                            value: themeState.themeMode == AppThemeMode.dark,
                            onChanged: (value) {
                              context.read<ThemeBloc>().add(
                                const ThemeEvent.toggleTheme(),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 20),

                  // Exit button (using TextButton for less emphasis than ElevatedButton)
                  TextButton(
                    onPressed: () {
                      context.read<AuthBlocBloc>().add(
                        const AuthBlocEvent.signOut(),
                      );
                      // Optionally, navigate to login or show a confirmation
                    },
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
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
