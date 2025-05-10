import '../entities/leaderboard_entry.dart';
import '../repositories/leaderboard_repository.dart';
import '../params/leaderboard_params.dart';

class GetTopScores {
  final LeaderboardRepository repository;

  GetTopScores(this.repository);

  Future<List<LeaderboardEntry>> call({int limit = 10}) async {
    final params = LeaderboardParams(limit: limit);
    return repository.getTopScores(limit: params.limit);
  }
}
