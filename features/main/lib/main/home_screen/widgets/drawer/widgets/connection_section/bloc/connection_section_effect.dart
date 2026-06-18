part of 'connection_section_bloc.dart';

@freezed
sealed class ConnectionSectionEffect with _$ConnectionSectionEffect {
  const factory ConnectionSectionEffect.showPermissionsGrantedInfo() =
      ConnectionSectionShowPermissionsGrantedInfoEffect;

  const factory ConnectionSectionEffect.showPermissionsDeniedSettings() =
      ConnectionSectionShowPermissionsDeniedSettingsEffect;

  const factory ConnectionSectionEffect.showAdapterEnabledInfo() =
      ConnectionSectionShowAdapterEnabledInfoEffect;

  const factory ConnectionSectionEffect.showAdapterDisabledInfo() =
      ConnectionSectionShowAdapterDisabledInfoEffect;

  const factory ConnectionSectionEffect.showDisconnectConfirmation() =
      ConnectionSectionShowDisconnectConfirmationEffect;
}
