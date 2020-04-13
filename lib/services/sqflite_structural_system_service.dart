import 'package:house_review/models/IStructuralSystem.dart';
import 'package:house_review/services/sqflite_base_service.dart';
import 'package:sqflite/sqflite.dart';

class SqliteStructuralSysService extends SqliteBaseService<IStructuralSystem> {
  @override
  String get tableName => 'structural_system';

  @override
  IStructuralSystem get model => IStructuralSystem();
}
