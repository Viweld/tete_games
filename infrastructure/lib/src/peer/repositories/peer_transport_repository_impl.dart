import 'package:ble_peer_session/ble_peer_session.dart'
    show PeerDisconnectInfo, PeerMessage, PeerMessageTypes;
import 'package:infrastructure/src/peer/ble_peer_session_port.dart';
import 'package:infrastructure/src/peer/mappers/peer_connection_state_mapper.dart';
import 'package:infrastructure/src/peer/mappers/peer_disconnect_reason_mapper.dart';
import 'package:infrastructure/src/peer/mappers/peer_session_message_mapper.dart';
import 'package:infrastructure/src/peer/peer_lifecycle_port.dart';
import 'package:injectable/injectable.dart';
import 'package:peer/peer_connection.dart';

@LazySingleton(as: PeerTransportRepository)
final class PeerTransportRepositoryImpl implements PeerTransportRepository {
  PeerTransportRepositoryImpl(this._peerLifecycle);

  final PeerLifecyclePort _peerLifecycle;

  @override
  Stream<PeerConnectionState> get connectionState => _peerLifecycle.peerGenerations.asyncExpand(
    (BlePeerSessionPort peer) => peer.connectionStream.map(PeerConnectionStateMapper.toDomain),
  );

  @override
  Stream<PeerSessionMessage> get sessionMessages => _peerLifecycle.peerGenerations.asyncExpand(
    (BlePeerSessionPort peer) => peer.messagesStream
        .where((PeerMessage message) => PeerMessageTypes.isSessionType(message.type))
        .map(PeerSessionMessageMapper.toDomain),
  );

  @override
  Stream<PeerDisconnectReason> get disconnectReasons => _peerLifecycle.peerGenerations.asyncExpand(
    (BlePeerSessionPort peer) => peer.disconnectStream.map((PeerDisconnectInfo info) {
      return PeerDisconnectReasonMapper.toDomain(info.reason);
    }),
  );

  @override
  Future<void> dispose() => resetPeerStack();

  @override
  Future<void> resetPeerStack() => _peerLifecycle.reset();
}
