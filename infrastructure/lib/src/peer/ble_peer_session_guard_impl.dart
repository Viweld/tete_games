import 'dart:io';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:peer/peer_connection.dart';

@LazySingleton(as: PeerBleSessionGuard)
final class BlePeerSessionGuardImpl implements PeerBleSessionGuard {
  BlePeerSessionGuardImpl()
    : _delegate = Platform.isAndroid
          ? _AndroidBlePeerSessionGuard()
          : const _NoOpPeerBleSessionGuard();

  final PeerBleSessionGuard _delegate;

  @override
  Future<void> activate() => _delegate.activate();

  @override
  Future<void> deactivate() => _delegate.deactivate();
}

final class _NoOpPeerBleSessionGuard implements PeerBleSessionGuard {
  const _NoOpPeerBleSessionGuard();

  @override
  Future<void> activate() async {}

  @override
  Future<void> deactivate() async {}
}

final class _AndroidBlePeerSessionGuard implements PeerBleSessionGuard {
  static const MethodChannel _channel = MethodChannel('games.tete.app/ble_peer_foreground');

  @override
  Future<void> activate() async {
    try {
      await _channel.invokeMethod<void>('start');
    } on PlatformException {
      // Foreground service is best-effort; BLE may still work without it.
    }
  }

  @override
  Future<void> deactivate() async {
    try {
      await _channel.invokeMethod<void>('stop');
    } on PlatformException {
      // Ignore teardown failures.
    }
  }
}
