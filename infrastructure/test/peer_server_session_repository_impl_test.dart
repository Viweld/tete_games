import 'dart:async';

import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/src/peer/repositories/peer_client_session_repository_impl.dart';
import 'package:infrastructure/src/peer/repositories/peer_server_session_repository_impl.dart';
import 'package:peer/peer_connection.dart';

import 'support/ble_peer_test_fakes.dart';
import 'support/infrastructure_test_fakes.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const PeerPlayerIdentity playerIdentity = PeerPlayerIdentity(id: 'player-1', displayName: 'Neo');
  const PeerDevice localDevice = PeerDevice(id: 'device-1', name: 'Local', isOurApp: true);

  group('PeerServerSessionRepositoryImpl', () {
    late FakePeerLifecyclePort peerLifecycle;
    late FakePeerPlayerIdentitySource identitySource;
    late FakeLocalDeviceRepository localDeviceRepository;
    late PeerServerSessionRepositoryImpl repository;

    setUp(() {
      peerLifecycle = FakePeerLifecyclePort();
      identitySource = FakePeerPlayerIdentitySource(identity: playerIdentity);
      localDeviceRepository = FakeLocalDeviceRepository(device: localDevice);
      repository = PeerServerSessionRepositoryImpl(
        peerLifecycle,
        identitySource,
        localDeviceRepository,
      );
    });

    tearDown(() async {
      await repository.releaseSession();
      await peerLifecycle.session.close();
      await peerLifecycle.close();
    });

    test('startAdvertising throws when player profile is missing', () async {
      identitySource.identity = null;

      await expectLater(repository.startAdvertising(), throwsA(isA<StateError>()));
    });

    test('startAdvertising starts host with mapped local endpoint', () async {
      await repository.startAdvertising();

      expect(peerLifecycle.session.host.startWithEndpointCalls, 1);
      expect(peerLifecycle.session.host.lastLocalPeer?.identity.id, playerIdentity.id);
      expect(peerLifecycle.session.host.lastLocalPeer?.device.id, localDevice.id);
    });

    test('acceptInvitation and rejectInvitation delegate to host session', () async {
      await repository.startAdvertising();

      await repository.acceptInvitation();
      await repository.rejectInvitation();

      expect(peerLifecycle.session.host.acceptCalls, 1);
      expect(peerLifecycle.session.host.rejectCalls, 1);
    });

    test('releaseSession stops and disconnects active host', () async {
      await repository.startAdvertising();
      await repository.releaseSession();

      expect(peerLifecycle.session.host.stopCalls, 1);
      expect(peerLifecycle.session.host.disconnectCalls, 1);
    });

    test('releaseSession is a no-op before host session starts', () async {
      await expectLater(repository.releaseSession(), completes);
    });
  });

  group('PeerClientSessionRepositoryImpl', () {
    late FakePeerLifecyclePort peerLifecycle;
    late FakePeerPlayerIdentitySource identitySource;
    late FakeLocalDeviceRepository localDeviceRepository;
    late PeerClientSessionRepositoryImpl repository;

    setUp(() {
      peerLifecycle = FakePeerLifecyclePort();
      identitySource = FakePeerPlayerIdentitySource(identity: playerIdentity);
      localDeviceRepository = FakeLocalDeviceRepository(device: localDevice);
      repository = PeerClientSessionRepositoryImpl(
        peerLifecycle,
        identitySource,
        localDeviceRepository,
      );
    });

    tearDown(() async {
      await repository.releaseSession();
      await peerLifecycle.session.close();
      await peerLifecycle.close();
    });

    test('startDiscovery throws when player profile is missing', () async {
      identitySource.identity = null;

      await expectLater(repository.startDiscovery(), throwsA(isA<StateError>()));
    });

    test('startDiscovery starts client discovery with mapped local endpoint', () async {
      await repository.startDiscovery();

      expect(peerLifecycle.session.client.startDiscoveryWithEndpointCalls, 1);
      expect(
        peerLifecycle.session.client.lastLocalPeer?.identity.displayName,
        playerIdentity.displayName,
      );
    });

    test('discoveredDevices maps package devices to domain models', () async {
      await repository.startDiscovery();

      final List<List<PeerDevice>> devices = <List<PeerDevice>>[];
      final StreamSubscription<List<PeerDevice>> subscription = repository.discoveredDevices.listen(
        devices.add,
      );

      peerLifecycle.session.client.emitDiscoveredDevices(<pckg.Device>[packageDevice]);
      await Future<void>.delayed(Duration.zero);

      expect(devices.last.single.id, packageDevice.id);
      expect(devices.last.single.name, packageDevice.name);

      await subscription.cancel();
    });

    test('connectToDevice delegates to client session', () async {
      await repository.startDiscovery();

      const PeerDevice target = PeerDevice(id: 'device-1', name: 'Player', isOurApp: true);
      await repository.connectToDevice(target);

      expect(peerLifecycle.session.client.connectCalls, 1);
      expect(peerLifecycle.session.client.lastConnectedDevice?.id, target.id);
    });

    test('refreshDiscovery delegates to client session', () async {
      await repository.startDiscovery();
      await repository.refreshDiscovery();

      expect(peerLifecycle.session.client.refreshDiscoveryCalls, 1);
    });

    test('releaseSession stops discovery and disconnects active client', () async {
      await repository.startDiscovery();
      await repository.releaseSession();

      expect(peerLifecycle.session.client.stopDiscoveryCalls, 1);
      expect(peerLifecycle.session.client.disconnectCalls, 1);
    });

    test('discoveredDevices throws before discovery starts', () {
      expect(() => repository.discoveredDevices, throwsA(isA<StateError>()));
    });
  });
}
