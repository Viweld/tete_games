part of 'connection_section_bloc.dart';

@freezed
sealed class ConnectionSectionEvent with _$ConnectionSectionEvent {
  const factory ConnectionSectionEvent.init() = ConnectionSectionInit;

  const factory ConnectionSectionEvent.appResumed() = ConnectionSectionAppResumed;

  const factory ConnectionSectionEvent.connectionStateChanged({required bool isConnected}) =
      ConnectionSectionConnectionStateChanged;

  const factory ConnectionSectionEvent.snapshotChanged({
    required bool arePermissionsGranted,
    required bool isAdapterEnabled,
  }) = ConnectionSectionSnapshotChanged;

  const factory ConnectionSectionEvent.permissionIconTapped() =
      ConnectionSectionPermissionIconTapped;

  const factory ConnectionSectionEvent.adapterIconTapped() = ConnectionSectionAdapterIconTapped;

  const factory ConnectionSectionEvent.disconnectTapped() = ConnectionSectionDisconnectTapped;

  const factory ConnectionSectionEvent.openAppSettingsRequested() =
      ConnectionSectionOpenAppSettingsRequested;

  const factory ConnectionSectionEvent.effectHandled() = ConnectionSectionEffectHandled;
}
