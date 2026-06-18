import 'package:domain/src/models/peer/peer_models.dart';

abstract interface class LocalDeviceRepository {
  Future<PeerDevice> getLocalDevice();
}
