import 'package:peer/peer_connection.dart';

final class FakePeerPlayerIdentitySource implements PeerPlayerIdentitySource {
  FakePeerPlayerIdentitySource({this.identity});

  PeerPlayerIdentity? identity;

  @override
  Future<PeerPlayerIdentity?> getCurrentIdentity() async => identity;
}

final class FakeLocalDeviceRepository implements LocalDeviceRepository {
  FakeLocalDeviceRepository({this.device});

  PeerDevice? device;

  @override
  Future<PeerDevice> getLocalDevice() async {
    final PeerDevice? resolved = device;
    if (resolved == null) {
      throw StateError('FakeLocalDeviceRepository.device is not configured');
    }
    return resolved;
  }
}
