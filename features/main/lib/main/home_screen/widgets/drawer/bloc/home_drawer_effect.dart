part of 'home_drawer_bloc.dart';

@freezed
sealed class HomeDrawerEffect with _$HomeDrawerEffect {
  const factory HomeDrawerEffect.showPermissionsGrantedInfo() =
      HomeDrawerShowPermissionsGrantedInfoEffect;

  const factory HomeDrawerEffect.showPermissionsDeniedSettings() =
      HomeDrawerShowPermissionsDeniedSettingsEffect;

  const factory HomeDrawerEffect.showAdapterEnabledInfo() = HomeDrawerShowAdapterEnabledInfoEffect;

  const factory HomeDrawerEffect.showAdapterDisabledInfo() =
      HomeDrawerShowAdapterDisabledInfoEffect;

  const factory HomeDrawerEffect.showDisconnectConfirmation() =
      HomeDrawerShowDisconnectConfirmationEffect;

  const factory HomeDrawerEffect.editProfileRequested() = HomeDrawerEditProfileRequestedEffect;
}
