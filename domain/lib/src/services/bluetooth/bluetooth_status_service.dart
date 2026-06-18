import 'package:domain/src/models/bluetooth/bluetooth_permission_request_result.dart';
import 'package:domain/src/models/bluetooth/bluetooth_status_snapshot.dart';

/// Observes Bluetooth runtime permissions and adapter power state for UI indicators.
abstract interface class BluetoothStatusService {
  Stream<BluetoothStatusSnapshot> get statusStream;

  Future<BluetoothStatusSnapshot> readSnapshot();

  /// Re-checks runtime permissions (e.g. after returning from system settings).
  Future<void> refreshPermissions();

  Future<bool> arePermissionsPermanentlyDenied();

  Future<BluetoothPermissionRequestResult> requestPermissions();

  Future<bool> openAppSettings();
}
