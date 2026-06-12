import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:data/src/peer/mappers/peer_device_mapper.dart';
import 'package:data/src/peer/mappers/peer_identity_mapper.dart';
import 'package:domain/domain.dart';

abstract final class PeerEndpointMapper {
  static PeerEndpoint toDomain(pckg.PeerEndpoint endpoint) {
    return PeerEndpoint(
      identity: PeerIdentityMapper.toDomain(endpoint.identity),
      device: PeerDeviceMapper.toDomain(endpoint.device),
    );
  }

  static pckg.PeerEndpoint toPackage(PeerEndpoint endpoint) {
    return pckg.PeerEndpoint(
      identity: PeerIdentityMapper.toPackage(endpoint.identity),
      device: PeerDeviceMapper.toPackage(endpoint.device),
    );
  }
}
