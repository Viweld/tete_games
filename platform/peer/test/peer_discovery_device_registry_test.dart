import 'package:flutter_test/flutter_test.dart';
import 'package:peer/src/data/peer_discovery_device_registry.dart';
import 'package:peer/src/domain/models/peer/peer_device.dart';

void main() {
  const PeerDiscoveryDeviceRegistry registry = PeerDiscoveryDeviceRegistry();

  group('PeerDiscoveryDeviceRegistry', () {
    test('merge accumulates devices by id', () {
      final Map<String, PeerDevice> store = <String, PeerDevice>{};
      const PeerDevice first = PeerDevice(id: 'd1', name: 'A', isOurApp: true);
      const PeerDevice updated = PeerDevice(id: 'd1', name: 'A+', isOurApp: true);
      const PeerDevice second = PeerDevice(id: 'd2', name: 'B', isOurApp: false);

      final List<PeerDevice> firstMerge = registry.merge(
        store: store,
        incoming: <PeerDevice>[first],
      );
      final List<PeerDevice> secondMerge = registry.merge(
        store: store,
        incoming: <PeerDevice>[updated, second],
      );

      expect(firstMerge, <PeerDevice>[first]);
      expect(secondMerge, containsAll(<PeerDevice>[updated, second]));
      expect(secondMerge, hasLength(2));
      expect(store['d1']?.name, 'A+');
    });

    test('clear removes all stored devices', () {
      final Map<String, PeerDevice> store = <String, PeerDevice>{
        'd1': const PeerDevice(id: 'd1', name: 'A', isOurApp: true),
      };

      registry.clear(store);

      expect(store, isEmpty);
    });
  });
}
