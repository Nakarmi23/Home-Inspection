import 'package:house_review/models/IInsepctionCause.dart';
import 'package:house_review/services/sqflite_base_service.dart';
import 'package:sqflite/sqflite.dart';

class SqliteInspectionCauseService extends SqliteBaseService<IInspectionCause> {
  @override
  String get tableName => 'inspection_cause';

  @override
  IInspectionCause get model => IInspectionCause();
}
