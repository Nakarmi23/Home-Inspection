import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class SqliteBaseService<T> {
  Future<Database> get db async => openDatabase(
        // Set the path to the database.
        join(await getDatabasesPath(), 'collection_app.db'),
        onCreate: (db, version) {
          return db.execute(
            '''CREATE TABLE IF NOT EXISTS client (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name VARCHAR(255),
                address VARCHAR(255),
                contact VARCHAR(50),
            )''',
          );
        },
        // Set the version. This executes the onCreate function and provides a
        // path to perform database upgrades and downgrades.
        version: 1,
      );
  String get tableName;

  Future<void> insert(T data);
  Future<List<T>> select();
  Future<int> count();
  Future<void> update();
  Future<void> delete(int id);
}
