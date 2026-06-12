part of 'client_session_bloc.dart';

@freezed
sealed class ClientSessionEvent with _$ClientSessionEvent {
  const factory ClientSessionEvent.init() = ClientSessionInit;

  const factory ClientSessionEvent.devicesUpdated({required List<PeerDevice> devices}) =
      ClientSessionDevicesUpdated;

  const factory ClientSessionEvent.deviceSelected({required PeerDevice device}) =
      ClientSessionDeviceSelected;

  const factory ClientSessionEvent.connectTapped() = ClientSessionConnectTapped;

  const factory ClientSessionEvent.invitationAccepted() = ClientSessionInvitationAccepted;

  const factory ClientSessionEvent.invitationRejected() = ClientSessionInvitationRejected;

  const factory ClientSessionEvent.effectHandled() = ClientSessionEffectHandled;
}
