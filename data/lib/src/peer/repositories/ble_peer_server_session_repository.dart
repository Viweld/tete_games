import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:data/src/peer/mappers/peer_endpoint_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPeerServerSessionRepository)
final class BlePeerServerSessionRepository implements IPeerServerSessionRepository {
  BlePeerServerSessionRepository(
    this._transportFacade,
    this._serverSession,
    this._playerProfileRepository,
    this._localDeviceRepository,
  );

  final pckg.TransportFacade _transportFacade;
  final pckg.TransportSessionServer _serverSession;
  final IPlayerProfileRepository _playerProfileRepository;
  final ILocalDeviceRepository _localDeviceRepository;

  @override
  Future<void> startAdvertising() async {
    final PeerEndpoint localEndpoint = await _buildLocalEndpoint();
    await _transportFacade.startServerTransportSession();
    await _serverSession.startAdvertising(localPeer: PeerEndpointMapper.toPackage(localEndpoint));
  }

  @override
  Future<void> acceptInvitation() => _serverSession.acceptInvitation();

  @override
  Future<void> rejectInvitation() => _serverSession.rejectInvitation();

  @override
  Future<void> stopAdvertising() => _serverSession.stopAdvertising();

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
