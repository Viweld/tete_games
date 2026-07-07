import 'package:core/core.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:peer/peer_connection.dart';

@LazySingleton(as: LocalDeviceRepository)
final class LocalDeviceRepositoryImpl implements LocalDeviceRepository {
  LocalDeviceRepositoryImpl(this._appConfig);

  final AppConfig _appConfig;

  @override
  Future<PeerDevice> getLocalDevice() async {
    final String deviceName = await _resolveDeviceName();

    return PeerDevice(id: _appConfig.bleServiceUuid, name: deviceName, isOurApp: true);
  }

  Future<String> _resolveDeviceName() async {
    final DeviceInfoPlugin plugin = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo info = await plugin.androidInfo;
        return '${_appConfig.bleAppName}-${info.model}';
      }
      if (Platform.isIOS) {
        final IosDeviceInfo info = await plugin.iosInfo;
        return '${_appConfig.bleAppName}-${info.name}';
      }
    } on Object {
      // Fallback when platform device info is unavailable.
    }

    return '${_appConfig.bleAppName}-Device';
  }
}
