import 'package:domain/src/models/peer/peer_models.dart';

abstract interface class IPeerTransportRepository {
  Stream<PeerConnectionState> get connectionState;

  Stream<PeerSessionMessage> get sessionMessages;

  Future<void> dispose();
}

abstract interface class IPeerServerSessionRepository {
  Future<void> startAdvertising();

  Future<void> acceptInvitation();

  Future<void> rejectInvitation();

  Future<void> stopAdvertising();
}

abstract interface class IPeerClientSessionRepository {
  Stream<List<PeerDevice>> get discoveredDevices;

  Future<void> startDiscovery();

  Future<void> stopDiscovery();

  Future<void> refreshDiscovery();

  Future<void> connectToDevice(PeerDevice device);
}

abstract interface class IPlayerProfileRepository {
  Future<PlayerProfile?> getCurrentPlayer();

  Future<void> savePlayer(PlayerProfile player);

  Future<bool> isFirstLaunch();

  Future<void> setFirstLaunchCompleted();
}

abstract interface class ILocalDeviceRepository {
  Future<PeerDevice> getLocalDevice();
}
