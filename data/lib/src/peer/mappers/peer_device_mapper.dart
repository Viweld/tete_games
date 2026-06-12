import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:domain/domain.dart';

abstract final class PeerDeviceMapper {
  static PeerDevice toDomain(pckg.Device device) {
    return PeerDevice(id: device.id, name: device.name, isOurApp: device.isOurApp);
  }

  static pckg.Device toPackage(PeerDevice device) {
    return pckg.Device(id: device.id, name: device.name, isOurApp: device.isOurApp);
  }
}
