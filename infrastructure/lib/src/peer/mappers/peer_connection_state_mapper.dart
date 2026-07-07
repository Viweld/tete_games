import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:infrastructure/src/peer/mappers/peer_endpoint_mapper.dart';
import 'package:peer/peer_connection.dart';

abstract final class PeerConnectionStateMapper {
  static PeerConnectionState toDomain(pckg.PeerConnectionInfo? info) {
    if (info == null) {
      return const PeerDisconnected();
    }

    return switch (info.phase) {
      pckg.PeerConnectionPhase.idle ||
      pckg.PeerConnectionPhase.waitingForPeer => const PeerDisconnected(),
      pckg.PeerConnectionPhase.awaitingUserDecision ||
      pckg.PeerConnectionPhase.awaitingRemoteDecision => const PeerConnecting(),
      pckg.PeerConnectionPhase.connected => PeerConnected(
        remoteEndpoint: PeerEndpointMapper.toDomain(info.remotePeer!),
      ),
    };
  }
}
