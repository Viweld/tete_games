import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:data/src/peer/mappers/peer_endpoint_mapper.dart';
import 'package:domain/domain.dart';

abstract final class PeerSessionMessageMapper {
  static PeerSessionMessage toDomain(pckg.TransportMessage message) {
    final PeerEndpoint remoteEndpoint = PeerEndpointMapper.toDomain(message.peerEndpoint);

    return switch (message) {
      pckg.InvitationMessage() => PeerInvitation(remoteEndpoint: remoteEndpoint),
      pckg.AcceptanceMessage() => PeerAcceptance(remoteEndpoint: remoteEndpoint),
      pckg.RejectionMessage() => PeerRejection(remoteEndpoint: remoteEndpoint),
      pckg.DisconnectionMessage() => PeerDisconnection(remoteEndpoint: remoteEndpoint),
      pckg.PeerMessage() => throw UnsupportedError('PeerMessage is not a session message'),
    };
  }
}
