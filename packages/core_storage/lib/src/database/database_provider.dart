/// Abstract database provider for local persistence.
///
/// Concrete implementation will use Drift (SQLite).
/// This abstraction allows swapping storage backends for testing.
abstract class DatabaseProvider {
  /// Initialize the database connection.
  Future<void> initialize();

  /// Close the database connection.
  Future<void> close();

  /// Delete all data (for logout/reset).
  Future<void> deleteAll();
}
