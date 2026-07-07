import 'package:peer/src/domain/models/peer/peer_models.dart';

abstract interface class LocalDeviceRepository {
  Future<PeerDevice> getLocalDevice();
}
