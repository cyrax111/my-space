/// Core storage abstractions.
///
/// Provides interfaces for local database (SQLite/Drift) and
/// secure storage (tokens, secrets). Implementations are injected
/// at the app level.
library core_storage;

export 'src/database/database_provider.dart';
export 'src/secure/secure_storage.dart';
