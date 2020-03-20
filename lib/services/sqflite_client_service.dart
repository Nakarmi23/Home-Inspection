import 'package:house_review/models/IClient.dart';
import 'package:house_review/services/sqflite_base_service.dart';
import 'package:sqflite/sqflite.dart';

class SqliteClientService extends SqliteBaseService<IClient> {
  @override
  String get tableName => 'client';

  @override
  Future<int> count() async {
    final List<Map<String, dynamic>> dataRow =
        await (await db).query(tableName, columns: ['count(1)']);
    return Sqflite.firstIntValue(dataRow);
  }

  @override
  Future<void> delete(int id) async {
    return (await db).delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<void> insert(IClient data) async {
    return (await db).insert(tableName, data.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<List<IClient>> select({List<String> columns}) async {
    final List<Map<String, List>> dataRow = await (await db).query(
      tableName,
      columns: columns,
    );
    return dataRow.map((item) => IClient.fromJSON(item)).toList();
  }

  @override
  Future<void> update({IClient data}) async {
    Map<String, dynamic> jsonData = data.toJson();
    return (await db)
        .update(tableName, jsonData, where: "id = ?", whereArgs: [data.id]);
  }
}
