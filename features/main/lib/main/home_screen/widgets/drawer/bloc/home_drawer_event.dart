part of 'home_drawer_bloc.dart';

@freezed
sealed class HomeDrawerEvent with _$HomeDrawerEvent {
  const factory HomeDrawerEvent.init() = HomeDrawerInit;

  const factory HomeDrawerEvent.appResumed() = HomeDrawerAppResumed;

  const factory HomeDrawerEvent.profileChanged({required PlayerProfile? profile}) =
      HomeDrawerProfileChanged;

  const factory HomeDrawerEvent.connectionStateChanged({required bool isConnected}) =
      HomeDrawerConnectionStateChanged;

  const factory HomeDrawerEvent.snapshotChanged({
    required bool arePermissionsGranted,
    required bool isAdapterEnabled,
  }) = HomeDrawerSnapshotChanged;

  const factory HomeDrawerEvent.permissionIconTapped() = HomeDrawerPermissionIconTapped;

  const factory HomeDrawerEvent.adapterIconTapped() = HomeDrawerAdapterIconTapped;

  const factory HomeDrawerEvent.editProfileTapped() = HomeDrawerEditProfileTapped;

  const factory HomeDrawerEvent.disconnectTapped() = HomeDrawerDisconnectTapped;

  const factory HomeDrawerEvent.openAppSettingsRequested() = HomeDrawerOpenAppSettingsRequested;

  const factory HomeDrawerEvent.effectHandled() = HomeDrawerEffectHandled;
}
