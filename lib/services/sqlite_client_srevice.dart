import 'package:house_review/models/IClient.dart';
import 'package:house_review/services/sqflite_base_service.dart';

class SqliteInspectionCauseService extends SqliteBaseService<IClient> {
  @override
  String get tableName => 'client_tbl';

  @override
  IClient get model => IClient();
}
