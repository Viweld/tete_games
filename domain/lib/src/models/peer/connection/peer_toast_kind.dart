import 'package:flutter/foundation.dart';

@immutable
enum PeerToastKind {
  invitationRejected,
  bluetoothUnavailable,
  discoveryFailed,
  connectionFailed,
  genericError,
}
