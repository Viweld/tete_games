import 'dart:developer' as developer;

import 'package:ble_peer_session/ble_peer_session.dart';
import 'package:core/core.dart';
import 'package:infrastructure/src/peer/ble_peer_logger.dart';

/// Owns the [Peer] instance and recreates it after [reset] to fully release BLE links.
@lazySingleton
final class PeerLifecycle {
  PeerLifecycle(this._appConfig, this._logger);

  static const Duration _stackSettleDelay = Duration(milliseconds: 600);

  final AppConfig _appConfig;
  final BlePeerLogger _logger;

  Peer? _peer;
  final StreamController<Peer> _peerController = StreamController<Peer>.broadcast();

  /// Active peer for an in-flight BLE session. Created lazily on first role start.
  Future<Peer> requirePeer() async {
    final Peer? existingPeer = _peer;
    if (existingPeer != null) return existingPeer;

    final Peer createdPeer = _createPeer();
    _peer = createdPeer;
    _peerController.add(createdPeer);
    return createdPeer;
  }

  /// Re-emits whenever a fresh [Peer] is created for stream re-binding.
  Stream<Peer> get peerGenerations => _peerController.stream;

  Future<void> reset() async {
    final Peer? activePeer = _peer;
    _peer = null;
    if (activePeer == null) return;

    try {
      await activePeer.dispose();
    } on Object catch (error, stackTrace) {
      developer.log(
        'peer.dispose failed during reset',
        name: 'peer.session',
        error: error,
        stackTrace: stackTrace,
      );
    }

    await Future<void>.delayed(_stackSettleDelay);
  }

  Peer _createPeer() {
    return Peer.create(
      config: BlePeerConfig(
        appName: _appConfig.bleAppName,
        serviceUuid: _appConfig.bleServiceUuid,
        characteristicUuid: _appConfig.bleCharacteristicUuid,
      ),
      logger: _logger,
    );
  }
}
