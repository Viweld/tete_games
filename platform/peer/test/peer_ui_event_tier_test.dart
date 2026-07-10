import 'package:flutter_test/flutter_test.dart';
import 'package:peer/peer_connection.dart';

void main() {
  group('tierEvents', () {
    test('maps close overlay to critical events', () {
      const List<RawPeerUiEvent> rawEvents = <RawPeerUiEvent>[RawCloseOverlayEvent()];

      final TieredEvents tiered = tierEvents(
        rawEvents: rawEvents,
        frameId: 3,
        sessionId: 'session-1',
        eventSequenceStart: 10,
      );

      expect(tiered.criticalEvents, hasLength(1));
      expect(tiered.criticalEvents.first, isA<PeerUiCloseOverlayEvent>());
      expect(tiered.criticalEvents.first.frameId, 3);
      expect(tiered.criticalEvents.first.sessionId, 'session-1');
      expect(tiered.criticalEvents.first.eventSequence, 10);
      expect(tiered.softEvents, isEmpty);
    });

    test('maps toast to soft events', () {
      const List<RawPeerUiEvent> rawEvents = <RawPeerUiEvent>[
        RawShowToastEvent(PeerToastKind.linkLost),
      ];

      final TieredEvents tiered = tierEvents(
        rawEvents: rawEvents,
        frameId: 5,
        sessionId: 'session-2',
        eventSequenceStart: 0,
      );

      expect(tiered.criticalEvents, isEmpty);
      expect(tiered.softEvents, hasLength(1));
      final PeerUiShowToastEvent toast = tiered.softEvents.first as PeerUiShowToastEvent;
      expect(toast.kind, PeerToastKind.linkLost);
      expect(toast.eventId, '0:showToast');
    });

    test('splits mixed events into critical and soft buckets', () {
      const List<RawPeerUiEvent> rawEvents = <RawPeerUiEvent>[
        RawShowToastEvent(PeerToastKind.peerDisconnected),
        RawCloseOverlayEvent(),
      ];

      final TieredEvents tiered = tierEvents(
        rawEvents: rawEvents,
        frameId: 7,
        sessionId: 'session-3',
        eventSequenceStart: 4,
      );

      expect(tiered.softEvents, hasLength(1));
      expect(tiered.criticalEvents, hasLength(1));
      expect(tiered.softEvents.first.eventSequence, 4);
      expect(tiered.criticalEvents.first.eventSequence, 5);
    });
  });

  group('countRawEvents', () {
    test('returns number of raw events', () {
      expect(countRawEvents(const <RawPeerUiEvent>[]), 0);
      expect(
        countRawEvents(const <RawPeerUiEvent>[
          RawCloseOverlayEvent(),
          RawShowToastEvent(PeerToastKind.genericError),
        ]),
        2,
      );
    });
  });
}
