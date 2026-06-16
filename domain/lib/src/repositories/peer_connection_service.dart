import 'package:domain/src/models/peer/connection/connection_models.dart';

abstract interface class PeerConnectionService {
  Stream<AppConnectionFrame> get frames;

  Future<void> openRoleSelection({required FrameProjectionInput projection});

  Future<void> startHostSession({required FrameProjectionInput projection});

  Future<void> startClientSession({required FrameProjectionInput projection});

  Future<void> acceptInvitation({required FrameProjectionInput projection});

  Future<void> rejectInvitation({required FrameProjectionInput projection});

  Future<void> inviteDevice({required String deviceId, required FrameProjectionInput projection});

  Future<void> closeSession({
    required PeerSessionCloseOrigin origin,
    required PeerSessionCloseReason reason,
    required FrameProjectionInput projection,
  });

  Future<void> dispose();
}
