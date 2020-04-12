import 'package:house_review/models/IInsepctionCause.dart';
import 'package:house_review/resources/base_repo.dart';
import 'package:house_review/services/sqflite_inspection_cause_service.dart';

class InspectionCauseRepo
    extends BaseRepo<SqliteInspectionCauseService, IInspectionCause> {
  @override
  SqliteInspectionCauseService get service => SqliteInspectionCauseService();
}
