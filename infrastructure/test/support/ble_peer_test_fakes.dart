import 'dart:async';

import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:infrastructure/src/peer/ble_peer_session_port.dart';
import 'package:infrastructure/src/peer/peer_lifecycle_port.dart';

final class FakePeerHost implements pckg.PeerHost {
  int startWithEndpointCalls = 0;
  int acceptCalls = 0;
  int rejectCalls = 0;
  int stopCalls = 0;
  int disconnectCalls = 0;
  pckg.PeerEndpoint? lastLocalPeer;

  final StreamController<pckg.PeerMessage> _messagesController =
      StreamController<pckg.PeerMessage>.broadcast();

  @override
  pckg.PeerEndpoint? get localEndpoint => lastLocalPeer;

  @override
  Stream<pckg.PeerConnectionInfo?> get connectionStream =>
      const Stream<pckg.PeerConnectionInfo?>.empty();

  @override
  Stream<pckg.PeerMessage> get messagesStream => _messagesController.stream;

  @override
  Future<void> start({required pckg.PeerUser localUser}) =>
      startWithEndpoint(localPeer: localUser.toEndpoint());

  @override
  Future<void> startWithEndpoint({required pckg.PeerEndpoint localPeer}) async {
    startWithEndpointCalls++;
    lastLocalPeer = localPeer;
  }

  @override
  Future<void> stop() async => stopCalls++;

  @override
  Future<void> accept() async => acceptCalls++;

  @override
  Future<void> reject() async => rejectCalls++;

  @override
  Future<void> send(pckg.PeerMessage message) async {}

  @override
  Future<void> disconnect() async => disconnectCalls++;

  Future<void> close() => _messagesController.close();
}

final class FakePeerClient implements pckg.PeerClient {
  int startDiscoveryWithEndpointCalls = 0;
  int refreshDiscoveryCalls = 0;
  int stopDiscoveryCalls = 0;
  int connectCalls = 0;
  int disconnectCalls = 0;
  pckg.PeerEndpoint? lastLocalPeer;
  pckg.Device? lastConnectedDevice;

  final StreamController<List<pckg.Device>> _discoveredDevicesController =
      StreamController<List<pckg.Device>>.broadcast();
  final StreamController<pckg.PeerMessage> _messagesController =
      StreamController<pckg.PeerMessage>.broadcast();

  @override
  pckg.PeerEndpoint? get localEndpoint => lastLocalPeer;

  @override
  Stream<List<pckg.PeerNearby>> get nearbyHostsStream =>
      const Stream<List<pckg.PeerNearby>>.empty();

  @override
  Stream<List<pckg.Device>> get discoveredDevicesStream => _discoveredDevicesController.stream;

  @override
  Stream<pckg.PeerConnectionInfo?> get connectionStream =>
      const Stream<pckg.PeerConnectionInfo?>.empty();

  @override
  Stream<pckg.PeerMessage> get messagesStream => _messagesController.stream;

  void emitDiscoveredDevices(List<pckg.Device> devices) =>
      _discoveredDevicesController.add(devices);

  @override
  Future<void> startDiscovery({required pckg.PeerUser localUser}) =>
      startDiscoveryWithEndpoint(localPeer: localUser.toEndpoint());

  @override
  Future<void> startDiscoveryWithEndpoint({required pckg.PeerEndpoint localPeer}) async {
    startDiscoveryWithEndpointCalls++;
    lastLocalPeer = localPeer;
  }

  @override
  Future<void> stopDiscovery() async => stopDiscoveryCalls++;

  @override
  Future<void> refreshDiscovery() async => refreshDiscoveryCalls++;

  @override
  Future<void> invite(pckg.PeerNearby host) => connect(host.device);

  @override
  Future<void> connect(pckg.Device device) async {
    connectCalls++;
    lastConnectedDevice = device;
  }

  @override
  Future<void> send(pckg.PeerMessage message) async {}

  @override
  Future<void> disconnect() async => disconnectCalls++;

  Future<void> close() async {
    await _discoveredDevicesController.close();
    await _messagesController.close();
  }
}

final class FakeBlePeerSessionPort implements BlePeerSessionPort {
  FakeBlePeerSessionPort({FakePeerHost? host, FakePeerClient? client})
    : host = host ?? FakePeerHost(),
      client = client ?? FakePeerClient();

  final FakePeerHost host;
  final FakePeerClient client;

  final StreamController<pckg.PeerConnectionInfo?> _connectionController =
      StreamController<pckg.PeerConnectionInfo?>.broadcast();
  final StreamController<pckg.PeerMessage> _messagesController =
      StreamController<pckg.PeerMessage>.broadcast();
  final StreamController<pckg.PeerDisconnectInfo> _disconnectController =
      StreamController<pckg.PeerDisconnectInfo>.broadcast();

  int disposeCalls = 0;

  @override
  Stream<pckg.PeerConnectionInfo?> get connectionStream => _connectionController.stream;

  @override
  Stream<pckg.PeerMessage> get messagesStream => _messagesController.stream;

  @override
  Stream<pckg.PeerDisconnectInfo> get disconnectStream => _disconnectController.stream;

  void emitConnection(pckg.PeerConnectionInfo? info) => _connectionController.add(info);

  void emitMessage(pckg.PeerMessage message) => _messagesController.add(message);

  void emitDisconnect(pckg.PeerDisconnectInfo info) => _disconnectController.add(info);

  @override
  Future<pckg.PeerHost> createHost() async => host;

  @override
  Future<pckg.PeerClient> createClient() async => client;

  @override
  Future<void> dispose() async => disposeCalls++;

  Future<void> close() async {
    await host.close();
    await client.close();
    await _connectionController.close();
    await _messagesController.close();
    await _disconnectController.close();
  }
}

final class FakePeerLifecyclePort implements PeerLifecyclePort {
  FakePeerLifecyclePort({FakeBlePeerSessionPort? session})
    : _session = session ?? FakeBlePeerSessionPort();

  final FakeBlePeerSessionPort _session;
  final StreamController<BlePeerSessionPort> _peerController =
      StreamController<BlePeerSessionPort>.broadcast();

  int resetCalls = 0;

  FakeBlePeerSessionPort get session => _session;

  @override
  Future<BlePeerSessionPort> requirePeer() async {
    _peerController.add(_session);
    return _session;
  }

  @override
  Stream<BlePeerSessionPort> get peerGenerations => _peerController.stream;

  @override
  Future<void> reset() async => resetCalls++;

  Future<void> close() => _peerController.close();
}

const pckg.Device packageDevice = pckg.Device(id: 'device-1', name: 'Player', isOurApp: true);

const pckg.PeerIdentity packageIdentity = pckg.PeerIdentity(id: 'peer-1', displayName: 'Remote');

const pckg.PeerEndpoint packageEndpoint = pckg.PeerEndpoint(
  identity: packageIdentity,
  device: packageDevice,
);

pckg.PeerConnectionInfo connectedPackageInfo() {
  return const pckg.PeerConnectionInfo(
    phase: pckg.PeerConnectionPhase.connected,
    localPeer: packageEndpoint,
    remotePeer: packageEndpoint,
  );
}
