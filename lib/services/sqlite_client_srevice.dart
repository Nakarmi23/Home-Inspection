import 'package:house_review/models/client.dart';
import 'package:house_review/services/sqflite_base_service.dart';

class SqliteClientService extends SqliteBaseService<Client> {
  @override
  String get tableName => 'client_tbl';
}
