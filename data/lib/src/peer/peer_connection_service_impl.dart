import 'dart:async';
import 'dart:developer' as developer;

import 'package:data/src/peer/peer_discovery_device_registry.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PeerConnectionService)
final class PeerConnectionServiceImpl implements PeerConnectionService {
  PeerConnectionServiceImpl(
    this._serverSessionRepository,
    this._clientSessionRepository,
    this._transportRepository,
    this._playerProfileRepository,
  ) {
    _emitInitialFrame();
    _connectionSubscription = _transportRepository.connectionState.listen(_onConnectionState);
    _messagesSubscription = _transportRepository.sessionMessages.listen(_onSessionMessage);
    _disconnectSubscription = _transportRepository.disconnectReasons.listen(_onTransportDisconnect);
  }

  final IPeerServerSessionRepository _serverSessionRepository;
  final IPeerClientSessionRepository _clientSessionRepository;
  final IPeerTransportRepository _transportRepository;
  final IPlayerProfileRepository _playerProfileRepository;

  final StreamController<AppConnectionFrame> _framesController =
      StreamController<AppConnectionFrame>.broadcast();

  final PeerDiscoveryDeviceRegistry _discoveryRegistry = const PeerDiscoveryDeviceRegistry();
  final Map<String, PeerDevice> _discoveredDevicesStore = <String, PeerDevice>{};

  PeerSessionSnapshot _snapshot = const PeerSessionSnapshot();
  int _frameId = 0;
  int _eventSequence = 0;
  int _sessionCounter = 0;

  Future<void> _queue = Future<void>.value();
  late final StreamSubscription<PeerConnectionState> _connectionSubscription;
  late final StreamSubscription<PeerSessionMessage> _messagesSubscription;
  late final StreamSubscription<PeerDisconnectReason> _disconnectSubscription;
  StreamSubscription<List<PeerDevice>>? _discoverySubscription;

  @override
  Stream<AppConnectionFrame> get frames => _framesController.stream;

  @override
  Future<void> openRoleSelection({required FrameProjectionInput projection}) {
    return _enqueue(() => _dispatch(const CmdOpenRoleSelection(), projection: projection));
  }

  @override
  Future<void> startHostSession({required FrameProjectionInput projection}) {
    return _enqueue(() async {
      if (!await _hasProfile()) return;
      final String sessionId = _newSessionId();
      await _releaseClientRole();
      await _dispatch(CmdStartHostSession(sessionId: sessionId), projection: projection);
      try {
        await _serverSessionRepository.startAdvertising();
      } on Object catch (error, stackTrace) {
        developer.log(
          'startAdvertising failed',
          name: 'peer.session',
          error: error,
          stackTrace: stackTrace,
        );
        await _dispatch(
          const CmdBleError(errorKind: PeerSessionErrorKind.bluetoothUnavailable),
          projection: projection,
        );
      }
    });
  }

  @override
  Future<void> startClientSession({required FrameProjectionInput projection}) {
    return _enqueue(() async {
      if (!await _hasProfile()) return;
      final String sessionId = _newSessionId();
      await _releaseServerRole();
      _discoveryRegistry.clear(_discoveredDevicesStore);
      await _dispatch(CmdStartClientSession(sessionId: sessionId), projection: projection);
      try {
        await _clientSessionRepository.startDiscovery();
        await _startDiscoverySubscription();
      } on Object catch (error, stackTrace) {
        developer.log(
          'startDiscovery failed',
          name: 'peer.session',
          error: error,
          stackTrace: stackTrace,
        );
        await _dispatch(
          const CmdBleError(errorKind: PeerSessionErrorKind.discoveryFailed),
          projection: projection,
        );
      }
    });
  }

  @override
  Future<void> acceptInvitation({required FrameProjectionInput projection}) {
    return _enqueue(() async {
      await _dispatch(const CmdAcceptInvitation(), projection: projection);
      try {
        await _serverSessionRepository.acceptInvitation();
      } on Object catch (error, stackTrace) {
        developer.log(
          'acceptInvitation failed',
          name: 'peer.session',
          error: error,
          stackTrace: stackTrace,
        );
        await _dispatch(
          const CmdBleError(errorKind: PeerSessionErrorKind.connectionFailed),
          projection: projection,
        );
      }
    });
  }

