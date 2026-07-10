import 'package:infrastructure/src/peer/ble_peer_session_port.dart';

/// Owns the active BLE peer session and recreates it after [reset].
abstract interface class PeerLifecyclePort {
  Future<BlePeerSessionPort> requirePeer();

  Stream<BlePeerSessionPort> get peerGenerations;

  Future<void> reset();
}
