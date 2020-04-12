import 'package:house_review/models/IStructuralSystem.dart';
import 'package:house_review/services/sqflite_base_service.dart';
import 'package:sqflite/sqflite.dart';

class SqliteStructuralSysService extends SqliteBaseService<IStructuralSystem> {
  @override
  Future<int> count() async {
    final List<Map<String, dynamic>> dataRow =
        await (await db).query(tableName, columns: ['count(*)']);
    return Sqflite.firstIntValue(dataRow);
  }

  @override
  Future<void> delete(int id) async {
    return (await db).delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> insert(IStructuralSystem data) async {
    return (await db).insert(tableName, data.toJson(),
        conflictAlgorithm: ConflictAlgorithm.fail);
  }

  @override
  Future<List<IStructuralSystem>> select({
    List<String> columns,
    String orderBy,
    int limit,
    String where,
    List<String> whereArgs,
  }) async {
    final List<Map<String, dynamic>> dataRow = await (await db).query(
      tableName,
      columns: columns,
      orderBy: orderBy,
      limit: limit,
      where: where,
      whereArgs: whereArgs,
    );
    return dataRow.map((item) => IStructuralSystem().fromJson(item)).toList();
  }

  @override
  String get tableName => 'structural_system';

  @override
  Future<void> update(IStructuralSystem data) async {
    return (await db).update(tableName, data.toJson(),
        where: 'id = ?', whereArgs: [data.id]);
  }
}
