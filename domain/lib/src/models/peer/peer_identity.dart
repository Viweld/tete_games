final class PeerIdentity {
  const PeerIdentity({
    required this.id,
    required this.displayName,
  });

  final String id;
  final String displayName;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PeerIdentity && other.id == id && other.displayName == displayName;
  }

  @override
  int get hashCode => Object.hash(id, displayName);
}
