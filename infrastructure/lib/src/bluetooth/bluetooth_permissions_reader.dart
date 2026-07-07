import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:domain/domain.dart';
import 'package:permission_handler/permission_handler.dart';

/// Read-only Bluetooth permission checks aligned with peer BLE requirements.
final class BluetoothPermissionsReader {
  BluetoothPermissionsReader._();

  static Future<bool> areGranted() async {
    final List<PermissionStatus> statuses = await _readStatuses();
    return statuses.every((PermissionStatus status) => status.isGranted);
  }

  static Future<bool> arePermanentlyDenied() async {
    final List<PermissionStatus> statuses = await _readStatuses();
    return statuses.any((PermissionStatus status) => status.isPermanentlyDenied);
  }

  static Future<BluetoothPermissionRequestResult> request() async {
    if (await areGranted()) {
      return BluetoothPermissionRequestResult.granted;
    }

    final Map<Permission, PermissionStatus> results = await _requestPermissions();
    if (results.values.every((PermissionStatus status) => status.isGranted)) {
      return BluetoothPermissionRequestResult.granted;
    }
    if (results.values.any((PermissionStatus status) => status.isPermanentlyDenied)) {
      return BluetoothPermissionRequestResult.permanentlyDenied;
    }

    return BluetoothPermissionRequestResult.denied;
  }

  static Future<bool> openAppSettingsSafe() async {
    try {
      return await openAppSettings();
    } on Object {
      return false;
    }
  }

  static Future<List<PermissionStatus>> _readStatuses() async {
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
      final int androidSdk = androidInfo.version.sdkInt;

      if (androidSdk >= 31) {
        return <PermissionStatus>[
          await Permission.bluetoothScan.status,
          await Permission.bluetoothConnect.status,
          await Permission.bluetoothAdvertise.status,
        ];
      }

      return <PermissionStatus>[
        await Permission.bluetooth.status,
        await Permission.location.status,
      ];
    }

    if (Platform.isIOS) {
      return <PermissionStatus>[
        await Permission.bluetooth.status,
        await Permission.locationWhenInUse.status,
      ];
    }

    return <PermissionStatus>[PermissionStatus.denied];
  }

  static Future<Map<Permission, PermissionStatus>> _requestPermissions() async {
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
      final int androidSdk = androidInfo.version.sdkInt;

      if (androidSdk >= 31) {
        return <Permission, PermissionStatus>{
          Permission.bluetoothScan: await Permission.bluetoothScan.request(),
          Permission.bluetoothConnect: await Permission.bluetoothConnect.request(),
          Permission.bluetoothAdvertise: await Permission.bluetoothAdvertise.request(),
        };
      }

      return <Permission, PermissionStatus>{
        Permission.bluetooth: await Permission.bluetooth.request(),
        Permission.location: await Permission.location.request(),
      };
    }

    if (Platform.isIOS) {
      return <Permission, PermissionStatus>{
        Permission.bluetooth: await Permission.bluetooth.request(),
        Permission.locationWhenInUse: await Permission.locationWhenInUse.request(),
      };
    }

    return <Permission, PermissionStatus>{};
  }
}
