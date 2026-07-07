import 'dart:developer' as developer;

import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:infrastructure/src/peer/mappers/peer_endpoint_mapper.dart';
import 'package:infrastructure/src/peer/peer_lifecycle.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:peer/peer_connection.dart';

@LazySingleton(as: PeerServerSessionRepository)
final class PeerServerSessionRepositoryImpl implements PeerServerSessionRepository {
  PeerServerSessionRepositoryImpl(
    this._peerLifecycle,
    this._profileRepository,
    this._localDeviceRepository,
  );

  final PeerLifecycle _peerLifecycle;
  final ProfileRepository _profileRepository;
  final LocalDeviceRepository _localDeviceRepository;

  pckg.PeerHost? _host;

  Future<pckg.PeerHost> _hostSession() async {
    return _host ??= await (await _peerLifecycle.requirePeer()).createHost();
  }

  @override
  Future<void> startAdvertising() async {
    final PeerEndpoint localEndpoint = await _buildLocalEndpoint();
    final pckg.PeerHost host = await _hostSession();
    await host.startWithEndpoint(localPeer: PeerEndpointMapper.toPackage(localEndpoint));
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

  @override
  Future<void> disconnectSession() async {
    await releaseSession();
  }

  @override
  Future<void> releaseSession() async {
    final pckg.PeerHost? host = _host;
    _host = null;
    if (host == null) return;

    try {
      await host.stop();
    } on Object catch (error, stackTrace) {
      developer.log(
        'host.stop failed during release',
        name: 'peer.session',
        error: error,
        stackTrace: stackTrace,
      );
    }

    try {
      await host.disconnect();
    } on Object catch (error, stackTrace) {
      developer.log(
        'host.disconnect failed during release',
        name: 'peer.session',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<PeerEndpoint> _buildLocalEndpoint() async {
    final PlayerProfile? profile = await _profileRepository.getCurrentPlayer();
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
