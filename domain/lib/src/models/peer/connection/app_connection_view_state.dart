import 'package:domain/src/models/peer/connection/peer_session_close.dart';
import 'package:domain/src/models/peer/connection/peer_session_core_phase.dart';
import 'package:domain/src/models/peer/peer_device.dart';
import 'package:domain/src/models/peer/peer_endpoint.dart';
import 'package:domain/src/models/peer/peer_role.dart';
import 'package:flutter/foundation.dart';

@immutable
enum OverlayPhase {
  hidden,
  roleSelection,
  hostAdvertising,
  hostInvitationDecision,
  clientDiscovering,
  clientInviting,
  clientInvitationRejected,
  error,
}

@immutable
final class SharedConnectionViewState {
  final bool isConnected;
  final String? remoteDisplayName;
  final String? remotePlayerId;

  const SharedConnectionViewState({
    this.isConnected = false,
    this.remoteDisplayName,
    this.remotePlayerId,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SharedConnectionViewState &&
            other.isConnected == isConnected &&
            other.remoteDisplayName == remoteDisplayName &&
            other.remotePlayerId == remotePlayerId;
  }

  @override
  int get hashCode => Object.hash(isConnected, remoteDisplayName, remotePlayerId);
}

@immutable
final class HomeRenderViewState {
  final bool isGamesEnabled;

  const HomeRenderViewState({this.isGamesEnabled = false});

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is HomeRenderViewState && other.isGamesEnabled == isGamesEnabled;
  }

  @override
  int get hashCode => isGamesEnabled.hashCode;
}

@immutable
final class OverlayRenderViewState {
  final OverlayPhase phase;
  final PeerRole? role;
  final List<PeerDevice> devices;
  final PeerEndpoint? pendingInvitation;
  final bool isBusy;
  final PeerSessionErrorKind? errorKind;

  const OverlayRenderViewState({
    this.phase = OverlayPhase.hidden,
    this.role,
    this.devices = const <PeerDevice>[],
    this.pendingInvitation,
    this.isBusy = false,
    this.errorKind,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is OverlayRenderViewState &&
            other.phase == phase &&
            other.role == role &&
            listEquals(other.devices, devices) &&
            other.pendingInvitation == pendingInvitation &&
            other.isBusy == isBusy &&
            other.errorKind == errorKind;
  }

  @override
  int get hashCode =>
      Object.hash(phase, role, Object.hashAll(devices), pendingInvitation, isBusy, errorKind);
}

@immutable
final class AppConnectionViewState {
  const AppConnectionViewState({required this.shared, required this.home, required this.overlay});

  final SharedConnectionViewState shared;
  final HomeRenderViewState home;
  final OverlayRenderViewState overlay;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is AppConnectionViewState &&
            other.shared == shared &&
            other.home == home &&
            other.overlay == overlay;
  }

  @override
  int get hashCode => Object.hash(shared, home, overlay);
}

OverlayPhase overlayPhaseFromCore(PeerSessionCorePhase phase) {
  return switch (phase) {
    PeerSessionCorePhase.idle => OverlayPhase.hidden,
    PeerSessionCorePhase.roleSelection => OverlayPhase.roleSelection,
    PeerSessionCorePhase.hostAdvertising => OverlayPhase.hostAdvertising,
    PeerSessionCorePhase.hostInvitationDecision => OverlayPhase.hostInvitationDecision,
    PeerSessionCorePhase.clientDiscovering => OverlayPhase.clientDiscovering,
    PeerSessionCorePhase.clientInviting => OverlayPhase.clientInviting,
    PeerSessionCorePhase.connected => OverlayPhase.hidden,
    PeerSessionCorePhase.error => OverlayPhase.error,
  };
}
