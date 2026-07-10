import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/src/peer/mappers/peer_session_message_mapper.dart';
import 'package:peer/peer_connection.dart';

void main() {
  const PeerDevice domainDevice = PeerDevice(id: 'device-1', name: 'Player', isOurApp: true);
  const PeerIdentity domainIdentity = PeerIdentity(id: 'peer-1', displayName: 'Remote');
  const PeerEndpoint domainEndpoint = PeerEndpoint(identity: domainIdentity, device: domainDevice);

  const pckg.PeerEndpoint packageSender = pckg.PeerEndpoint(
    identity: pckg.PeerIdentity(id: 'peer-1', displayName: 'Remote'),
    device: pckg.Device(id: 'device-1', name: 'Player', isOurApp: true),
  );

  group('PeerSessionMessageMapper', () {
    test('maps session invite to PeerInvitation', () {
      final PeerSessionMessage message = PeerSessionMessageMapper.toDomain(
        const pckg.PeerMessage(sender: packageSender, type: pckg.PeerMessageTypes.sessionInvite),
      );

      expect(message, isA<PeerInvitation>());
      expect((message as PeerInvitation).remoteEndpoint, domainEndpoint);
    });

    test('maps session accept to PeerAcceptance', () {
      final PeerSessionMessage message = PeerSessionMessageMapper.toDomain(
        const pckg.PeerMessage(sender: packageSender, type: pckg.PeerMessageTypes.sessionAccept),
      );

      expect(message, isA<PeerAcceptance>());
      expect((message as PeerAcceptance).remoteEndpoint, domainEndpoint);
    });

    test('maps session reject to PeerRejection', () {
      final PeerSessionMessage message = PeerSessionMessageMapper.toDomain(
        const pckg.PeerMessage(sender: packageSender, type: pckg.PeerMessageTypes.sessionReject),
      );

      expect(message, isA<PeerRejection>());
      expect((message as PeerRejection).remoteEndpoint, domainEndpoint);
    });

    test('maps session disconnect to PeerDisconnection', () {
      final PeerSessionMessage message = PeerSessionMessageMapper.toDomain(
        const pckg.PeerMessage(
          sender: packageSender,
          type: pckg.PeerMessageTypes.sessionDisconnect,
        ),
      );

      expect(message, isA<PeerDisconnection>());
      expect((message as PeerDisconnection).remoteEndpoint, domainEndpoint);
    });

    test('throws for non-session message types', () {
      expect(
        () => PeerSessionMessageMapper.toDomain(
          const pckg.PeerMessage(sender: packageSender, type: pckg.PeerMessageTypes.appText),
        ),
        throwsA(isA<UnsupportedError>()),
      );
    });
  });
}
