import 'package:house_review/models/IClient.dart';
import 'package:house_review/services/sqflite_base_service.dart';

class SqliteClientService extends SqliteBaseService<IClient> {
  @override
  // TODO: implement tableName
  String get tableName => 'client';

  @override
  Future<int> count() {
    // TODO: implement count
    return null;
  }

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    return null;
  }

  @override
  Future<void> insert(data) {
    // TODO: implement insert
    return null;
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
  Future<void> update() {
    // TODO: implement update
    return null;
  }
}
