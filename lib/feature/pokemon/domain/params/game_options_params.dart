import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_options_params.freezed.dart';
part 'game_options_params.g.dart';

@freezed
abstract class GameOptionsParams with _$GameOptionsParams {
  const factory GameOptionsParams({
    @Default(4) int optionsCount,
    @Default(30) int timerSeconds,
  }) = _GameOptionsParams;

  factory GameOptionsParams.fromJson(Map<String, dynamic> json) =>
      _$GameOptionsParamsFromJson(json);
}
