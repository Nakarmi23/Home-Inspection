import 'package:house_review/models/IRoomPurpose.dart';
import 'package:house_review/services/sqflite_base_service.dart';
import 'package:sqflite/sqflite.dart';

class SqliteRoomPurposeService extends SqliteBaseService<IRoomPurpose> {
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
  Future<void> insert(IRoomPurpose data) async {
    return (await db).insert(tableName, data.toJson(),
        conflictAlgorithm: ConflictAlgorithm.fail);
  }

  @override
  Future<List<IRoomPurpose>> select(
      {List<String> columns,
      String orderBy,
      int limit,
      String where,
      List<String> whereArgs}) async {
    final List<Map<String, dynamic>> dataRow = await (await db).query(
      tableName,
      columns: columns,
      orderBy: orderBy,
      limit: limit,
      where: where,
      whereArgs: whereArgs,
    );
    return dataRow.map((item) => IRoomPurpose.fromJson(item)).toList();
  }

  @override
  // TODO: implement tableName
  String get tableName => 'room_purpose';

  @override
  Future<void> update(IRoomPurpose data) async {
    return (await db).update(tableName, data.toJson(),
        where: 'id = ?', whereArgs: [data.id]);
  }
}
