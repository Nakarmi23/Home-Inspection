// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) {
  return Room(
    id: json['id'] as int,
    buildingId: json['buildingId'] as int,
    roomPurposeId: json['roomPurposeId'] as int,
    structuralInspectionId: json['structuralInspectionId'] as int,
    roomId: json['roomId'] as String,
    storeyNo: json['storeyNo'] as int,
  );
}

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'buildingId': instance.buildingId,
      'roomPurposeId': instance.roomPurposeId,
      'structuralInspectionId': instance.structuralInspectionId,
      'roomId': instance.roomId,
      'storeyNo': instance.storeyNo,
    };
