import 'package:domain/src/models/peer/peer_models.dart';

abstract interface class PeerClientSessionRepository {
  Stream<List<PeerDevice>> get discoveredDevices;

  Future<void> startDiscovery();

  Future<void> stopDiscovery();

  Future<void> refreshDiscovery();

  Future<void> connectToDevice(PeerDevice device);

  Future<void> disconnectSession();

  /// Disconnects the client role and drops the cached session so the next start
  /// re-initializes BLE transport (required before switching to host).
  Future<void> releaseSession();
}
