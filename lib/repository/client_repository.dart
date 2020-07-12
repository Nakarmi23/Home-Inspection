import 'package:house_review/models/client.dart';
import 'package:house_review/services/base_repository.dart';

class ClientRepository extends BaseRepository<Client> {
  @override
  String get tableName => 'client_tbl';
}
