abstract interface class PeerServerSessionRepository {
  Future<void> startAdvertising();

  Future<void> acceptInvitation();

  Future<void> rejectInvitation();

  Future<void> stopAdvertising();

  Future<void> disconnectSession();

  /// Disconnects the host role and drops the cached session so the next start
  /// re-initializes BLE transport (required before switching to client).
  Future<void> releaseSession();
}
