import 'package:cloud_firestore/cloud_firestore.dart';

abstract class LeaderboardDataSource {
  Future<List<Map<String, dynamic>>> getTopScores({required int limit});
  Future<List<Map<String, dynamic>>> getTopStreaks({required int limit});
  Future<List<Map<String, dynamic>>> getTopDailyStreaks({required int limit});
  Future<void> updateUserScore({
    required String userId,
    required String name,
    required int scoreToAdd,
    required bool isCorrectAnswer,
    required DateTime playedAt,
  });
}

class FirebaseLeaderboardDataSource implements LeaderboardDataSource {
  final FirebaseFirestore _firestore;
  final String _usersCollection = 'users';

  FirebaseLeaderboardDataSource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<Map<String, dynamic>>> getTopScores({required int limit}) async {
    final querySnapshot =
        await _firestore
            .collection(_usersCollection)
            .orderBy('score', descending: true)
            .limit(limit)
            .get();

    return _extractData(querySnapshot);
  }

  @override
  Future<List<Map<String, dynamic>>> getTopStreaks({required int limit}) async {
    final querySnapshot =
        await _firestore
            .collection(_usersCollection)
            .orderBy('bestStreak', descending: true)
            .limit(limit)
            .get();

    return _extractData(querySnapshot);
  }

  @override
  Future<List<Map<String, dynamic>>> getTopDailyStreaks({
    required int limit,
  }) async {
    final querySnapshot =
        await _firestore
            .collection(_usersCollection)
            .orderBy('dailyStreak', descending: true)
            .limit(limit)
            .get();

    return _extractData(querySnapshot);
  }

  @override
  Future<void> updateUserScore({
    required String userId,
    required String name,
    required int scoreToAdd,
    required bool isCorrectAnswer,
    required DateTime playedAt,
  }) async {
    final userRef = _firestore.collection(_usersCollection).doc(userId);

    final userDoc = await userRef.get();

    if (!userDoc.exists) {
      await userRef.set({
        'name': name,
        'score': scoreToAdd,
        'correctAnswers': isCorrectAnswer ? 1 : 0,
        'totalAnswers': 1,
        'bestStreak': isCorrectAnswer ? 1 : 0,
        'currentStreak': isCorrectAnswer ? 1 : 0,
        'dailyStreak': 1,
        'lastPlayed': playedAt,
        'lastPlayedDay': _formatDateKey(playedAt),
      });
      return;
    }

    final userData = userDoc.data() as Map<String, dynamic>;

    // Calculate the current streak
    int currentStreak = userData['currentStreak'] ?? 0;
    if (isCorrectAnswer) {
      currentStreak += 1;
    } else {
      currentStreak = 0;
    }

    // Calculate the best streak
    int bestStreak = userData['bestStreak'] ?? 0;
    if (currentStreak > bestStreak) {
      bestStreak = currentStreak;
    }

    // Calculate daily streak
    int dailyStreak = userData['dailyStreak'] ?? 0;
    final String lastPlayedDay = userData['lastPlayedDay'] ?? '';
    final String today = _formatDateKey(playedAt);

    if (lastPlayedDay != today) {
      final DateTime lastPlayedDate =
          lastPlayedDay.isNotEmpty
              ? DateTime.parse(lastPlayedDay)
              : playedAt.subtract(const Duration(days: 2));

      final DateTime yesterday = DateTime(
        playedAt.year,
        playedAt.month,
        playedAt.day - 1,
      );

      if (lastPlayedDate.year == yesterday.year &&
          lastPlayedDate.month == yesterday.month &&
          lastPlayedDate.day == yesterday.day) {
        dailyStreak += 1;
      } else {
        dailyStreak = 1;
      }
    }

    await userRef.update({
      'name': name,
      'score': FieldValue.increment(scoreToAdd),
      'correctAnswers': FieldValue.increment(isCorrectAnswer ? 1 : 0),
      'totalAnswers': FieldValue.increment(1),
      'bestStreak': bestStreak,
      'currentStreak': currentStreak,
      'dailyStreak': dailyStreak,
      'lastPlayed': playedAt,
      'lastPlayedDay': today,
    });
  }

  List<Map<String, dynamic>> _extractData(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return data;
    }).toList();
  }

  String _formatDateKey(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
