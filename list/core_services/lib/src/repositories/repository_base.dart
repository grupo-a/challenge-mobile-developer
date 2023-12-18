import 'package:hive/hive.dart';
import '../database/db.hive.dart';
import '../database/tables.enum.dart';
import '../models/model_base.dart';

abstract class RepositoryBase<T extends ModelBase> {
  final String table;
  CollectionBox<Map<dynamic, dynamic>>? _box;
  T Function(Map<String, dynamic> json) constructor;

  Future<CollectionBox<Map<dynamic, dynamic>>> getBox() async {
    _box ??= await DB.openBox(table);
    return _box as CollectionBox<Map<dynamic, dynamic>>;
  }

  RepositoryBase({required Tables tableName, required this.constructor})
      : table = tableName.name;

  Future<T?> get(int id) async {
    var box = await getBox();
    var item = await box.get(id.toString());

    if (item == null) return null;

    return constructor(item.cast<String, dynamic>());
  }

  Future<List<T>> find(bool Function(T) expression) async {
    var box = await getBox();
    var allValues = await box.getAllValues();

    exp(value) {
      return expression(constructor(value.cast<String, dynamic>()));
    }

    var listFound = allValues.values.where(exp);
    var l2 = listFound.map((e) => constructor(e.cast<String, dynamic>()));
    return l2.toList();
  }

  Future<void> save(T entity) async {
    var box = await getBox();
    if (entity.id == null || entity.id == 0) {
      throw Exception("Id inválido para inserção.");
    }

    await box.put(entity.id.toString(), entity.toJson());
  }

  Future<void> delete(int id) async {
    var box = await getBox();
    if (id == 0) {
      throw Exception("Id inválido para deleção.");
    }

    await box.delete(id.toString());
  }
}
