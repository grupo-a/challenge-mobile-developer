import 'package:hive_flutter/hive_flutter.dart';

import 'core_database_interface.dart';

class HiveDatabase<T> implements CoreDatabaseInterface<T> {
  late final Box<T> box;

  @override
  Future<void> init(String dbName, dynamic typeAdapter) async {
    await Hive.initFlutter();
    box = await Hive.openBox(dbName);
    Hive.registerAdapter(typeAdapter);
  }

  @override
  Future<void> save({
    required String key,
    required T value,
  }) async {
    await box.put(key, value);
  }

  @override
  Future<void> saveAll({
    required Map<dynamic, T> values,
  }) async {
    await box.putAll(values);
  }

  @override
  Future<T?> get({
    required String key,
  }) async {
    return box.get(key);
  }

  @override
  Future<void> delete(String key) {
    return box.delete(key);
  }

  @override
  Future<void> clear() {
    return box.clear();
  }
}
