import 'package:domain/src/models/peer/peer_endpoint.dart';

sealed class PeerConnectionState {
  const PeerConnectionState();
}

final class PeerDisconnected extends PeerConnectionState {
  const PeerDisconnected();
}

final class PeerConnecting extends PeerConnectionState {
  const PeerConnecting();
}

final class PeerConnected extends PeerConnectionState {
  const PeerConnected({required this.remoteEndpoint});

  final PeerEndpoint remoteEndpoint;
}

final class PeerConnectionError extends PeerConnectionState {
  const PeerConnectionError({required this.message});

  final String message;
}
