import 'package:data/src/peer/ble_peer_logger.dart';
import 'package:injectable/injectable.dart';

@module
abstract class BlePeerModule {
  @lazySingleton
  BlePeerLogger blePeerLogger() => BlePeerLogger();
}
