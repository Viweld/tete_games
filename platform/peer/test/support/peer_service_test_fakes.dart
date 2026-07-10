import 'dart:async';

import 'package:peer/peer_connection.dart';

final class FakePeerBleSessionGuard implements PeerBleSessionGuard {
  int activateCalls = 0;
  int deactivateCalls = 0;

  @override
  Future<void> activate() async => activateCalls++;

  @override
  Future<void> deactivate() async => deactivateCalls++;
}

final class FakePeerPlayerIdentitySource implements PeerPlayerIdentitySource {
  PeerPlayerIdentity? identity;

  @override
  Future<PeerPlayerIdentity?> getCurrentIdentity() async => identity;
}

final class FakePeerServerSessionRepository implements PeerServerSessionRepository {
  int startAdvertisingCalls = 0;
  int acceptInvitationCalls = 0;
  int rejectInvitationCalls = 0;
  int releaseSessionCalls = 0;
  bool shouldFailStartAdvertising = false;
  bool shouldFailAcceptInvitation = false;

  @override
  Future<void> startAdvertising() async {
    if (shouldFailStartAdvertising) {
      throw StateError('bluetooth unavailable');
    }
    startAdvertisingCalls++;
  }

  @override
  Future<void> acceptInvitation() async {
    if (shouldFailAcceptInvitation) {
      throw StateError('accept failed');
    }
    acceptInvitationCalls++;
  }

  @override
  Future<void> rejectInvitation() async => rejectInvitationCalls++;

  @override
  Future<void> stopAdvertising() async {}

  @override
  Future<void> disconnectSession() async {}

  @override
  Future<void> releaseSession() async => releaseSessionCalls++;
}

final class FakePeerClientSessionRepository implements PeerClientSessionRepository {
  final StreamController<List<PeerDevice>> _discoveredDevicesController =
      StreamController<List<PeerDevice>>.broadcast();

  int startDiscoveryCalls = 0;
  int refreshDiscoveryCalls = 0;
  int connectToDeviceCalls = 0;
  int releaseSessionCalls = 0;
  PeerDevice? lastConnectedDevice;
  bool shouldFailConnect = false;
  bool shouldFailStartDiscovery = false;
  int connectFailuresBeforeSuccess = 0;

  @override
  Stream<List<PeerDevice>> get discoveredDevices => _discoveredDevicesController.stream;

  void emitDiscoveredDevices(List<PeerDevice> devices) => _discoveredDevicesController.add(devices);

  @override
  Future<void> startDiscovery() async {
    if (shouldFailStartDiscovery) {
      throw StateError('discovery failed');
    }
    startDiscoveryCalls++;
  }

  @override
  Future<void> stopDiscovery() async {}

  @override
  Future<void> refreshDiscovery() async => refreshDiscoveryCalls++;

  @override
  Future<void> connectToDevice(PeerDevice device) async {
    connectToDeviceCalls++;
    lastConnectedDevice = device;
    if (shouldFailConnect) {
      throw StateError('connect failed');
    }
    if (connectFailuresBeforeSuccess > 0) {
      connectFailuresBeforeSuccess--;
      throw StateError('connect failed');
    }
  }

  @override
  Future<void> disconnectSession() async {}

  @override
  Future<void> releaseSession() async => releaseSessionCalls++;

  Future<void> dispose() => _discoveredDevicesController.close();
}

final class FakePeerTransportRepository implements PeerTransportRepository {
  final StreamController<PeerConnectionState> _connectionStateController =
      StreamController<PeerConnectionState>.broadcast();
  final StreamController<PeerSessionMessage> _sessionMessagesController =
      StreamController<PeerSessionMessage>.broadcast();
  final StreamController<PeerDisconnectReason> _disconnectReasonsController =
      StreamController<PeerDisconnectReason>.broadcast();

  int resetPeerStackCalls = 0;
  int disposeCalls = 0;

  @override
  Stream<PeerConnectionState> get connectionState => _connectionStateController.stream;

  @override
  Stream<PeerSessionMessage> get sessionMessages => _sessionMessagesController.stream;

  @override
  Stream<PeerDisconnectReason> get disconnectReasons => _disconnectReasonsController.stream;

  void emitConnectionState(PeerConnectionState state) => _connectionStateController.add(state);

  void emitSessionMessage(PeerSessionMessage message) => _sessionMessagesController.add(message);

  void emitDisconnectReason(PeerDisconnectReason reason) =>
      _disconnectReasonsController.add(reason);

  @override
  Future<void> dispose() async => disposeCalls++;

  @override
  Future<void> resetPeerStack() async => resetPeerStackCalls++;

  Future<void> close() async {
    await _connectionStateController.close();
    await _sessionMessagesController.close();
    await _disconnectReasonsController.close();
  }
}
