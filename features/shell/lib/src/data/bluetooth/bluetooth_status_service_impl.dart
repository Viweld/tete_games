import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:shell/src/data/bluetooth/bluetooth_permissions_reader.dart';
import 'package:shell/shell_domain.dart';

@LazySingleton(as: BluetoothStatusService, dispose: disposeBluetoothStatusService)
final class BluetoothStatusServiceImpl implements BluetoothStatusService {
  BluetoothStatusServiceImpl() {
    unawaited(_initialize());
  }

  static const String _logName = 'bluetooth.status';

  final StreamController<BluetoothStatusSnapshot> _statusController =
      StreamController<BluetoothStatusSnapshot>.broadcast();

  StreamSubscription<BluetoothAdapterState>? _adapterSubscription;
  BluetoothStatusSnapshot _current = const BluetoothStatusSnapshot(
    arePermissionsGranted: false,
    isAdapterEnabled: false,
  );

  @override
  Stream<BluetoothStatusSnapshot> get statusStream => _statusController.stream;

  @override
  Future<BluetoothStatusSnapshot> readSnapshot() => _readSnapshot();

  @override
  Future<void> refreshPermissions() async {
    try {
      final bool arePermissionsGranted = await BluetoothPermissionsReader.areGranted();
      _updateSnapshot(
        arePermissionsGranted: arePermissionsGranted,
        isAdapterEnabled: _current.isAdapterEnabled,
      );
    } on Object catch (error, stackTrace) {
      developer.log(
        'refreshPermissions failed',
        name: _logName,
        error: error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<bool> arePermissionsPermanentlyDenied() =>
      BluetoothPermissionsReader.arePermanentlyDenied();

  @override
  Future<BluetoothPermissionRequestResult> requestPermissions() =>
      BluetoothPermissionsReader.request();

  @override
  Future<bool> openAppSettings() => BluetoothPermissionsReader.openAppSettingsSafe();

  Future<void> _initialize() async {
    try {
      _current = await _readSnapshot();
      _emitCurrent();
    } on Object catch (error, stackTrace) {
      developer.log(
        'initial snapshot read failed',
        name: _logName,
        error: error,
        stackTrace: stackTrace,
      );
    }

    _adapterSubscription = FlutterBluePlus.adapterState.listen(_onAdapterStateChanged);
  }

  void _onAdapterStateChanged(BluetoothAdapterState adapterState) {
    _updateSnapshot(
      arePermissionsGranted: _current.arePermissionsGranted,
      isAdapterEnabled: adapterState == BluetoothAdapterState.on,
    );
  }

  Future<BluetoothStatusSnapshot> _readSnapshot() async {
    final bool arePermissionsGranted = await BluetoothPermissionsReader.areGranted();
    final bool isAdapterEnabled = FlutterBluePlus.adapterStateNow == BluetoothAdapterState.on;

    return BluetoothStatusSnapshot(
      arePermissionsGranted: arePermissionsGranted,
      isAdapterEnabled: isAdapterEnabled,
    );
  }

  void _updateSnapshot({required bool arePermissionsGranted, required bool isAdapterEnabled}) {
    if (_current.arePermissionsGranted == arePermissionsGranted &&
        _current.isAdapterEnabled == isAdapterEnabled) {
      return;
    }

    _current = BluetoothStatusSnapshot(
      arePermissionsGranted: arePermissionsGranted,
      isAdapterEnabled: isAdapterEnabled,
    );
    _emitCurrent();
  }

  void _emitCurrent() {
    if (_statusController.isClosed) return;
    _statusController.add(_current);
  }

  Future<void> dispose() async {
    await _adapterSubscription?.cancel();
    await _statusController.close();
  }
}

Future<void> disposeBluetoothStatusService(BluetoothStatusService service) async {
  (service as BluetoothStatusServiceImpl).dispose();
}
