part of 'local_providers.dart';

/// An abstract interface for local data providers.
abstract interface class LocalDataProvider {
  /// Retrieves a value associated with the given [key].
  Future<Object?> getValue({required String key});

  /// Sets a value for the given [key].
  Future<void> setValue({required String key, required Object value});

  /// Deletes the value associated with the given [key].
  Future<void> deleteValue({required String key});

  /// Clears all stored values.
  Future<void> clearValues();
}