  @override
  Future<void> rejectInvitation({required FrameProjectionInput projection}) {
    return _enqueue(() async {
      await _dispatch(const CmdRejectInvitation(), projection: projection);
      try {
        await _serverSessionRepository.rejectInvitation();
      } on Object catch (error, stackTrace) {
        developer.log(
          'rejectInvitation failed',
          name: 'peer.session',
          error: error,
          stackTrace: stackTrace,
        );
      }
    });
  }

  @override
  Future<void> inviteDevice({required String deviceId, required FrameProjectionInput projection}) {
    return _enqueue(() async {
      _validateInviteCommand(_snapshot, deviceId, projection);
      await _dispatch(CmdInviteDevice(deviceId: deviceId), projection: projection);

      PeerDevice? device;
      for (final PeerDevice candidate in _snapshot.discoveredDevices) {
        if (candidate.id == deviceId) {
          device = candidate;
          break;
        }
      }
      if (device == null) return;

      final bool connected = await _connectWithRetry(device: device);
      if (!connected) {
        await _dispatch(
          const CmdBleError(errorKind: PeerSessionErrorKind.connectionFailed),
          projection: projection,
        );
      }
    });
  }

  Future<bool> _connectWithRetry({required PeerDevice device}) async {
    const int maxAttempts = 2;
    const Duration retryDelay = Duration(milliseconds: 800);

    for (int attempt = 1; attempt <= maxAttempts; attempt++) {
      try {
        await _clientSessionRepository.connectToDevice(device);
        return true;
      } on Object catch (error, stackTrace) {
        developer.log(
          'connectToDevice failed (attempt $attempt/$maxAttempts)',
          name: 'peer.session',
          error: error,
          stackTrace: stackTrace,
        );

        await _clientSessionRepository.releaseSession();
        await _transportRepository.resetPeerStack();

        if (attempt == maxAttempts) return false;

        await Future<void>.delayed(retryDelay);
        await _restartClientDiscovery();
        await Future<void>.delayed(const Duration(milliseconds: 1200));
      }
    }

    return false;
  }

  Future<void> _restartClientDiscovery() async {
    await _clientSessionRepository.startDiscovery();
    await _startDiscoverySubscription();
  }

  @override
  Future<void> closeSession({
    required PeerSessionCloseOrigin origin,
    required PeerSessionCloseReason reason,
    required FrameProjectionInput projection,
  }) {
    return _enqueue(() async {
      final bool wasConnected = _snapshot.isConnected;

      if (wasConnected && reason == PeerSessionCloseReason.userDisconnect) {
        await _tearDownBle();
        return;
      }

      await _dispatch(
        CmdCloseSession(origin: origin, reason: reason),
        projection: projection,
      );
      if (reason != PeerSessionCloseReason.userDismissedOverlay || !wasConnected) {
        await _tearDownBle();
      }
    });
  }

  Future<void> _enqueue(Future<void> Function() action) {
    final Future<void> next = _queue.then((_) => action());
    _queue = next.catchError((Object _) {});
    return next;
  }

  Future<bool> _hasProfile() async {
    final PlayerProfile? profile = await _playerProfileRepository.getCurrentPlayer();
    return profile != null;
  }

  String _newSessionId() {
    _sessionCounter++;
    return 'session-$_sessionCounter';
  }

  void _emitInitialFrame() {
    _emitFrame(const <RawPeerUiEvent>[], projection: const FrameProjectionInput());
  }

  Future<void> _dispatch(
    PeerSessionCommand command, {
    required FrameProjectionInput projection,
  }) async {
    final ReduceResult result = reduce(prev: _snapshot, command: command);
    final PeerSessionSnapshot next = result.next;
    final bool snapshotChanged = next != _snapshot;
    final bool hasEvents = result.rawEvents.isNotEmpty;

    if (!snapshotChanged && !hasEvents) return;

    _snapshot = next;
    _emitFrame(result.rawEvents, projection: projection);
  }

