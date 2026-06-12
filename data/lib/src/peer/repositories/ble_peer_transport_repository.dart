import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:data/src/peer/mappers/peer_connection_state_mapper.dart';
import 'package:data/src/peer/mappers/peer_session_message_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPeerTransportRepository)
final class BlePeerTransportRepository implements IPeerTransportRepository {
  BlePeerTransportRepository(this._transportFacade);

  final pckg.TransportFacade _transportFacade;

  @override
  Stream<PeerConnectionState> get connectionState =>
      _transportFacade.connectionStateStream.map(PeerConnectionStateMapper.toDomain);

  @override
  Stream<PeerSessionMessage> get sessionMessages => _transportFacade.messagesStream
      .where((pckg.TransportMessage message) => message is! pckg.PeerMessage)
      .map(PeerSessionMessageMapper.toDomain);

  @override
  Future<void> dispose() => _transportFacade.dispose();
}
