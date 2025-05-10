import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokemon_task/feature/leaderboard/presentation/bloc/leaderboard_bloc.dart';
import 'package:pokemon_task/feature/leaderboard/presentation/bloc/leaderboard_event.dart';

abstract class UserDataSource {
  Future<void> updateUserScore({required int score, required bool isCorrect});

  Future<String?> getCurrentUserId();

  Future<String> getCurrentUserName();
}

class FirebaseUserDataSource implements UserDataSource {
  final FirebaseAuth _auth;
  final LeaderboardBloc _leaderboardBloc;

  FirebaseUserDataSource({
    required FirebaseAuth auth,
    required LeaderboardBloc leaderboardBloc,
  }) : _auth = auth,
       _leaderboardBloc = leaderboardBloc;

  @override
  Future<void> updateUserScore({
    required int score,
    required bool isCorrect,
  }) async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) return;

    _leaderboardBloc.add(
      LeaderboardEvent.updateUserScore(
        userId: currentUser.uid,
        name: currentUser.displayName ?? 'Player',
        scoreToAdd: score,
        isCorrectAnswer: isCorrect,
      ),
    );
  }

  @override
  Future<String?> getCurrentUserId() async {
    return _auth.currentUser?.uid;
  }

  @override
  Future<String> getCurrentUserName() async {
    return _auth.currentUser?.displayName ?? 'Player';
  }
}
