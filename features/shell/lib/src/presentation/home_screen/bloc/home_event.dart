part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.init() = _Init;
  const factory HomeEvent.profileChanged({required PlayerProfile? profile}) = _ProfileChanged;
  const factory HomeEvent.frameReceived(AppConnectionFrame frame) = _FrameReceived;
  const factory HomeEvent.connectMenuTapped() = _ConnectMenuTapped;
  const factory HomeEvent.hostTapped() = _HostTapped;
  const factory HomeEvent.clientTapped() = _ClientTapped;
  const factory HomeEvent.disconnectMenuTapped() = _DisconnectMenuTapped;
  const factory HomeEvent.profileMenuTapped() = _ProfileMenuTapped;
  const factory HomeEvent.deviceHighlightChanged(String? deviceId) = _DeviceHighlightChanged;
  const factory HomeEvent.inviteDeviceTapped() = _InviteDeviceTapped;
  const factory HomeEvent.acceptInvitationTapped() = _AcceptInvitationTapped;
  const factory HomeEvent.rejectInvitationTapped() = _RejectInvitationTapped;
  const factory HomeEvent.overlayOpened() = _OverlayOpened;
  const factory HomeEvent.overlayClosed() = _OverlayClosed;
  const factory HomeEvent.overlayDismissTapped() = _OverlayDismissTapped;
  const factory HomeEvent.overlayRoleNicknameConfirmed() = _OverlayRoleNicknameConfirmed;
  const factory HomeEvent.overlayRoleNicknameCancelled() = _OverlayRoleNicknameCancelled;
  const factory HomeEvent.effectHandled() = _EffectHandled;
}
