import '../entities/leaderboard_entry.dart';
import '../repositories/leaderboard_repository.dart';
import '../params/leaderboard_params.dart';
import '../../../../core/usecase/usecases.dart';

class GetTopStreaksUseCase
    implements UseCase<List<LeaderboardEntry>, LeaderboardParams> {
  final LeaderboardRepository repository;

  GetTopStreaksUseCase(this.repository);

  @override
  Future<List<LeaderboardEntry>> call(LeaderboardParams params) async {
    return repository.getTopStreaks(limit: params.limit);
  }
}
