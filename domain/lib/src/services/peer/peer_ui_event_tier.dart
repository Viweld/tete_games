import 'package:domain/src/models/peer/connection/peer_ui_event.dart';
import 'package:domain/src/services/peer/peer_connection_reduce.dart';
import 'package:flutter/foundation.dart';

@immutable
typedef TieredEvents = ({List<PeerUiEvent> criticalEvents, List<PeerUiEvent> softEvents});

TieredEvents tierEvents({
  required List<RawPeerUiEvent> rawEvents,
  required int frameId,
  required String sessionId,
  required int eventSequenceStart,
}) {
  final List<PeerUiEvent> criticalEvents = <PeerUiEvent>[];
  final List<PeerUiEvent> softEvents = <PeerUiEvent>[];
  int sequence = eventSequenceStart;

  for (final RawPeerUiEvent raw in rawEvents) {
    switch (raw) {
      case RawCloseOverlayEvent():
        criticalEvents.add(
          PeerUiCloseOverlayEvent(
            eventSequence: sequence,
            eventId: '$sequence:closeOverlay',
            frameId: frameId,
            sessionId: sessionId,
          ),
        );
        sequence++;
      case RawShowToastEvent(:final kind):
        softEvents.add(
          PeerUiShowToastEvent(
            eventSequence: sequence,
            eventId: '$sequence:showToast',
            frameId: frameId,
            sessionId: sessionId,
            kind: kind,
          ),
        );
        sequence++;
    }
  }

  assert(
    criticalEvents.whereType<PeerUiCloseOverlayEvent>().length <= 1,
    'At most one terminal closeOverlay per frame',
  );

  return (criticalEvents: criticalEvents, softEvents: softEvents);
}

int countRawEvents(List<RawPeerUiEvent> rawEvents) => rawEvents.length;
