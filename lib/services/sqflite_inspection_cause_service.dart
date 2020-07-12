import 'package:house_review/models/insepction_cause.dart';
import 'package:house_review/services/sqflite_base_service.dart';

class SqliteInspectionCauseService extends SqliteBaseService<InspectionCause> {
  @override
  String get tableName => 'inspection_cause';
}
