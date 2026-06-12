final class PlayerProfile {
  const PlayerProfile({
    required this.id,
    required this.displayName,
  });

  final String id;
  final String displayName;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PlayerProfile && other.id == id && other.displayName == displayName;
  }

  @override
  int get hashCode => Object.hash(id, displayName);
}
