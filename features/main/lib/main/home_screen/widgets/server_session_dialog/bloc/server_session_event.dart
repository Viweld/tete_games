part of 'server_session_bloc.dart';

@freezed
sealed class ServerSessionEvent with _$ServerSessionEvent {
  const factory ServerSessionEvent.init() = ServerSessionInit;

  const factory ServerSessionEvent.invitationReceived({required PeerEndpoint remoteEndpoint}) =
      ServerSessionInvitationReceived;

  const factory ServerSessionEvent.acceptTapped() = ServerSessionAcceptTapped;

  const factory ServerSessionEvent.rejectTapped() = ServerSessionRejectTapped;

  const factory ServerSessionEvent.effectHandled() = ServerSessionEffectHandled;
}
