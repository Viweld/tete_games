part of 'server_session_bloc.dart';

enum ServerSessionPhase { invitationPending, userDecision, error }

enum ServerSessionErrorKind { bluetoothUnavailable, unknown }

@freezed
abstract class ServerSessionState with _$ServerSessionState {
  const factory ServerSessionState({
    required ServerSessionPhase phase,
    PeerEndpoint? remoteEndpoint,
    ServerSessionErrorKind? errorKind,
    ServerSessionEffect? effect,
  }) = _ServerSessionState;
}
