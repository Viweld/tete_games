import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:data/src/peer/mappers/peer_endpoint_mapper.dart';
import 'package:domain/domain.dart';

abstract final class PeerSessionMessageMapper {
  static PeerSessionMessage toDomain(pckg.PeerMessage message) {
    final PeerEndpoint remoteEndpoint = PeerEndpointMapper.toDomain(message.sender);

    return switch (message.type) {
      pckg.PeerMessageTypes.sessionInvite => PeerInvitation(remoteEndpoint: remoteEndpoint),
      pckg.PeerMessageTypes.sessionAccept => PeerAcceptance(remoteEndpoint: remoteEndpoint),
      pckg.PeerMessageTypes.sessionReject => PeerRejection(remoteEndpoint: remoteEndpoint),
      pckg.PeerMessageTypes.sessionDisconnect => PeerDisconnection(remoteEndpoint: remoteEndpoint),
      _ => throw UnsupportedError('Not a session message type: ${message.type}'),
    };
  }
}
