import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:data/src/peer/mappers/peer_connection_state_mapper.dart';
import 'package:data/src/peer/mappers/peer_session_message_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPeerTransportRepository)
final class BlePeerTransportRepository implements IPeerTransportRepository {
  BlePeerTransportRepository(this._peer);

  final pckg.Peer _peer;

  @override
  Stream<PeerConnectionState> get connectionState =>
      _peer.connectionStream.map(PeerConnectionStateMapper.toDomain);

  @override
  Stream<PeerSessionMessage> get sessionMessages => _peer.messagesStream
      .where((pckg.PeerMessage message) => pckg.PeerMessageTypes.isSessionType(message.type))
      .map(PeerSessionMessageMapper.toDomain);

  @override
  Future<void> dispose() => _peer.dispose();
}
