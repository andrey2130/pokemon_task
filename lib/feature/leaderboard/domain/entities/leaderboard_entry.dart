import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_entry.freezed.dart';
part 'leaderboard_entry.g.dart';

@freezed
abstract class LeaderboardEntry with _$LeaderboardEntry {
  const LeaderboardEntry._();

  const factory LeaderboardEntry({
    required String userId,
    required String name,
    required int score,
    required int streak,
    required int dailyStreak,
    required DateTime lastPlayed,
  }) = _LeaderboardEntry;

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardEntryFromJson(json);

  factory LeaderboardEntry.fromMap(Map<String, dynamic> map, String userId) {
    return LeaderboardEntry(
      userId: userId,
      name: map['name'] ?? 'Unknown Player',
      score: map['score'] ?? 0,
      streak: map['bestStreak'] ?? 0,
      dailyStreak: map['dailyStreak'] ?? 0,
      lastPlayed:
          map['lastPlayed'] != null
              ? (map['lastPlayed'] as Timestamp).toDate()
              : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'score': score,
      'bestStreak': streak,
      'dailyStreak': dailyStreak,
      'lastPlayed': lastPlayed,
    };
  }
}
