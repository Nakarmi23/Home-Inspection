import 'package:house_review/resources/inspection_cause_repo.dart';
import 'package:house_review/resources/room_purpose_repo.dart';
import 'package:house_review/resources/structural_system_repo.dart';

class RootRepository {
  final StructuralSystemRepo structuralSystemRepo = StructuralSystemRepo();
  final InspectionCauseRepo inspectionCauseRepo = InspectionCauseRepo();
  final RoomPurposeRepo roomPurposeRepo = RoomPurposeRepo();
}
