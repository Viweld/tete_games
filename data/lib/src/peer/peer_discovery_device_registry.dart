import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

@immutable
final class PeerDiscoveryDeviceRegistry {
  const PeerDiscoveryDeviceRegistry();

  List<PeerDevice> merge({
    required Map<String, PeerDevice> store,
    required List<PeerDevice> incoming,
  }) {
    for (final PeerDevice device in incoming) {
      store[device.id] = device;
    }

    return store.values.toList(growable: false);
  }

  void clear(Map<String, PeerDevice> store) => store.clear();
}
