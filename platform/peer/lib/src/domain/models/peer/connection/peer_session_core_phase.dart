import 'package:flutter/foundation.dart';

@immutable
enum PeerSessionCorePhase {
  idle,
  roleSelection,
  hostAdvertising,
  hostInvitationDecision,
  clientDiscovering,
  clientInviting,
  connected,
  error,
}
