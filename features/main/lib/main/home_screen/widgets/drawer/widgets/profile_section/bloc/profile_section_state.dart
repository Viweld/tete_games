part of 'profile_section_bloc.dart';

@freezed
abstract class ProfileSectionState with _$ProfileSectionState {
  const factory ProfileSectionState({
    PlayerProfile? profile,
    @Default(false) bool isConnected,
    ProfileSectionEffect? effect,
  }) = _ProfileSectionState;
}
