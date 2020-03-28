import 'package:house_review/models/IInsepctionCause.dart';
import 'package:house_review/models/IStructuralSystem.dart';
import 'package:house_review/services/sqflite_inspection_cause_service.dart';
import 'package:house_review/services/sqflite_structural_system_service.dart';

class Repository {
  final SqliteStructuralSysService _sqliteStructuralSysService =
      SqliteStructuralSysService();
  final SqliteInspectionCauseService _sqliteInspectionCauseService =
      SqliteInspectionCauseService();

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

  Future<void> insertInspectionCause(IInspectionCause inspectionCause) {
    return _sqliteInspectionCauseService.insert(inspectionCause);
  }

  Future<List<IInspectionCause>> selectInspectionCause({
    List<String> columns,
    String orderBy,
    int limit,
    String where,
    List<String> whereArgs,
  }) {
    return _sqliteInspectionCauseService.select(
        columns: columns,
        orderBy: orderBy,
        limit: limit,
        where: where,
        whereArgs: whereArgs);
  }

  Future<void> deleteInspectionCause(int id) {
    return _sqliteInspectionCauseService.delete(id);
  }

  Future<void> updateInspectionCause(IInspectionCause inspectionCause) {
    return _sqliteInspectionCauseService.update(inspectionCause);
  }

  Future<int> countInspectionCause() {
    return _sqliteInspectionCauseService.count();
  }
}
