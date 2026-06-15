import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:domain/domain.dart';

abstract final class PeerDisconnectReasonMapper {
  static PeerDisconnectReason toDomain(pckg.PeerDisconnectReason reason) {
    return switch (reason) {
      pckg.PeerDisconnectReason.userDisconnect => PeerDisconnectReason.userDisconnect,
      pckg.PeerDisconnectReason.peerDisconnect => PeerDisconnectReason.peerDisconnect,
      pckg.PeerDisconnectReason.linkLost => PeerDisconnectReason.linkLost,
      pckg.PeerDisconnectReason.timeout => PeerDisconnectReason.timeout,
    };
  }
}
