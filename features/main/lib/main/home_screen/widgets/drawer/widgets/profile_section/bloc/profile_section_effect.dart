part of 'profile_section_bloc.dart';

@freezed
sealed class ProfileSectionEffect with _$ProfileSectionEffect {
  const factory ProfileSectionEffect.editProfileRequested() =
      ProfileSectionEditProfileRequestedEffect;
}
