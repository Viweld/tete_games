import 'package:flutter/foundation.dart';

@immutable
final class PeerPlayerIdentity {
  const PeerPlayerIdentity({required this.id, required this.displayName});

  final String id;
  final String displayName;
}

/// Shell-owned profile exposed to peer runtime without a platform → feature dependency.
abstract interface class PeerPlayerIdentitySource {
  Future<PeerPlayerIdentity?> getCurrentIdentity();
}
