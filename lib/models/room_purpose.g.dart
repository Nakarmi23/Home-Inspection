// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_purpose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomPurpose _$RoomPurposeFromJson(Map<String, dynamic> json) {
  return RoomPurpose(
    id: json['id'] as int,
    purpose: json['purpose'] as String,
    isEditable: json['isEditable'] as int,
  );
}

Map<String, dynamic> _$RoomPurposeToJson(RoomPurpose instance) =>
    <String, dynamic>{
      'id': instance.id,
      'purpose': instance.purpose,
      'isEditable': instance.isEditable,
    };
