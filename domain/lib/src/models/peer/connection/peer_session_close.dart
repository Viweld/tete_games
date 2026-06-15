import 'package:flutter/foundation.dart';

@immutable
enum PeerSessionCloseOrigin { user, system, peer }

@immutable
enum PeerSessionCloseReason { userDisconnect, userDismissedOverlay, error, peerDisconnected }

@immutable
enum PeerSessionErrorKind { bluetoothUnavailable, discoveryFailed, connectionFailed, generic }
