import 'package:peer/src/domain/models/peer/connection/peer_disconnect_reason.dart';
import 'package:peer/src/domain/models/peer/peer_models.dart';

abstract interface class PeerTransportRepository {
  Stream<PeerConnectionState> get connectionState;

  Stream<PeerSessionMessage> get sessionMessages;

  Stream<PeerDisconnectReason> get disconnectReasons;

  Future<void> dispose();

  /// Disposes the BLE peer stack and recreates client/server links.
  Future<void> resetPeerStack();
}
