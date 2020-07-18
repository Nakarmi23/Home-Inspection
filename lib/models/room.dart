import 'package:house_review/models/base_model.dart';
import 'package:house_review/models/room_purpose.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable(explicitToJson: true)
class Room extends BaseModel {
  RoomPurpose roomPurpose;
  int structuralInspectionId;
  String roomId;
  int storeyNo;
  List<String> pictures;
  Room({
    this.roomPurpose,
    this.structuralInspectionId,
    this.roomId,
    this.storeyNo,
    List<String> pictures,
  }) : this.pictures = pictures ?? [];

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
