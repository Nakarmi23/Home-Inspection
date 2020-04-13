import 'package:house_review/models/IBaseModel.dart';
import 'package:house_review/services/sqflite_base_service.dart';

abstract class BaseRepo<T extends SqliteBaseService<I>,
    I extends IBaseModel<I>> {
  T get service;

  Future<void> insert(I data) {
    return service.insert(data);
  }

  Future<List<I>> select({
    List<String> columns,
    String orderBy,
    int limit,
    String where,
    List<String> whereArgs,
  }) {
    return service.select(
        columns: columns,
        orderBy: orderBy,
        limit: limit,
        where: where,
        whereArgs: whereArgs);
  }

  Future<void> delete(int id) {
    return service.delete(id);
  }

  Future<void> update(I data) {
    return service.update(data);
  }

  Future<int> count() {
    return service.count();
  }
}
