import 'package:house_review/models/IBaseModel.dart';
import 'package:house_review/models/IRoomPicture.dart';

class IRoom extends IBaseModel<IRoom> {
  int id;
  int buildingId;
  int roomPurposeId;
  int structuralInspectionId;
  String roomId;
  int storeyNo;
  List<IRoomPicture> pictures;

  IRoom({
    this.id,
    this.buildingId,
    this.roomPurposeId,
    this.structuralInspectionId,
    this.roomId,
    this.storeyNo,
    this.pictures,
  });

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'building_id': buildingId,
        'room_purpose_id': roomPurposeId,
        'structural_inspection_id': structuralInspectionId,
        'room_id': roomId,
        'storey_no': storeyNo,
      };

  @override
  IRoom fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buildingId = json['building_id'];
    roomPurposeId = json['room_purpose_id'];
    structuralInspectionId = json['structural_inspection_id'];
    roomId = json['room_id'];
    storeyNo = json['storey_no'];
    return this;
  }
}
