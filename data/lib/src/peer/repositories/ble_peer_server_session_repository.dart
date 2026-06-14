import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:data/src/peer/mappers/peer_endpoint_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPeerServerSessionRepository)
final class BlePeerServerSessionRepository implements IPeerServerSessionRepository {
  BlePeerServerSessionRepository(
    this._peer,
    this._playerProfileRepository,
    this._localDeviceRepository,
  );

  final pckg.Peer _peer;
  final IPlayerProfileRepository _playerProfileRepository;
  final ILocalDeviceRepository _localDeviceRepository;

  pckg.PeerHost? _host;

  Future<pckg.PeerHost> _hostSession() async {
    return _host ??= await _peer.createHost();
  }

  @override
  Future<void> startAdvertising() async {
    final PeerEndpoint localEndpoint = await _buildLocalEndpoint();
    final pckg.PeerHost host = await _hostSession();
    await host.start(localPeer: PeerEndpointMapper.toPackage(localEndpoint));
  }

  @override
  Future<void> acceptInvitation() async {
    final pckg.PeerHost host = await _hostSession();
    await host.accept();
  }

  @override
  Future<void> rejectInvitation() async {
    final pckg.PeerHost host = await _hostSession();
    await host.reject();
  }

  @override
  Future<void> stopAdvertising() async {
    final pckg.PeerHost? host = _host;
    if (host == null) return;
    await host.stop();
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
