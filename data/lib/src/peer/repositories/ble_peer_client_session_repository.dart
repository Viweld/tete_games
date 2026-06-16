import 'dart:developer' as developer;

import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:data/src/peer/mappers/peer_device_mapper.dart';
import 'package:data/src/peer/mappers/peer_endpoint_mapper.dart';
import 'package:data/src/peer/peer_lifecycle.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPeerClientSessionRepository)
final class BlePeerClientSessionRepository implements IPeerClientSessionRepository {
  BlePeerClientSessionRepository(
    this._peerLifecycle,
    this._playerProfileRepository,
    this._localDeviceRepository,
  );

  final PeerLifecycle _peerLifecycle;
  final IPlayerProfileRepository _playerProfileRepository;
  final ILocalDeviceRepository _localDeviceRepository;

  pckg.PeerClient? _client;

  Future<pckg.PeerClient> _clientSession() async {
    return _client ??= await (await _peerLifecycle.requirePeer()).createClient();
  }

  @override
  Stream<List<PeerDevice>> get discoveredDevices {
    final pckg.PeerClient? client = _client;
    if (client == null) {
      throw StateError('startDiscovery must be called before listening to discoveredDevices');
    }

    return client.discoveredDevicesStream.map(
      (List<pckg.Device> devices) => devices.map(PeerDeviceMapper.toDomain).toList(growable: false),
    );
  }

  @override
  Future<void> startDiscovery() async {
    final PeerEndpoint localEndpoint = await _buildLocalEndpoint();
    final pckg.PeerClient client = await _clientSession();
    await client.startDiscoveryWithEndpoint(localPeer: PeerEndpointMapper.toPackage(localEndpoint));
  }

  @override
  Future<void> stopDiscovery() async {
    final pckg.PeerClient? client = _client;
    if (client == null) return;
    await client.stopDiscovery();
  }

  @override
  Future<void> refreshDiscovery() async {
    final pckg.PeerClient client = await _clientSession();
    await client.refreshDiscovery();
  }

  @override
  Future<void> connectToDevice(PeerDevice device) async {
    final pckg.PeerClient client = await _clientSession();
    await client.connect(PeerDeviceMapper.toPackage(device));
  }

  @override
  Future<void> disconnectSession() async {
    await releaseSession();
  }

  @override
  Future<void> releaseSession() async {
    final pckg.PeerClient? client = _client;
    _client = null;
    if (client == null) return;

    try {
      await client.stopDiscovery();
    } on Object catch (error, stackTrace) {
      developer.log(
        'client.stopDiscovery failed during release',
        name: 'peer.session',
        error: error,
        stackTrace: stackTrace,
      );
    }

    try {
      await client.disconnect();
    } on Object catch (error, stackTrace) {
      developer.log(
        'client.disconnect failed during release',
        name: 'peer.session',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<PeerEndpoint> _buildLocalEndpoint() async {
    final PlayerProfile? profile = await _playerProfileRepository.getCurrentPlayer();
    if (profile == null) {
      throw StateError('Player profile is required before starting a peer session');
    }

    final PeerDevice device = await _localDeviceRepository.getLocalDevice();

    return PeerEndpoint(
      identity: PeerIdentity(id: profile.id, displayName: profile.displayName),
      device: device,
    );
  }
}
