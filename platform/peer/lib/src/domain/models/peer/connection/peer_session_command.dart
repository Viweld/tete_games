import 'package:flutter/foundation.dart';
import 'package:peer/src/domain/models/peer/connection/peer_disconnect_reason.dart';
import 'package:peer/src/domain/models/peer/connection/peer_session_close.dart';
import 'package:peer/src/domain/models/peer/peer_device.dart';
import 'package:peer/src/domain/models/peer/peer_endpoint.dart';

@immutable
sealed class PeerSessionCommand {
  const PeerSessionCommand();
}

@immutable
final class CmdOpenRoleSelection extends PeerSessionCommand {
  const CmdOpenRoleSelection();
}

@immutable
final class CmdStartHostSession extends PeerSessionCommand {
  const CmdStartHostSession({required this.sessionId});

  final String sessionId;
}

@immutable
final class CmdStartClientSession extends PeerSessionCommand {
  const CmdStartClientSession({required this.sessionId});

  final String sessionId;
}

@immutable
final class CmdAcceptInvitation extends PeerSessionCommand {
  const CmdAcceptInvitation();
}

@immutable
final class CmdRejectInvitation extends PeerSessionCommand {
  const CmdRejectInvitation();
}

@immutable
final class CmdInviteDevice extends PeerSessionCommand {
  const CmdInviteDevice({required this.deviceId});

  final String deviceId;
}

@immutable
final class CmdCloseSession extends PeerSessionCommand {
  const CmdCloseSession({required this.origin, required this.reason});

  final PeerSessionCloseOrigin origin;
  final PeerSessionCloseReason reason;
}

@immutable
final class CmdDiscoveryUpdated extends PeerSessionCommand {
  const CmdDiscoveryUpdated({required this.devices});

  final List<PeerDevice> devices;
}

@immutable
final class CmdInvitationReceived extends PeerSessionCommand {
  const CmdInvitationReceived({required this.remoteEndpoint});

  final PeerEndpoint remoteEndpoint;
}

@immutable
final class CmdInvitationAccepted extends PeerSessionCommand {
  const CmdInvitationAccepted();
}

@immutable
final class CmdInvitationRejected extends PeerSessionCommand {
  const CmdInvitationRejected();
}

@immutable
final class CmdTransportConnected extends PeerSessionCommand {
  const CmdTransportConnected({required this.remoteEndpoint});

  final PeerEndpoint remoteEndpoint;
}

@immutable
final class CmdTransportDisconnected extends PeerSessionCommand {
  const CmdTransportDisconnected({required this.reason});

  final PeerDisconnectReason reason;
}

@immutable
final class CmdBleError extends PeerSessionCommand {
  const CmdBleError({required this.errorKind});

  final PeerSessionErrorKind errorKind;
}