  void _emitFrame(List<RawPeerUiEvent> rawEvents, {required FrameProjectionInput projection}) {
    _frameId++;
    final TieredEvents tiered = tierEvents(
      rawEvents: rawEvents,
      frameId: _frameId,
      sessionId: _snapshot.sessionId,
      eventSequenceStart: _eventSequence,
    );
    _eventSequence += countRawEvents(rawEvents);

    final AppConnectionFrame frame = AppConnectionFrame(
      frameId: _frameId,
      sessionId: _snapshot.sessionId,
      state: projectFrame(snapshot: _snapshot, projection: projection),
      criticalEvents: tiered.criticalEvents,
      softEvents: tiered.softEvents,
    );

    _framesController.add(frame);
  }

  void _onConnectionState(PeerConnectionState state) {
    if (state is PeerConnected) {
      unawaited(
        _enqueue(
          () => _dispatch(
            CmdTransportConnected(remoteEndpoint: state.remoteEndpoint),
            projection: const FrameProjectionInput(),
          ),
        ),
      );
    }
  }

  void _onTransportDisconnect(PeerDisconnectReason reason) {
    unawaited(
      _enqueue(() async {
        if (_snapshot.phase != PeerSessionCorePhase.connected) return;
        await _tearDownBle();
        await _dispatch(
          CmdTransportDisconnected(reason: reason),
          projection: const FrameProjectionInput(),
        );
      }),
    );
  }

  void _onSessionMessage(PeerSessionMessage message) {
    switch (message) {
      case PeerInvitation(:final PeerEndpoint remoteEndpoint):
        unawaited(
          _enqueue(
            () => _dispatch(
              CmdInvitationReceived(remoteEndpoint: remoteEndpoint),
              projection: const FrameProjectionInput(),
            ),
          ),
        );
      case PeerAcceptance():
        unawaited(
          _enqueue(
            () =>
                _dispatch(const CmdInvitationAccepted(), projection: const FrameProjectionInput()),
          ),
        );
      case PeerRejection():
        unawaited(
          _enqueue(
            () =>
                _dispatch(const CmdInvitationRejected(), projection: const FrameProjectionInput()),
          ),
        );
      case PeerDisconnection():
        break;
    }
  }

  Future<void> _startDiscoverySubscription() async {
    await _discoverySubscription?.cancel();
    _discoverySubscription = _clientSessionRepository.discoveredDevices.listen((
      List<PeerDevice> devices,
    ) {
      final List<PeerDevice> merged = _discoveryRegistry.merge(
        store: _discoveredDevicesStore,
        incoming: devices,
      );
      unawaited(
        _enqueue(
          () => _dispatch(
            CmdDiscoveryUpdated(devices: merged),
            projection: const FrameProjectionInput(),
          ),
        ),
      );
    });
  }

  Future<void> _releaseClientRole() async {
    await _discoverySubscription?.cancel();
    _discoverySubscription = null;
    _discoveryRegistry.clear(_discoveredDevicesStore);
    await _clientSessionRepository.releaseSession();
    await _transportRepository.resetPeerStack();
  }

  Future<void> _releaseServerRole() async {
    await _serverSessionRepository.releaseSession();
    await _transportRepository.resetPeerStack();
  }

  Future<void> _tearDownBle() async {
    await _discoverySubscription?.cancel();
    _discoverySubscription = null;
    _discoveryRegistry.clear(_discoveredDevicesStore);
    await _clientSessionRepository.releaseSession();
    await _serverSessionRepository.releaseSession();
    await _transportRepository.resetPeerStack();
  }

  void _validateInviteCommand(
    PeerSessionSnapshot snapshot,
    String deviceId,
    FrameProjectionInput projection,
  ) {
    if (!snapshot.discoveredDevices.any((PeerDevice d) => d.id == deviceId)) {
      throw StateError('Device $deviceId is not in discovered devices');
    }

    if (projection.highlightedDeviceId != null && projection.highlightedDeviceId != deviceId) {
      developer.log('projection/device mismatch', name: 'peer.session');
    }
  }

  @override
  @disposeMethod
  Future<void> dispose() async {
    await _connectionSubscription.cancel();
    await _messagesSubscription.cancel();
    await _disconnectSubscription.cancel();
    await _discoverySubscription?.cancel();
    await _transportRepository.dispose();
    await _framesController.close();
  }
}
