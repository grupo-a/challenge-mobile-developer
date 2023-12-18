abstract class CoreDatabaseInterface<T> {
  Future<void> init(String dbName, dynamic adapter);
  Future<void> save({
    required String key,
    required T value,
  });
  Future<void> saveAll({
    required Map<dynamic, T> values,
  });

  Future<T?> get({
    required String key,
  });
  Future<void> delete(String key);
  Future<void> clear();
}
