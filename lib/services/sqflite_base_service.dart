import 'package:house_review/models/IBaseModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class SqliteBaseService<T extends IBaseModel<T>> {
  T get model;

  Future<Database> get db async => openDatabase(
        // Set the path to the database.
        join(await getDatabasesPath(), 'skill_inspection.db'),
        onCreate: (db, version) {
          return Future.wait([
            db.execute('''
            CREATE TABLE IF NOT EXISTS inspection_cause(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              inspection_cause TEXT,
              is_editable NUMERIC
            );
          '''),
            db.execute('''
            CREATE TABLE IF NOT EXISTS structural_system(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              system_name TEXT,
              is_editable NUMERIC
            );'''),
            db.execute('''
            CREATE TABLE IF NOT EXISTS room_purpose(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              purpose TEXT,
              is_editable NUMERIC
            );'''),
            db.execute('''
            CREATE TABLE IF NOT EXISTS client_tbl(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT,
              address TEXT,
              date_of_inspection TEXT
            );'''),
          ]);
        },
        // Set the version. This executes the onCreate function and provides a
        // path to perform database upgrades and downgrades.
        version: 2,
      );
  String get tableName;

  Future<void> insert(T data) async {
    return (await db).insert(tableName, data.toJson(),
        conflictAlgorithm: ConflictAlgorithm.fail);
  }

  Future<List<T>> select({
    List<String> columns,
    String orderBy,
    int limit,
    String where,
    List<String> whereArgs,
    int offset,
  }) async {
    final List<Map<String, dynamic>> dataRow = await (await db).query(
      tableName,
      columns: columns,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
      where: where,
      whereArgs: whereArgs,
    );
    return dataRow.map((item) => model.fromJson(item)).toList();
  }

  Future<int> count() async {
    final List<Map<String, dynamic>> dataRow =
        await (await db).query(tableName, columns: ['count(*)']);
    return Sqflite.firstIntValue(dataRow);
  }

  Future<void> update(T data) async {
    return (await db).update(tableName, data.toJson(),
        where: 'id = ?', whereArgs: [data.id]);
  }

  Future<void> delete(int id) async {
    return (await db).delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
