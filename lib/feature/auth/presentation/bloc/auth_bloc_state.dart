part of 'auth_bloc_bloc.dart';

@freezed
class AuthBlocState with _$AuthBlocState {
  const factory AuthBlocState.initial() = Initial;
  const factory AuthBlocState.loading() = Loading;
  const factory AuthBlocState.authenticated() = Authenticated;
  const factory AuthBlocState.unauthenticated() = Unauthenticated;
  const factory AuthBlocState.failure({required String message}) = Failure;
}
