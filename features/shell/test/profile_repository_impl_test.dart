import 'package:core/src/ports/local_data_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shell/src/data/repositories/profile_repository_impl.dart';
import 'package:shell/src/domain/models/player_profile.dart';

final class InMemoryLocalDataProvider implements LocalDataProvider {
  final Map<String, Object> _store = <String, Object>{};

  @override
  Future<Object?> getValue({required String key}) async => _store[key];

  @override
  Future<void> setValue({required String key, required Object value}) async {
    _store[key] = value;
  }

  @override
  Future<void> deleteValue({required String key}) async => _store.remove(key);

  @override
  Future<void> clearValues() async => _store.clear();
}

void main() {
  group('ProfileRepositoryImpl', () {
    late InMemoryLocalDataProvider localDataProvider;
    late ProfileRepositoryImpl repository;

    setUp(() {
      localDataProvider = InMemoryLocalDataProvider();
      repository = ProfileRepositoryImpl(localDataProvider);
    });

    tearDown(() => repository.dispose());

    test('initialize loads cached profile from storage', () async {
      await localDataProvider.setValue(key: 'peer_player_id', value: 'id-1');
      await localDataProvider.setValue(key: 'peer_player_name', value: 'Player');

      await repository.initialize();

      expect(repository.cachedProfile, const PlayerProfile(id: 'id-1', displayName: 'Player'));
    });

    test('initialize is idempotent', () async {
      await localDataProvider.setValue(key: 'peer_player_id', value: 'id-1');
      await localDataProvider.setValue(key: 'peer_player_name', value: 'Player');

      await repository.initialize();
      await localDataProvider.setValue(key: 'peer_player_name', value: 'Changed');
      await repository.initialize();

      expect(repository.cachedProfile?.displayName, 'Player');
    });

    test('savePlayer updates cache and profile stream', () async {
      const PlayerProfile profile = PlayerProfile(id: 'id-2', displayName: 'Neo');

      final Future<void> profileExpectation = expectLater(repository.profileStream, emits(profile));

      await repository.savePlayer(profile);

      await profileExpectation;

      expect(repository.cachedProfile, profile);
    });

    test('isFirstLaunch returns true when flag is absent or not false', () async {
      expect(await repository.isFirstLaunch(), isTrue);

      await localDataProvider.setValue(key: 'peer_is_first_launch', value: true);
      expect(await repository.isFirstLaunch(), isTrue);
    });

    test('isFirstLaunch returns false after first launch completed', () async {
      await repository.setFirstLaunchCompleted();

      expect(await repository.isFirstLaunch(), isFalse);
    });

    test('returns null profile when storage is incomplete', () async {
      await localDataProvider.setValue(key: 'peer_player_id', value: '');

      await repository.initialize();

      expect(repository.cachedProfile, isNull);
    });
  });
}
