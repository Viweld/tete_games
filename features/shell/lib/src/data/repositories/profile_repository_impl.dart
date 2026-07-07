import 'package:core/core.dart';
import 'package:shell/shell_domain.dart';

@LazySingleton(as: ProfileRepository, dispose: disposeProfileRepository)
final class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._localDataProvider);

  final LocalDataProvider _localDataProvider;
  final StreamController<PlayerProfile?> _profileController =
      StreamController<PlayerProfile?>.broadcast();

  PlayerProfile? _cachedProfile;
  bool _isInitialized = false;
  Future<void>? _initializeFuture;

  static const String _playerIdKey = 'peer_player_id';
  static const String _playerNameKey = 'peer_player_name';
  static const String _isFirstLaunchKey = 'peer_is_first_launch';

  @override
  Stream<PlayerProfile?> get profileStream => _profileController.stream;

  @override
  PlayerProfile? get cachedProfile => _cachedProfile;

  @override
  Future<void> initialize() async {
    if (_isInitialized) return;

    _initializeFuture ??= _loadCachedProfile();
    await _initializeFuture;
  }

  @override
  Future<PlayerProfile?> getCurrentPlayer() async {
    await initialize();
    return _cachedProfile;
  }

  @override
  Future<void> savePlayer(PlayerProfile player) async {
    await _localDataProvider.setValue(key: _playerIdKey, value: player.id);
    await _localDataProvider.setValue(key: _playerNameKey, value: player.displayName);
    _cachedProfile = player;
    if (!_profileController.isClosed) {
      _profileController.add(player);
    }
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

  Future<void> _loadCachedProfile() async {
    _cachedProfile = await _loadProfile();
    _isInitialized = true;
    if (!_profileController.isClosed) {
      _profileController.add(_cachedProfile);
    }
  }

  Future<PlayerProfile?> _loadProfile() async {
    final Object? id = await _localDataProvider.getValue(key: _playerIdKey);
    final Object? name = await _localDataProvider.getValue(key: _playerNameKey);

    if (id is! String || name is! String || id.isEmpty || name.isEmpty) {
      return null;
    }

    return PlayerProfile(id: id, displayName: name);
  }

  void dispose() {
    _profileController.close();
  }
}

Future<void> disposeProfileRepository(ProfileRepository repository) async {
  (repository as ProfileRepositoryImpl).dispose();
}
