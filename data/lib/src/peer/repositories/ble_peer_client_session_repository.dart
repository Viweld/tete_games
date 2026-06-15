import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:data/src/peer/mappers/peer_device_mapper.dart';
import 'package:data/src/peer/mappers/peer_endpoint_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPeerClientSessionRepository)
final class BlePeerClientSessionRepository implements IPeerClientSessionRepository {
  BlePeerClientSessionRepository(
    this._peer,
    this._playerProfileRepository,
    this._localDeviceRepository,
  );

  final pckg.Peer _peer;
  final IPlayerProfileRepository _playerProfileRepository;
  final ILocalDeviceRepository _localDeviceRepository;

  pckg.PeerClient? _client;

  Future<pckg.PeerClient> _clientSession() async {
    return _client ??= await _peer.createClient();
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
    final pckg.PeerClient? client = _client;
    if (client == null) return;
    await client.disconnect();
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
