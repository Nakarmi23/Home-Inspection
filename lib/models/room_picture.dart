import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_picture.g.dart';

@JsonSerializable()
class RoomPicture extends BaseModel {
  int roomId;
  String picture;

  RoomPicture({
    this.roomId,
    this.picture,
  });

  factory RoomPicture.fromJson(Map<String, dynamic> json) =>
      _$RoomPictureFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RoomPictureToJson(this);
}
