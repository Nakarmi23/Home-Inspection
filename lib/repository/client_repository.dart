import 'package:house_review/models/inspection_data.dart';
import 'package:house_review/repository/base_repository.dart';

class ClientRepository extends BaseRepository<InspectionData> {
  @override
  String get tableName => 'client_tbl';
}
