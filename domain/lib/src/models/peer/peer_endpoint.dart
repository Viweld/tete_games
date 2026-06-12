import 'package:domain/src/models/peer/peer_device.dart';
import 'package:domain/src/models/peer/peer_identity.dart';

final class PeerEndpoint {
  const PeerEndpoint({
    required this.identity,
    required this.device,
  });

  final PeerIdentity identity;
  final PeerDevice device;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PeerEndpoint && other.identity == identity && other.device == device;
  }

  @override
  int get hashCode => Object.hash(identity, device);
}
