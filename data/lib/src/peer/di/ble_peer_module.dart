import 'package:ble_peer_session/ble_peer_session.dart';
import 'package:core/core.dart';
import 'package:data/src/peer/ble_peer_logger.dart';

@module
abstract class BlePeerModule {
  @lazySingleton
  BlePeerLogger blePeerLogger() => BlePeerLogger();

  @lazySingleton
  BlePeerSessionModule blePeerSessionModule(AppConfig config, BlePeerLogger logger) {
    return BlePeerSessionModule.create(
      config: BlePeerConfig(
        appName: config.bleAppName,
        serviceUuid: config.bleServiceUuid,
        characteristicUuid: config.bleCharacteristicUuid,
      ),
      logger: logger,
    );
  }

  @lazySingleton
  TransportFacade transportFacade(BlePeerSessionModule module) => module.transportFacade;

  @lazySingleton
  TransportSessionClient transportSessionClient(BlePeerSessionModule module) =>
      module.transportSessionClient;

  @lazySingleton
  TransportSessionServer transportSessionServer(BlePeerSessionModule module) =>
      module.transportSessionServer;
}
