import 'package:house_review/models/IStructuralSystem.dart';
import 'package:house_review/services/sqflite_structural_system_service.dart';

class Repository {
  final SqliteStructuralSysService _sqliteStructuralSysService =
      SqliteStructuralSysService();

  Future<void> insertStructuralSystem(IStructuralSystem structuralSystem) {
    return _sqliteStructuralSysService.insert(structuralSystem);
  }

  Future<List<IStructuralSystem>> selectStructuralSystem({
    List<String> columns,
    String orderBy,
    int limit,
    String where,
    List<String> whereArgs,
  }) {
    return _sqliteStructuralSysService.select(
        columns: columns,
        orderBy: orderBy,
        limit: limit,
        where: where,
        whereArgs: whereArgs);
  }

  Future<void> deleteStructuralSystem(int id) {
    return _sqliteStructuralSysService.delete(id);
  }

  Future<void> updateStructuralSystem(IStructuralSystem structuralSystem) {
    return _sqliteStructuralSysService.update(structuralSystem);
  }

  Future<int> countStructuralSystem() {
    return _sqliteStructuralSysService.count();
  }
}
