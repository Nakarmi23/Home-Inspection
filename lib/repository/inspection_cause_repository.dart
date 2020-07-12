import 'package:house_review/models/insepction_cause.dart';
import 'package:house_review/repository/base_repository.dart';

class InspectionCauseRepository extends BaseRepository<InspectionCause> {
  @override
  String get tableName => 'inspection_cause';
}
