import 'package:flutter/foundation.dart';
import 'package:peer/src/domain/models/peer/connection/app_connection_view_state.dart';
import 'package:peer/src/domain/models/peer/connection/peer_ui_event.dart';

@immutable
final class AppConnectionFrame {
  const AppConnectionFrame({
    required this.frameId,
    required this.sessionId,
    required this.state,
    required this.criticalEvents,
    required this.softEvents,
  });

  final int frameId;
  final String sessionId;
  final AppConnectionViewState state;
  final List<PeerUiEvent> criticalEvents;
  final List<PeerUiEvent> softEvents;
}
