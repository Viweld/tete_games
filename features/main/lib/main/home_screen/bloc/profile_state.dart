part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    PlayerProfile? profile,
    @Default(false) bool isLoading,
    ProfileEffect? effect,
  }) = _ProfileState;
}
