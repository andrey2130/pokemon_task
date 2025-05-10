import '../entities/leaderboard_entry.dart';
import '../repositories/leaderboard_repository.dart';
import '../params/leaderboard_params.dart';

class GetTopDailyStreaks {
  final LeaderboardRepository repository;

  GetTopDailyStreaks(this.repository);

  Future<List<LeaderboardEntry>> call({int limit = 10}) async {
    final params = LeaderboardParams(limit: limit);
    return repository.getTopDailyStreaks(limit: params.limit);
  }
}
