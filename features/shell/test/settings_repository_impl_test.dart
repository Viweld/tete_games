import 'package:core/src/ports/local_data_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shell/src/data/repositories/settings_repository_impl.dart';

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
  group('SettingsRepositoryImpl', () {
    late InMemoryLocalDataProvider localDataProvider;
    late SettingsRepositoryImpl repository;

    setUp(() {
      localDataProvider = InMemoryLocalDataProvider();
      repository = SettingsRepositoryImpl(localDataProvider);
    });

    test('getSavedLanguageCode returns null when absent', () async {
      expect(await repository.getSavedLanguageCode(), isNull);
    });

    test('saveLanguageCode persists language code', () async {
      await repository.saveLanguageCode('ru');

      expect(await repository.getSavedLanguageCode(), 'ru');
    });

    test('getSavedLanguageCode ignores non-string values', () async {
      await localDataProvider.setValue(key: 'language_code', value: 42);

      expect(await repository.getSavedLanguageCode(), isNull);
    });
  });
}
