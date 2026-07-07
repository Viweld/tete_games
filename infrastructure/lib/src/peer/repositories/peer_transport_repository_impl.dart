import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:infrastructure/src/peer/mappers/peer_connection_state_mapper.dart';
import 'package:infrastructure/src/peer/mappers/peer_disconnect_reason_mapper.dart';
import 'package:infrastructure/src/peer/mappers/peer_session_message_mapper.dart';
import 'package:infrastructure/src/peer/peer_lifecycle.dart';
import 'package:peer/peer_connection.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PeerTransportRepository)
final class PeerTransportRepositoryImpl implements PeerTransportRepository {
  PeerTransportRepositoryImpl(this._peerLifecycle);

  final PeerLifecycle _peerLifecycle;

  @override
  Stream<PeerConnectionState> get connectionState => _peerLifecycle.peerGenerations.asyncExpand(
    (pckg.Peer peer) => peer.connectionStream.map(PeerConnectionStateMapper.toDomain),
  );

  @override
  Stream<PeerSessionMessage> get sessionMessages => _peerLifecycle.peerGenerations.asyncExpand(
    (pckg.Peer peer) => peer.messagesStream
        .where((pckg.PeerMessage message) => pckg.PeerMessageTypes.isSessionType(message.type))
        .map(PeerSessionMessageMapper.toDomain),
  );

  @override
  Stream<PeerDisconnectReason> get disconnectReasons => _peerLifecycle.peerGenerations.asyncExpand(
    (pckg.Peer peer) => peer.disconnectStream.map((pckg.PeerDisconnectInfo info) {
      return PeerDisconnectReasonMapper.toDomain(info.reason);
    }),
  );

  @override
  Future<void> dispose() => resetPeerStack();

  @override
  Future<void> resetPeerStack() => _peerLifecycle.reset();
}
