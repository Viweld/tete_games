/// Port for secure key-value storage (tokens, secrets).
abstract interface class SecureDataProvider {
  Future<String?> getValue({required String key});

  Future<void> setValue({required String key, required String value});

  Future<void> deleteValue({required String key});

  Future<void> clearValues();

  Future<bool> containsKey({required String key});
}
