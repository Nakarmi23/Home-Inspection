// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) {
  return Room(
    roomPurpose: json['roomPurpose'] == null
        ? null
        : RoomPurpose.fromJson(json['roomPurpose'] as Map<String, dynamic>),
    structuralInspectionId: json['structuralInspectionId'] as int,
    roomId: json['roomId'] as String,
    storeyNo: json['storeyNo'] as int,
    pictures: (json['pictures'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'roomPurpose': instance.roomPurpose?.toJson(),
      'structuralInspectionId': instance.structuralInspectionId,
      'roomId': instance.roomId,
      'storeyNo': instance.storeyNo,
      'pictures': instance.pictures,
    };
