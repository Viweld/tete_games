import 'package:core/src/config/app_runtime_mode.dart';

export 'package:core/src/config/app_runtime_mode.dart';

class AppConfig {
  AppConfig({
    required this.runtimeMode,
    required this.bleAppName,
    required this.bleServiceUuid,
    required this.bleCharacteristicUuid,
  });

  final AppRuntimeMode runtimeMode;
  final String bleAppName;
  final String bleServiceUuid;
  final String bleCharacteristicUuid;

  static const String defaultBleAppName = 'tete games';
  static const String defaultBleServiceUuid = '0000a7c0-0000-1000-8000-00805f9b34fb';
  static const String defaultBleCharacteristicUuid = '0000a7c1-0000-1000-8000-00805f9b34fb';

  factory AppConfig.create({required AppRuntimeMode runtimeMode}) {
    return AppConfig(
      runtimeMode: runtimeMode,
      bleAppName: defaultBleAppName,
      bleServiceUuid: defaultBleServiceUuid,
      bleCharacteristicUuid: defaultBleCharacteristicUuid,
    );
  }
}
