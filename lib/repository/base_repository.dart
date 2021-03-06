import 'package:house_review/models/base_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class BaseRepository<T extends BaseModel> {
  Future<Database> get db async => openDatabase(
        // Set the path to the database.
        join(await getDatabasesPath(), 'skill_inspection.db'),
        onCreate: (db, version) {
          return Future.wait([
            db.execute('''
            CREATE TABLE IF NOT EXISTS inspection_cause(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              inspectionCause TEXT,
              isEditable NUMERIC
            );'''),
            db.execute('''
            CREATE TABLE IF NOT EXISTS structural_system(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              systemName TEXT,
              isEditable NUMERIC
            );'''),
            db.execute('''
            CREATE TABLE IF NOT EXISTS room_purpose(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              purpose TEXT,
              isEditable NUMERIC
            );'''),
            db.execute('''
            CREATE TABLE IF NOT EXISTS inspection_file_info(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT,
              address TEXT,
              fileName TEXT,
              path TEXT
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

  Future<List<Map<String, dynamic>>> select({
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
    return dataRow;
  }

  Future<int> count() async {
    final List<Map<String, dynamic>> dataRow =
        await (await db).query(tableName, columns: ['count(*)']);
    return Sqflite.firstIntValue(dataRow);
  }

  Future<void> update(T data, int id) async {
    return (await db)
        .update(tableName, data.toJson(), where: 'id = ?', whereArgs: [id]);
  }

  Future<void> delete(int id) async {
    return (await db).delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
