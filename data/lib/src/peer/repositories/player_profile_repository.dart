import 'package:data/src/providers/local/local_providers.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPlayerProfileRepository)
final class PlayerProfileRepository implements IPlayerProfileRepository {
  PlayerProfileRepository(this._localDataProvider);

  final LocalDataProvider _localDataProvider;

  static const String _playerIdKey = 'peer_player_id';
  static const String _playerNameKey = 'peer_player_name';
  static const String _isFirstLaunchKey = 'peer_is_first_launch';

  @override
  Future<PlayerProfile?> getCurrentPlayer() async {
    final Object? id = await _localDataProvider.getValue(key: _playerIdKey);
    final Object? name = await _localDataProvider.getValue(key: _playerNameKey);

    if (id is! String || name is! String || id.isEmpty || name.isEmpty) {
      return null;
    }

    return PlayerProfile(id: id, displayName: name);
  }

  @override
  Future<void> savePlayer(PlayerProfile player) async {
    await _localDataProvider.setValue(key: _playerIdKey, value: player.id);
    await _localDataProvider.setValue(key: _playerNameKey, value: player.displayName);
  }

  @override
  Future<bool> isFirstLaunch() async {
    final Object? value = await _localDataProvider.getValue(key: _isFirstLaunchKey);
    return value != false;
  }

  @override
  Future<void> setFirstLaunchCompleted() async {
    await _localDataProvider.setValue(key: _isFirstLaunchKey, value: false);
  }
}
