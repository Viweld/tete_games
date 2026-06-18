part of 'profile_section_bloc.dart';

@freezed
sealed class ProfileSectionEvent with _$ProfileSectionEvent {
  const factory ProfileSectionEvent.profileChanged({required PlayerProfile? profile}) =
      ProfileSectionProfileChanged;

  const factory ProfileSectionEvent.connectionStateChanged({required bool isConnected}) =
      ProfileSectionConnectionStateChanged;

  const factory ProfileSectionEvent.editProfileTapped() = ProfileSectionEditProfileTapped;

  const factory ProfileSectionEvent.effectHandled() = ProfileSectionEffectHandled;
}
