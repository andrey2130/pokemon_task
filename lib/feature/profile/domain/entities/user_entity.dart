import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String uid,
    required String email,
    required String displayName,
    @Default(0) int bestStreak,
    @Default(0) int gamesPlayed,
    @Default(0) int correctAnswers,
    @Default(0) int totalAnswers,
    @Default(0) int dailyStreak,
    @Default(0) int currentStreak,
  }) = _UserEntity;
}
