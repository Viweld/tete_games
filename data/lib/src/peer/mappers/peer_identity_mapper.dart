import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:domain/domain.dart';

abstract final class PeerIdentityMapper {
  static PeerIdentity toDomain(pckg.PeerIdentity identity) {
    return PeerIdentity(id: identity.id, displayName: identity.displayName);
  }

  static pckg.PeerIdentity toPackage(PeerIdentity identity) {
    return pckg.PeerIdentity(id: identity.id, displayName: identity.displayName);
  }
}
