import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_params.freezed.dart';
part 'leaderboard_params.g.dart';

@freezed
abstract class LeaderboardParams with _$LeaderboardParams {
  const factory LeaderboardParams({@Default(10) int limit}) =
      _LeaderboardParams;

  factory LeaderboardParams.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardParamsFromJson(json);
}

@freezed
abstract class UserScoreParams with _$UserScoreParams {
  const factory UserScoreParams({
    required String userId,
    required String name,
    required int scoreToAdd,
    required bool isCorrectAnswer,
    DateTime? playedAt,
  }) = _UserScoreParams;

  factory UserScoreParams.fromJson(Map<String, dynamic> json) =>
      _$UserScoreParamsFromJson(json);
}
