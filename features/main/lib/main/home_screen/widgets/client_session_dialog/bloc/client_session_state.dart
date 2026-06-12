part of 'client_session_bloc.dart';

enum ClientSessionPhase {
  initializing,
  browsing,
  remoteConfirmationPending,
  invitationRejected,
  error,
}

enum ClientSessionErrorKind { discoveryFailed, connectionFailed }

@freezed
abstract class ClientSessionState with _$ClientSessionState {
  const factory ClientSessionState({
    required ClientSessionPhase phase,
    @Default(<PeerDevice>[]) List<PeerDevice> devices,
    PeerDevice? selectedDevice,
    ClientSessionErrorKind? errorKind,
    ClientSessionEffect? effect,
  }) = _ClientSessionState;
}
