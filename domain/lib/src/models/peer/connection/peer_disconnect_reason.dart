import 'package:flutter/foundation.dart';

/// Why an established peer game session ended.
@immutable
enum PeerDisconnectReason { userDisconnect, peerDisconnect, linkLost, timeout }
