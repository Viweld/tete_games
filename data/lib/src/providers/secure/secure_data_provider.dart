part of 'secure_providers.dart';

/// An abstract interface for secure data providers.
/// Used for storing sensitive data like tokens.
abstract interface class SecureDataProvider {
  /// Retrieves a value associated with the given [key].
  Future<String?> getValue({required String key});

  /// Sets a value for the given [key].
  Future<void> setValue({required String key, required String value});

  /// Deletes the value associated with the given [key].
  Future<void> deleteValue({required String key});

  /// Clears all stored values.
  Future<void> clearValues();

  /// Checks if a value exists for the given [key].
  Future<bool> containsKey({required String key});
}
