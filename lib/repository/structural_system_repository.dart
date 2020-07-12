import 'package:house_review/models/structural_system.dart';
import 'package:house_review/repository/base_repository.dart';

class StructuralSysRepository extends BaseRepository<StructuralSystem> {
  @override
  String get tableName => 'structural_system';
}
