import 'package:peer/src/domain/models/peer/connection/peer_toast_kind.dart';
import 'package:flutter/foundation.dart';

@immutable
enum PeerUiEventTier { critical, soft }

@immutable
enum PeerUiEventTarget { home, overlay }

@immutable
sealed class PeerUiEvent {
  const PeerUiEvent({
    required this.eventSequence,
    required this.eventId,
    required this.frameId,
    required this.sessionId,
    required this.tier,
    required this.target,
  });

  final int eventSequence;
  final String eventId;
  final int frameId;
  final String sessionId;
  final PeerUiEventTier tier;
  final PeerUiEventTarget target;
}

@immutable
final class PeerUiCloseOverlayEvent extends PeerUiEvent {
  const PeerUiCloseOverlayEvent({
    required super.eventSequence,
    required super.eventId,
    required super.frameId,
    required super.sessionId,
  }) : super(tier: PeerUiEventTier.critical, target: PeerUiEventTarget.home);
}

@immutable
final class PeerUiShowToastEvent extends PeerUiEvent {
  const PeerUiShowToastEvent({
    required super.eventSequence,
    required super.eventId,
    required super.frameId,
    required super.sessionId,
    required this.kind,
  }) : super(tier: PeerUiEventTier.soft, target: PeerUiEventTarget.overlay);

  final PeerToastKind kind;
}
