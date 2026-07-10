import 'package:ble_peer_session/ble_peer_session.dart' as pckg;
import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/src/peer/mappers/peer_connection_state_mapper.dart';
import 'package:infrastructure/src/peer/mappers/peer_device_mapper.dart';
import 'package:infrastructure/src/peer/mappers/peer_disconnect_reason_mapper.dart';
import 'package:infrastructure/src/peer/mappers/peer_endpoint_mapper.dart';
import 'package:infrastructure/src/peer/mappers/peer_identity_mapper.dart';
import 'package:peer/peer_connection.dart';

void main() {
  const PeerDevice domainDevice = PeerDevice(id: 'device-1', name: 'Player', isOurApp: true);
  const PeerIdentity domainIdentity = PeerIdentity(id: 'peer-1', displayName: 'Remote');
  const PeerEndpoint domainEndpoint = PeerEndpoint(identity: domainIdentity, device: domainDevice);

  group('PeerDeviceMapper', () {
    test('round-trips device fields', () {
      const pckg.Device packageDevice = pckg.Device(id: 'device-1', name: 'Player', isOurApp: true);

      expect(PeerDeviceMapper.toDomain(packageDevice), domainDevice);
      expect(PeerDeviceMapper.toPackage(domainDevice).id, packageDevice.id);
      expect(PeerDeviceMapper.toPackage(domainDevice).name, packageDevice.name);
      expect(PeerDeviceMapper.toPackage(domainDevice).isOurApp, packageDevice.isOurApp);
    });
  });

  group('PeerIdentityMapper', () {
    test('round-trips identity fields', () {
      const pckg.PeerIdentity packageIdentity = pckg.PeerIdentity(
        id: 'peer-1',
        displayName: 'Remote',
      );

      expect(PeerIdentityMapper.toDomain(packageIdentity), domainIdentity);
      expect(PeerIdentityMapper.toPackage(domainIdentity).id, packageIdentity.id);
      expect(PeerIdentityMapper.toPackage(domainIdentity).displayName, packageIdentity.displayName);
    });
  });

  group('PeerEndpointMapper', () {
    test('round-trips endpoint fields', () {
      final pckg.PeerEndpoint packageEndpoint = pckg.PeerEndpoint(
        identity: PeerIdentityMapper.toPackage(domainIdentity),
        device: PeerDeviceMapper.toPackage(domainDevice),
      );

      expect(PeerEndpointMapper.toDomain(packageEndpoint), domainEndpoint);
      expect(PeerEndpointMapper.toPackage(domainEndpoint).identity.id, domainIdentity.id);
      expect(PeerEndpointMapper.toPackage(domainEndpoint).device.id, domainDevice.id);
    });
  });

  const pckg.PeerEndpoint localPeer = pckg.PeerEndpoint(
    identity: pckg.PeerIdentity(id: 'local-1', displayName: 'Local'),
    device: pckg.Device(id: 'local-device', name: 'Local', isOurApp: true),
  );

  group('PeerConnectionStateMapper', () {
    test('maps null info to disconnected', () {
      expect(PeerConnectionStateMapper.toDomain(null), const PeerDisconnected());
    });

    test('maps idle and waiting phases to disconnected', () {
      expect(
        PeerConnectionStateMapper.toDomain(
          const pckg.PeerConnectionInfo(phase: pckg.PeerConnectionPhase.idle, localPeer: localPeer),
        ),
        const PeerDisconnected(),
      );
      expect(
        PeerConnectionStateMapper.toDomain(
          const pckg.PeerConnectionInfo(
            phase: pckg.PeerConnectionPhase.waitingForPeer,
            localPeer: localPeer,
          ),
        ),
        const PeerDisconnected(),
      );
    });

    test('maps decision phases to connecting', () {
      expect(
        PeerConnectionStateMapper.toDomain(
          const pckg.PeerConnectionInfo(
            phase: pckg.PeerConnectionPhase.awaitingUserDecision,
            localPeer: localPeer,
          ),
        ),
        const PeerConnecting(),
      );
      expect(
        PeerConnectionStateMapper.toDomain(
          const pckg.PeerConnectionInfo(
            phase: pckg.PeerConnectionPhase.awaitingRemoteDecision,
            localPeer: localPeer,
          ),
        ),
        const PeerConnecting(),
      );
    });

    test('maps connected phase to PeerConnected', () {
      final pckg.PeerConnectionInfo info = pckg.PeerConnectionInfo(
        phase: pckg.PeerConnectionPhase.connected,
        localPeer: localPeer,
        remotePeer: PeerEndpointMapper.toPackage(domainEndpoint),
      );

      final PeerConnectionState state = PeerConnectionStateMapper.toDomain(info);

      expect(state, isA<PeerConnected>());
      expect((state as PeerConnected).remoteEndpoint, domainEndpoint);
    });
  });

  group('PeerDisconnectReasonMapper', () {
    test('maps every package reason to domain reason', () {
      const Map<pckg.PeerDisconnectReason, PeerDisconnectReason> expected =
          <pckg.PeerDisconnectReason, PeerDisconnectReason>{
            pckg.PeerDisconnectReason.userDisconnect: PeerDisconnectReason.userDisconnect,
            pckg.PeerDisconnectReason.peerDisconnect: PeerDisconnectReason.peerDisconnect,
            pckg.PeerDisconnectReason.linkLost: PeerDisconnectReason.linkLost,
            pckg.PeerDisconnectReason.timeout: PeerDisconnectReason.timeout,
          };

      for (final MapEntry<pckg.PeerDisconnectReason, PeerDisconnectReason> entry
          in expected.entries) {
        expect(PeerDisconnectReasonMapper.toDomain(entry.key), entry.value);
      }
    });
  });
}
