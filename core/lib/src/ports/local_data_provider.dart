/// Port for non-sensitive local key-value storage.
abstract interface class LocalDataProvider {
  Future<Object?> getValue({required String key});

  Future<void> setValue({required String key, required Object value});

  Future<void> deleteValue({required String key});

  Future<void> clearValues();
}
