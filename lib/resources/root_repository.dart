import 'package:house_review/services/sqflite_inspection_cause_service.dart';
import 'package:house_review/services/sqflite_room_purpose_service.dart';
import 'package:house_review/services/sqflite_structural_system_service.dart';
import 'package:house_review/services/sqlite_client_srevice.dart';

class RootRepository {
  final SqliteStructuralSysService structuralSysService =
      SqliteStructuralSysService();
  final SqliteInspectionCauseService inspectionCauesService =
      SqliteInspectionCauseService();
  final SqliteRoomPurposeService roomPurposeService =
      SqliteRoomPurposeService();
  final SqliteClientService clientService = SqliteClientService();
}
