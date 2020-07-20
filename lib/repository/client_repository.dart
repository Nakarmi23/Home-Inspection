import 'package:house_review/models/inspection_data.dart';
import 'package:house_review/repository/base_repository.dart';

class InspectionFileInfoRepository extends BaseRepository<InspectionData> {
  @override
  String get tableName => 'inspection_file_info';
}
