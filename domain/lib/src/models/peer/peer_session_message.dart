import 'package:domain/src/models/peer/peer_endpoint.dart';

sealed class PeerSessionMessage {
  const PeerSessionMessage();
}

final class PeerInvitation extends PeerSessionMessage {
  const PeerInvitation({required this.remoteEndpoint});

  final PeerEndpoint remoteEndpoint;
}

final class PeerAcceptance extends PeerSessionMessage {
  const PeerAcceptance({required this.remoteEndpoint});

  final PeerEndpoint remoteEndpoint;
}

final class PeerRejection extends PeerSessionMessage {
  const PeerRejection({required this.remoteEndpoint});

  final PeerEndpoint remoteEndpoint;
}

final class PeerDisconnection extends PeerSessionMessage {
  const PeerDisconnection({required this.remoteEndpoint});

  final PeerEndpoint remoteEndpoint;
}
