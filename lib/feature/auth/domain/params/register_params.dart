import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_params.freezed.dart';
part 'register_params.g.dart';

@freezed
abstract class RegisterParams with _$RegisterParams {
  const factory RegisterParams({
    required String name,
    required String email,
    required String password,
  }) = _RegisterParams;

  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);
}
