import 'package:house_review/models/IRoomPurpose.dart';
import 'package:house_review/services/sqflite_base_service.dart';
import 'package:sqflite/sqflite.dart';

class SqliteRoomPurposeService extends SqliteBaseService<IRoomPurpose> {
  @override
  String get tableName => 'room_purpose';

  @override
  IRoomPurpose get model => IRoomPurpose();
}
