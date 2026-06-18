import 'package:domain/src/models/peer/peer_models.dart';

abstract interface class ProfileRepository {
  /// Broadcast stream of the current player profile; emits after every change.
  Stream<PlayerProfile?> get profileStream;

  Future<PlayerProfile?> getCurrentPlayer();

  Future<void> savePlayer(PlayerProfile player);

  Future<bool> isFirstLaunch();

  Future<void> setFirstLaunchCompleted();
}
