import 'package:peer/src/domain/models/peer/connection/connection_models.dart';

abstract interface class PeerConnectionService {
  Stream<AppConnectionFrame> get frames;

  Future<void> openRoleSelection();

  Future<void> startHostSession();

  Future<void> startClientSession();

  Future<void> acceptInvitation();

  Future<void> rejectInvitation();

  Future<void> inviteDevice({required String deviceId});

  Future<void> closeSession({
    required PeerSessionCloseOrigin origin,
    required PeerSessionCloseReason reason,
  });

  Future<void> dispose();
}
