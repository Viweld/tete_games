import 'package:domain/src/models/peer/connection/peer_disconnect_reason.dart';
import 'package:domain/src/models/peer/connection/peer_session_close.dart';
import 'package:domain/src/models/peer/connection/peer_session_command.dart';
import 'package:domain/src/models/peer/connection/peer_session_core_phase.dart';
import 'package:domain/src/models/peer/connection/peer_session_snapshot.dart';
import 'package:domain/src/models/peer/connection/peer_toast_kind.dart';
import 'package:domain/src/models/peer/peer_device.dart';
import 'package:domain/src/models/peer/peer_endpoint.dart';
import 'package:domain/src/models/peer/peer_role.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class RawPeerUiEvent {
  const RawPeerUiEvent();
}

@immutable
final class RawCloseOverlayEvent extends RawPeerUiEvent {
  const RawCloseOverlayEvent();
}

@immutable
final class RawShowToastEvent extends RawPeerUiEvent {
  const RawShowToastEvent(this.kind);

  final PeerToastKind kind;
}

@immutable
typedef ReduceResult = ({PeerSessionSnapshot next, List<RawPeerUiEvent> rawEvents});

ReduceResult reduce({required PeerSessionSnapshot prev, required PeerSessionCommand command}) {
  return switch (command) {
    CmdOpenRoleSelection() => _openRoleSelection(prev),
    CmdStartHostSession(:final sessionId) => _startHost(sessionId),
    CmdStartClientSession(:final sessionId) => _startClient(sessionId),
    CmdAcceptInvitation() => _acceptInvitation(prev),
    CmdRejectInvitation() => _rejectInvitation(prev),
    CmdInviteDevice(:final deviceId) => _inviteDevice(prev, deviceId),
    CmdCloseSession(:final reason) => _closeSession(prev, reason),
    CmdDiscoveryUpdated(:final devices) => _discoveryUpdated(prev, devices),
    CmdInvitationReceived(:final remoteEndpoint) => _invitationReceived(prev, remoteEndpoint),
    CmdInvitationAccepted() => (next: prev, rawEvents: const <RawPeerUiEvent>[]),
    CmdInvitationRejected() => _invitationRejected(prev),
    CmdTransportConnected(:final remoteEndpoint) => _transportConnected(prev, remoteEndpoint),
    CmdTransportDisconnected(:final reason) => _transportDisconnected(prev, reason),
    CmdBleError(:final errorKind) => _bleError(prev, errorKind),
  };
}

ReduceResult _openRoleSelection(PeerSessionSnapshot prev) {
  if (prev.isConnected) {
    return (next: prev, rawEvents: const <RawPeerUiEvent>[]);
  }

  return (
    next: prev.copyWith(phase: PeerSessionCorePhase.roleSelection, clearErrorKind: true),
    rawEvents: const <RawPeerUiEvent>[],
  );
}

ReduceResult _startHost(String sessionId) {
  return (
    next: PeerSessionSnapshot(
      sessionId: sessionId,
      phase: PeerSessionCorePhase.hostAdvertising,
      role: PeerRole.server,
    ),
    rawEvents: const <RawPeerUiEvent>[],
  );
}

ReduceResult _startClient(String sessionId) {
  return (
    next: PeerSessionSnapshot(
      sessionId: sessionId,
      phase: PeerSessionCorePhase.clientDiscovering,
      role: PeerRole.client,
    ),
    rawEvents: const <RawPeerUiEvent>[],
  );
}

ReduceResult _acceptInvitation(PeerSessionSnapshot prev) {
  if (prev.phase != PeerSessionCorePhase.hostInvitationDecision) {
    return (next: prev, rawEvents: const <RawPeerUiEvent>[]);
  }

  return (
    next: prev.copyWith(phase: PeerSessionCorePhase.hostAdvertising, clearPendingInvitation: true),
    rawEvents: const <RawPeerUiEvent>[],
  );
}

ReduceResult _rejectInvitation(PeerSessionSnapshot prev) {
  if (prev.phase != PeerSessionCorePhase.hostInvitationDecision) {
    return (next: prev, rawEvents: const <RawPeerUiEvent>[]);
  }

  return (
    next: prev.copyWith(phase: PeerSessionCorePhase.hostAdvertising, clearPendingInvitation: true),
    rawEvents: const <RawPeerUiEvent>[],
  );
}

