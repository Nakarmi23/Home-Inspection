import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_purpose.g.dart';

@JsonSerializable()
class RoomPurpose extends BaseModel {
  int id;
  String purpose;
  bool isEditable;

  RoomPurpose({this.id, this.purpose, this.isEditable});

  factory RoomPurpose.fromJson(Map<String, dynamic> json) =>
      _$RoomPurposeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RoomPurposeToJson(this);
}
