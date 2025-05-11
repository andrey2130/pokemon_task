part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.refreshing(UserEntity user) = Refreshing;
  const factory ProfileState.loaded(UserEntity user) = Loaded;
  const factory ProfileState.error(String message) = Error;
}
