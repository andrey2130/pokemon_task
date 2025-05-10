import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon_task/feature/home/domain/repositories/user_stats_repository.dart';

/// Implementation of UserStatsRepository that uses Firebase Firestore
class UserStatsRepositoryImpl implements UserStatsRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  UserStatsRepositoryImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  }) : _firestore = firestore,
       _auth = auth;

  @override
  Future<void> updateStats(
    int streak,
    bool isCorrect, {
    bool incrementTotalAnswers = true,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return;

    try {
      final userDoc = _firestore.collection('users').doc(user.uid);
      final userData = await userDoc.get();

      int currentBestStreak = 0;
      int correctAnswers = 0;
      int totalAnswers = 0;

      if (userData.exists) {
        final data = userData.data() as Map<String, dynamic>;
        currentBestStreak = data['bestStreak'] ?? 0;
        correctAnswers = data['correctAnswers'] ?? 0;
        totalAnswers = data['totalAnswers'] ?? 0;
      }

      final newBestStreak =
          streak > currentBestStreak ? streak : currentBestStreak;

      await userDoc.set({
        'bestStreak': newBestStreak,
        'correctAnswers': correctAnswers + (isCorrect ? 1 : 0),
        'totalAnswers': totalAnswers + (incrementTotalAnswers ? 1 : 0),
        'lastPlayed': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Error saving user stats: $e');
    }
  }

  @override
  Future<void> incrementGamesPlayed() async {
    final user = _auth.currentUser;
    if (user == null) return;

    try {
      final userDoc = _firestore.collection('users').doc(user.uid);
      final userData = await userDoc.get();

      int gamesPlayed = 0;

      if (userData.exists) {
        final data = userData.data() as Map<String, dynamic>;
        gamesPlayed = data['gamesPlayed'] ?? 0;
      }

      await userDoc.set({
        'gamesPlayed': gamesPlayed + 1,
      }, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Error saving completed game stats: $e');
    }
  }
}
