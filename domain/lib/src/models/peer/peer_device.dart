final class PeerDevice {
  const PeerDevice({
    required this.id,
    required this.name,
    required this.isOurApp,
  });

  final String id;
  final String name;
  final bool isOurApp;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PeerDevice &&
            other.id == id &&
            other.name == name &&
            other.isOurApp == isOurApp;
  }

  @override
  int get hashCode => Object.hash(id, name, isOurApp);
}
