import 'package:house_review/models/inspection_file_info.dart';
import 'package:house_review/repository/base_repository.dart';

class InspectionFileInfoRepository extends BaseRepository<InspectionFileInfo> {
  @override
  String get tableName => 'inspection_file_info';
}
