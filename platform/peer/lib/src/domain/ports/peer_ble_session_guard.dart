/// Keeps the OS from suspending an active BLE peer session (platform-specific).
abstract interface class PeerBleSessionGuard {
  Future<void> activate();

  Future<void> deactivate();
}
