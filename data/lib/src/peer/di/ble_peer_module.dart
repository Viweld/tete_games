import 'package:ble_peer_session/ble_peer_session.dart';
import 'package:core/core.dart';
import 'package:data/src/peer/ble_peer_logger.dart';

@module
abstract class BlePeerModule {
  @lazySingleton
  BlePeerLogger blePeerLogger() => BlePeerLogger();

  @lazySingleton
  Peer peer(AppConfig config, BlePeerLogger logger) {
    return Peer.create(
      config: BlePeerConfig(
        appName: config.bleAppName,
        serviceUuid: config.bleServiceUuid,
        characteristicUuid: config.bleCharacteristicUuid,
      ),
      logger: logger,
    );
  }
}
