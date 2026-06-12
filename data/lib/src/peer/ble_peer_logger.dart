import 'dart:developer' as developer;

import 'package:ble_peer_session/ble_peer_session.dart';

final class BlePeerLogger implements Logger {
  static const String _name = 'ble_peer';

  @override
  void d(String message) {
    developer.log(message, name: _name);
  }

  @override
  void e(String message) {
    developer.log(message, name: _name, level: 1000);
  }

  @override
  void w(String message) {
    developer.log(message, name: _name, level: 900);
  }
}
