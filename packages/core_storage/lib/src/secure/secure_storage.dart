/// Abstract secure storage for secrets and tokens.
///
/// Implementations should use platform-specific secure storage:
/// - iOS: Keychain
/// - Android: EncryptedSharedPreferences / Keystore
/// - Desktop: OS keyring
/// - Web: Encrypted local storage
abstract class SecureStorage {
  /// Read a value by key. Returns null if not found.
  Future<String?> read(String key);

  /// Write a value.
  Future<void> write(String key, String value);

  /// Delete a value by key.
  Future<void> delete(String key);

  /// Delete all stored values.
  Future<void> deleteAll();

  /// Check if a key exists.
  Future<bool> containsKey(String key);
}

/// In-memory secure storage for testing.
class InMemorySecureStorage extends SecureStorage {
  final Map<String, String> _store = {};

  @override
  Future<String?> read(String key) async => _store[key];

  @override
  Future<void> write(String key, String value) async {
    _store[key] = value;
  }

  @override
  Future<void> delete(String key) async {
    _store.remove(key);
  }

  @override
  Future<void> deleteAll() async {
    _store.clear();
  }

  @override
  Future<bool> containsKey(String key) async => _store.containsKey(key);
}
