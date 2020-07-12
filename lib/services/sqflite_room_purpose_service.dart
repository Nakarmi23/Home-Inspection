import 'package:house_review/models/room_purpose.dart';
import 'package:house_review/services/sqflite_base_service.dart';

class SqliteRoomPurposeService extends SqliteBaseService<RoomPurpose> {
  @override
  String get tableName => 'room_purpose';
}
