import 'package:domain/src/models/peer/peer_endpoint.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class PeerSessionMessage {
  const PeerSessionMessage();
}

@immutable
final class PeerInvitation extends PeerSessionMessage {
  const PeerInvitation({required this.remoteEndpoint});

  final PeerEndpoint remoteEndpoint;
}

@immutable
final class PeerAcceptance extends PeerSessionMessage {
  const PeerAcceptance({required this.remoteEndpoint});

  final PeerEndpoint remoteEndpoint;
}

@immutable
final class PeerRejection extends PeerSessionMessage {
  const PeerRejection({required this.remoteEndpoint});

  final PeerEndpoint remoteEndpoint;
}

@immutable
final class PeerDisconnection extends PeerSessionMessage {
  const PeerDisconnection({required this.remoteEndpoint});

  final PeerEndpoint remoteEndpoint;
}
