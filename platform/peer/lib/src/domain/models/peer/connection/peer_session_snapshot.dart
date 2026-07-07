import 'package:peer/src/domain/models/peer/connection/peer_session_close.dart';
import 'package:peer/src/domain/models/peer/connection/peer_session_core_phase.dart';
import 'package:peer/src/domain/models/peer/peer_device.dart';
import 'package:peer/src/domain/models/peer/peer_endpoint.dart';
import 'package:peer/src/domain/models/peer/peer_role.dart';
import 'package:flutter/foundation.dart';

@immutable
final class PeerSessionSnapshot {
  const PeerSessionSnapshot({
    this.sessionId = '',
    this.phase = PeerSessionCorePhase.idle,
    this.role,
    this.discoveredDevices = const <PeerDevice>[],
    this.pendingInvitation,
    this.remoteEndpoint,
    this.invitedDeviceId,
    this.errorKind,
  });

  final String sessionId;
  final PeerSessionCorePhase phase;
  final PeerRole? role;
  final List<PeerDevice> discoveredDevices;
  final PeerEndpoint? pendingInvitation;
  final PeerEndpoint? remoteEndpoint;
  final String? invitedDeviceId;
  final PeerSessionErrorKind? errorKind;

  bool get isConnected => phase == PeerSessionCorePhase.connected;

  PeerSessionSnapshot copyWith({
    String? sessionId,
    PeerSessionCorePhase? phase,
    PeerRole? role,
    bool clearRole = false,
    List<PeerDevice>? discoveredDevices,
    PeerEndpoint? pendingInvitation,
    bool clearPendingInvitation = false,
    PeerEndpoint? remoteEndpoint,
    bool clearRemoteEndpoint = false,
    String? invitedDeviceId,
    bool clearInvitedDeviceId = false,
    PeerSessionErrorKind? errorKind,
    bool clearErrorKind = false,
  }) {
    return PeerSessionSnapshot(
      sessionId: sessionId ?? this.sessionId,
      phase: phase ?? this.phase,
      role: clearRole ? null : (role ?? this.role),
      discoveredDevices: discoveredDevices ?? this.discoveredDevices,
      pendingInvitation: clearPendingInvitation
          ? null
          : (pendingInvitation ?? this.pendingInvitation),
      remoteEndpoint: clearRemoteEndpoint ? null : (remoteEndpoint ?? this.remoteEndpoint),
      invitedDeviceId: clearInvitedDeviceId ? null : (invitedDeviceId ?? this.invitedDeviceId),
      errorKind: clearErrorKind ? null : (errorKind ?? this.errorKind),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PeerSessionSnapshot &&
            other.sessionId == sessionId &&
            other.phase == phase &&
            other.role == role &&
            listEquals(other.discoveredDevices, discoveredDevices) &&
            other.pendingInvitation == pendingInvitation &&
            other.remoteEndpoint == remoteEndpoint &&
            other.invitedDeviceId == invitedDeviceId &&
            other.errorKind == errorKind;
  }

  @override
  int get hashCode => Object.hash(
    sessionId,
    phase,
    role,
    Object.hashAll(discoveredDevices),
    pendingInvitation,
    remoteEndpoint,
    invitedDeviceId,
    errorKind,
  );
}
