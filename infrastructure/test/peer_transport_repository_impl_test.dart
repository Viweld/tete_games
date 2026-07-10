import 'dart:async';

import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/src/peer/repositories/peer_transport_repository_impl.dart';
import 'package:peer/peer_connection.dart';

import 'support/ble_peer_test_fakes.dart';

void main() {
  group('PeerTransportRepositoryImpl', () {
    late FakePeerLifecyclePort peerLifecycle;
    late PeerTransportRepositoryImpl repository;

    setUp(() {
      peerLifecycle = FakePeerLifecyclePort();
      repository = PeerTransportRepositoryImpl(peerLifecycle);
    });

    tearDown(() async {
      await repository.dispose();
      await peerLifecycle.session.close();
      await peerLifecycle.close();
    });

    test('connectionState maps peer connection stream to domain state', () async {
      final List<PeerConnectionState> states = <PeerConnectionState>[];
      final StreamSubscription<PeerConnectionState> subscription = repository.connectionState
          .listen(states.add);

      await peerLifecycle.requirePeer();
      peerLifecycle.session.emitConnection(connectedPackageInfo());
      await Future<void>.delayed(Duration.zero);

      expect(states.last, isA<PeerConnected>());
      final PeerConnected connected = states.last as PeerConnected;
      expect(connected.remoteEndpoint.identity.displayName, 'Remote');

      await subscription.cancel();
    });

    test('sessionMessages filters and maps session handshake messages', () async {
      final List<PeerSessionMessage> messages = <PeerSessionMessage>[];
      final StreamSubscription<PeerSessionMessage> subscription = repository.sessionMessages.listen(
        messages.add,
      );

      await peerLifecycle.requirePeer();
      peerLifecycle.session.emitMessage(
        const pckg.PeerMessage(sender: packageEndpoint, type: pckg.PeerMessageTypes.sessionInvite),
      );
      peerLifecycle.session.emitMessage(
        pckg.PeerMessage.app(sender: packageEndpoint, type: 'peer.app.custom'),
      );
      await Future<void>.delayed(Duration.zero);

      expect(messages, hasLength(1));
      expect(messages.single, isA<PeerInvitation>());

      await subscription.cancel();
    });

    test('disconnectReasons maps package disconnect reasons', () async {
      final List<PeerDisconnectReason> reasons = <PeerDisconnectReason>[];
      final StreamSubscription<PeerDisconnectReason> subscription = repository.disconnectReasons
          .listen(reasons.add);

      await peerLifecycle.requirePeer();
      peerLifecycle.session.emitDisconnect(
        const pckg.PeerDisconnectInfo(reason: pckg.PeerDisconnectReason.linkLost),
      );
      await Future<void>.delayed(Duration.zero);

      expect(reasons.single, PeerDisconnectReason.linkLost);

      await subscription.cancel();
    });

    test('resetPeerStack delegates to peer lifecycle reset', () async {
      await repository.resetPeerStack();

      expect(peerLifecycle.resetCalls, 1);
    });
  });
}
