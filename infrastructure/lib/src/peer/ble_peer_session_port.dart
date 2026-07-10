import 'package:ble_peer_session/ble_peer_session.dart' as pckg;

/// Testable boundary around [pckg.Peer] for infrastructure repositories.
abstract interface class BlePeerSessionPort {
  Stream<pckg.PeerConnectionInfo?> get connectionStream;

  Stream<pckg.PeerMessage> get messagesStream;

  Stream<pckg.PeerDisconnectInfo> get disconnectStream;

  Future<pckg.PeerHost> createHost();

  Future<pckg.PeerClient> createClient();

  Future<void> dispose();
}

final class BlePeerSessionAdapter implements BlePeerSessionPort {
  BlePeerSessionAdapter(this._peer);

  final pckg.Peer _peer;

  @override
  Stream<pckg.PeerConnectionInfo?> get connectionStream => _peer.connectionStream;

  @override
  Stream<pckg.PeerMessage> get messagesStream => _peer.messagesStream;

  @override
  Stream<pckg.PeerDisconnectInfo> get disconnectStream => _peer.disconnectStream;

  @override
  Future<pckg.PeerHost> createHost() => _peer.createHost();

  @override
  Future<pckg.PeerClient> createClient() => _peer.createClient();

  @override
  Future<void> dispose() => _peer.dispose();
}
