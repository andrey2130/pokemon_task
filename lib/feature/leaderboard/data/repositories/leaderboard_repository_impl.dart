import 'package:pokemon_task/feature/leaderboard/domain/entities/leaderboard_entry.dart';
import 'package:pokemon_task/feature/leaderboard/domain/repositories/leaderboard_repository.dart';
import '../datasource/leaderboard_data_source.dart';

class LeaderboardRepositoryImpl implements LeaderboardRepository {
  final LeaderboardDataSource _dataSource;

  LeaderboardRepositoryImpl(this._dataSource);

  @override
  Future<List<LeaderboardEntry>> getTopScores({int limit = 10}) async {
    final data = await _dataSource.getTopScores(limit: limit);
    return data
        .map((json) => LeaderboardEntry.fromMap(json, json['id']))
        .toList();
  }

  @override
  Future<List<LeaderboardEntry>> getTopDailyStreaks({int limit = 10}) async {
    final data = await _dataSource.getTopDailyStreaks(limit: limit);
    return data
        .map((json) => LeaderboardEntry.fromMap(json, json['id']))
        .toList();
  }

  @override
  Future<List<LeaderboardEntry>> getTopStreaks({int limit = 10}) async {
    final data = await _dataSource.getTopStreaks(limit: limit);
    return data
        .map((json) => LeaderboardEntry.fromMap(json, json['id']))
        .toList();
  }

  @override
  Future<void> updateUserScore({
    required String userId,
    required String name,
    required int scoreToAdd,
    required bool isCorrectAnswer,
    required DateTime playedAt,
  }) async {
    await _dataSource.updateUserScore(
      userId: userId,
      name: name,
      scoreToAdd: scoreToAdd,
      isCorrectAnswer: isCorrectAnswer,
      playedAt: playedAt,
    );
  }
}
