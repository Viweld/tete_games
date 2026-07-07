/// Read-only snapshot of Bluetooth permissions and adapter readiness for UI indicators.
final class BluetoothStatusSnapshot {
  const BluetoothStatusSnapshot({
    required this.arePermissionsGranted,
    required this.isAdapterEnabled,
  });

  final bool arePermissionsGranted;
  final bool isAdapterEnabled;
}
