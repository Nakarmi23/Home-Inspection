import 'package:house_review/models/base_model.dart';
import 'package:house_review/models/room_picture.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class Room extends BaseModel {
  int id;
  int buildingId;
  int roomPurposeId;
  int structuralInspectionId;
  String roomId;
  int storeyNo;

  Room({
    this.id,
    this.buildingId,
    this.roomPurposeId,
    this.structuralInspectionId,
    this.roomId,
    this.storeyNo,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
