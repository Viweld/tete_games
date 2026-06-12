part of 'secure_providers.dart';

@LazySingleton(as: SecureDataProvider)
final class SecureDataProviderImpl implements SecureDataProvider {
  SecureDataProviderImpl()
    : _secureStorage = const FlutterSecureStorage(
        iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock_this_device),
      );

  final FlutterSecureStorage _secureStorage;

  @override
  Future<String?> getValue({required String key}) async {
    return _secureStorage.read(key: key);
  }

  @override
  Future<void> setValue({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<void> deleteValue({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  @override
  Future<void> clearValues() async {
    await _secureStorage.deleteAll();
  }

  @override
  Future<bool> containsKey({required String key}) async {
    return _secureStorage.containsKey(key: key);
  }
}