ReduceResult _inviteDevice(PeerSessionSnapshot prev, String deviceId) {
  if (prev.phase != PeerSessionCorePhase.clientDiscovering) {
    return (next: prev, rawEvents: const <RawPeerUiEvent>[]);
  }

  final bool deviceExists = prev.discoveredDevices.any((PeerDevice d) => d.id == deviceId);
  if (!deviceExists) {
    return (next: prev, rawEvents: const <RawPeerUiEvent>[]);
  }

  return (
    next: prev.copyWith(phase: PeerSessionCorePhase.clientInviting, invitedDeviceId: deviceId),
    rawEvents: const <RawPeerUiEvent>[],
  );
}

ReduceResult _closeSession(PeerSessionSnapshot prev, PeerSessionCloseReason reason) {
  if (prev.phase == PeerSessionCorePhase.connected &&
      reason == PeerSessionCloseReason.userDismissedOverlay) {
    return (next: prev, rawEvents: const <RawPeerUiEvent>[RawCloseOverlayEvent()]);
  }

  return (
    next: const PeerSessionSnapshot(),
    rawEvents: const <RawPeerUiEvent>[RawCloseOverlayEvent()],
  );
}

ReduceResult _discoveryUpdated(PeerSessionSnapshot prev, List<PeerDevice> devices) {
  if (prev.phase != PeerSessionCorePhase.clientDiscovering &&
      prev.phase != PeerSessionCorePhase.clientInviting) {
    return (next: prev, rawEvents: const <RawPeerUiEvent>[]);
  }

  return (next: prev.copyWith(discoveredDevices: devices), rawEvents: const <RawPeerUiEvent>[]);
}

ReduceResult _invitationReceived(PeerSessionSnapshot prev, PeerEndpoint remoteEndpoint) {
  if (prev.phase != PeerSessionCorePhase.hostAdvertising) {
    return (next: prev, rawEvents: const <RawPeerUiEvent>[]);
  }

  return (
    next: prev.copyWith(
      phase: PeerSessionCorePhase.hostInvitationDecision,
      pendingInvitation: remoteEndpoint,
    ),
    rawEvents: const <RawPeerUiEvent>[],
  );
}

ReduceResult _invitationRejected(PeerSessionSnapshot prev) {
  if (prev.phase != PeerSessionCorePhase.clientInviting) {
    return (next: prev, rawEvents: const <RawPeerUiEvent>[]);
  }

  return (
    next: prev.copyWith(phase: PeerSessionCorePhase.clientDiscovering, clearInvitedDeviceId: true),
    rawEvents: const <RawPeerUiEvent>[RawShowToastEvent(PeerToastKind.invitationRejected)],
  );
}

ReduceResult _transportConnected(PeerSessionSnapshot prev, PeerEndpoint remoteEndpoint) {
  return (
    next: prev.copyWith(
      phase: PeerSessionCorePhase.connected,
      remoteEndpoint: remoteEndpoint,
      clearPendingInvitation: true,
      clearInvitedDeviceId: true,
      clearErrorKind: true,
    ),
    rawEvents: const <RawPeerUiEvent>[RawCloseOverlayEvent()],
  );
}

ReduceResult _transportDisconnected(PeerSessionSnapshot prev, PeerDisconnectReason reason) {
  if (prev.phase != PeerSessionCorePhase.connected) {
    return (next: prev, rawEvents: const <RawPeerUiEvent>[]);
  }

  final PeerToastKind? toastKind = switch (reason) {
    PeerDisconnectReason.userDisconnect => null,
    PeerDisconnectReason.peerDisconnect => PeerToastKind.peerDisconnected,
    PeerDisconnectReason.linkLost => PeerToastKind.linkLost,
    PeerDisconnectReason.timeout => PeerToastKind.timeout,
  };

  return (
    next: const PeerSessionSnapshot(),
    rawEvents: <RawPeerUiEvent>[
      if (toastKind != null) RawShowToastEvent(toastKind),
      const RawCloseOverlayEvent(),
    ],
  );
}

ReduceResult _bleError(PeerSessionSnapshot prev, PeerSessionErrorKind errorKind) {
  final PeerToastKind toastKind = switch (errorKind) {
    PeerSessionErrorKind.bluetoothUnavailable => PeerToastKind.bluetoothUnavailable,
    PeerSessionErrorKind.discoveryFailed => PeerToastKind.discoveryFailed,
    PeerSessionErrorKind.connectionFailed => PeerToastKind.connectionFailed,
    PeerSessionErrorKind.generic => PeerToastKind.genericError,
  };

  return (
    next: prev.copyWith(phase: PeerSessionCorePhase.error, errorKind: errorKind),
    rawEvents: <RawPeerUiEvent>[RawShowToastEvent(toastKind)],
  );
}
