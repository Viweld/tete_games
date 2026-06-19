import 'package:domain/src/models/peer/peer_models.dart';

abstract interface class ProfileRepository {
  /// Broadcast stream of the current player profile; emits after every change.
  Stream<PlayerProfile?> get profileStream;

  /// Last cached profile value; `null` if not loaded yet or absent in storage.
  PlayerProfile? get cachedProfile;

  /// Loads profile from persistent storage into [cachedProfile]. Idempotent.
  Future<void> initialize();

  Future<PlayerProfile?> getCurrentPlayer();

  Future<void> savePlayer(PlayerProfile player);

  Future<bool> isFirstLaunch();

  Future<void> setFirstLaunchCompleted();
}
