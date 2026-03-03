abstract interface class AppDatabase {
  Future<void> initialize();
  Future<void> clearAll();
}
