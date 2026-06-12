import 'package:domain/src/models/peer/peer_endpoint.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class PeerConnectionState {
  const PeerConnectionState();
}

@immutable
final class PeerDisconnected extends PeerConnectionState {
  const PeerDisconnected();
}

@immutable
final class PeerConnecting extends PeerConnectionState {
  const PeerConnecting();
}

@immutable
final class PeerConnected extends PeerConnectionState {
  const PeerConnected({required this.remoteEndpoint});

  final PeerEndpoint remoteEndpoint;
}

@immutable
final class PeerConnectionError extends PeerConnectionState {
  const PeerConnectionError({required this.message});

  final String message;
}
