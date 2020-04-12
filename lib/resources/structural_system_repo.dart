import 'package:house_review/models/IStructuralSystem.dart';
import 'package:house_review/resources/base_repo.dart';
import 'package:house_review/services/sqflite_structural_system_service.dart';

class StructuralSystemRepo
    extends BaseRepo<SqliteStructuralSysService, IStructuralSystem> {
  @override
  SqliteStructuralSysService get service => SqliteStructuralSysService();
}
