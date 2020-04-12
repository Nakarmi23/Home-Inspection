import 'package:house_review/models/IBaseModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class SqliteBaseService<T extends IBaseModel> {
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
            )'''),
            db.execute('''
            CREATE TABLE IF NOT EXISTS room_purpose(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              purpose TEXT,
              is_editable NUMERIC
            )'''),
            db.execute('''
            CREATE TABLE IF NOT EXISTS client_tbl(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT,
              address TEXT
            )
            '''),
          ]);
        },
        // Set the version. This executes the onCreate function and provides a
        // path to perform database upgrades and downgrades.
        version: 2,
      );
  String get tableName;

  Future<void> insert(T data);
  Future<List<T>> select({
    List<String> columns,
    String orderBy,
    int limit,
    String where,
    List<String> whereArgs,
  });
  Future<int> count();
  Future<void> update(T data);
  Future<void> delete(int id);
}
