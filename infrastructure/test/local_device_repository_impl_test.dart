import 'package:core/src/config/app_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/src/peer/repositories/local_device_repository_impl.dart';
import 'package:peer/peer_connection.dart';

void main() {
  group('LocalDeviceRepositoryImpl', () {
    late LocalDeviceRepositoryImpl repository;

    setUp(() {
      repository = LocalDeviceRepositoryImpl(AppConfig.create(runtimeMode: AppRuntimeMode.test));
    });

    test('getLocalDevice uses service uuid as device id', () async {
      final PeerDevice device = await repository.getLocalDevice();

      expect(device.id, AppConfig.defaultBleServiceUuid);
      expect(device.isOurApp, isTrue);
      expect(device.name, startsWith('${AppConfig.defaultBleAppName}-'));
    });
  });
}
