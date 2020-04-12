import 'package:house_review/models/IInsepctionCause.dart';
import 'package:house_review/services/sqflite_base_service.dart';
import 'package:sqflite/sqflite.dart';

class SqliteInspectionCauseService extends SqliteBaseService<IInspectionCause> {
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
  Future<void> insert(IInspectionCause data) async {
    return (await db).insert(tableName, data.toJson(),
        conflictAlgorithm: ConflictAlgorithm.fail);
  }

  @override
  Future<List<IInspectionCause>> select({
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
    return dataRow.map((item) => IInspectionCause().fromJson(item)).toList();
  }

  @override
  String get tableName => 'inspection_cause';

  @override
  Future<void> update(IInspectionCause data) async {
    return (await db).update(tableName, data.toJson(),
        where: 'id = ?', whereArgs: [data.id]);
  }
}
