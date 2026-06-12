import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:data/src/peer/mappers/peer_endpoint_mapper.dart';
import 'package:domain/domain.dart';

abstract final class PeerConnectionStateMapper {
  static PeerConnectionState toDomain(pckg.TransportSessionState state) {
    return switch (state) {
      pckg.TransportSessionDisconnected() => const PeerDisconnected(),
      pckg.TransportSessionAwaitingUserDecision() ||
      pckg.TransportSessionAwaitingRemoteDecision() => const PeerConnecting(),
      pckg.TransportSessionConnected(:final remotePeer) => PeerConnected(
        remoteEndpoint: PeerEndpointMapper.toDomain(remotePeer),
      ),
    };
  }
}
