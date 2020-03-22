import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class SqliteBaseService<T> {
  Future<Database> get db async => openDatabase(
        // Set the path to the database.
        join(await getDatabasesPath(), 'skill_inspection.db'),

        onCreate: (db, version) async {
          return db.execute('''
            CREATE TABLE IF NOT EXISTS structural_system(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              system_name TEXT
            );
          ''');
        },
        // Set the version. This executes the onCreate function and provides a
        // path to perform database upgrades and downgrades.
        version: 1,
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
