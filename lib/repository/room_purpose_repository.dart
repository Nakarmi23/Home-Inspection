import 'package:house_review/models/room_purpose.dart';
import 'package:house_review/services/base_repository.dart';

class RoomPurposeRepository extends BaseRepository<RoomPurpose> {
  @override
  String get tableName => 'room_purpose';
}
