import 'package:domain/src/models/peer/connection/peer_disconnect_reason.dart';
import 'package:domain/src/models/peer/peer_models.dart';

abstract interface class IPeerTransportRepository {
  Stream<PeerConnectionState> get connectionState;

  Stream<PeerSessionMessage> get sessionMessages;

  Stream<PeerDisconnectReason> get disconnectReasons;

  Future<void> dispose();
}

abstract interface class IPeerServerSessionRepository {
  Future<void> startAdvertising();

  Future<void> acceptInvitation();

  Future<void> rejectInvitation();

  Future<void> stopAdvertising();

  Future<void> disconnectSession();
}

abstract interface class IPeerClientSessionRepository {
  Stream<List<PeerDevice>> get discoveredDevices;

  Future<void> startDiscovery();

  Future<void> stopDiscovery();

  Future<void> refreshDiscovery();

  Future<void> connectToDevice(PeerDevice device);

  Future<void> disconnectSession();
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
