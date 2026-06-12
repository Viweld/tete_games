import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:data/src/peer/mappers/peer_device_mapper.dart';
import 'package:data/src/peer/mappers/peer_endpoint_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPeerClientSessionRepository)
final class BlePeerClientSessionRepository implements IPeerClientSessionRepository {
  BlePeerClientSessionRepository(
    this._transportFacade,
    this._clientSession,
    this._playerProfileRepository,
    this._localDeviceRepository,
  );

  final pckg.TransportFacade _transportFacade;
  final pckg.TransportSessionClient _clientSession;
  final IPlayerProfileRepository _playerProfileRepository;
  final ILocalDeviceRepository _localDeviceRepository;

  @override
  Stream<List<PeerDevice>> get discoveredDevices => _clientSession.discoveredDevicesStream.map(
    (List<pckg.Device> devices) => devices.map(PeerDeviceMapper.toDomain).toList(growable: false),
  );

  @override
  Future<void> startDiscovery() async {
    final PeerEndpoint localEndpoint = await _buildLocalEndpoint();
    await _transportFacade.startClientTransportSession();
    await _clientSession.startDiscovery(localPeer: PeerEndpointMapper.toPackage(localEndpoint));
  }

  @override
  Future<void> stopDiscovery() => _clientSession.stopDiscovery();

  @override
  Future<void> refreshDiscovery() => _clientSession.refreshDiscovery();

  @override
  Future<void> connectToDevice(PeerDevice device) =>
      _clientSession.connectToDevice(PeerDeviceMapper.toPackage(device));

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
