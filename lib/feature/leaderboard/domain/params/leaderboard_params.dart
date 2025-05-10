class LeaderboardParams {
  final int limit;

  const LeaderboardParams({this.limit = 10});
}

class UserScoreParams {
  final String userId;
  final String name;
  final int scoreToAdd;
  final bool isCorrectAnswer;
  final DateTime? playedAt;

  const UserScoreParams({
    required this.userId,
    required this.name,
    required this.scoreToAdd,
    required this.isCorrectAnswer,
    this.playedAt,
  });
}
