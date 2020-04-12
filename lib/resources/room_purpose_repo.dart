import 'package:house_review/models/IRoomPurpose.dart';
import 'package:house_review/resources/base_repo.dart';
import 'package:house_review/services/sqflite_room_purpose_service.dart';

class RoomPurposeRepo extends BaseRepo<SqliteRoomPurposeService, IRoomPurpose> {
  @override
  SqliteRoomPurposeService get service => SqliteRoomPurposeService();
}
