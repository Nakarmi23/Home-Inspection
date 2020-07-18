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
    structuralInspection: json['structuralInspection'] == null
        ? null
        : StructuralInspection.fromJson(
            json['structuralInspection'] as Map<String, dynamic>),
    roomId: json['roomId'] as String,
    storeyNo: json['storeyNo'] as int,
    pictures: (json['pictures'] as List)?.map((e) => e as String)?.toList(),
    waterQualities: (json['waterQualities'] as List)
        ?.map((e) =>
            e == null ? null : WaterQuality.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    luxmeterReadings: (json['luxmeterReadings'] as List)
        ?.map((e) => e == null
            ? null
            : LuxmeterReading.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    seepageAnalysis: (json['seepageAnalysis'] as List)
        ?.map((e) => e == null
            ? null
            : SeepageAnalysis.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    minorChecks: json['minorChecks'] == null
        ? null
        : MinorChecks.fromJson(json['minorChecks'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'roomPurpose': instance.roomPurpose?.toJson(),
      'structuralInspection': instance.structuralInspection?.toJson(),
      'waterQualities':
          instance.waterQualities?.map((e) => e?.toJson())?.toList(),
      'luxmeterReadings':
          instance.luxmeterReadings?.map((e) => e?.toJson())?.toList(),
      'seepageAnalysis':
          instance.seepageAnalysis?.map((e) => e?.toJson())?.toList(),
      'minorChecks': instance.minorChecks?.toJson(),
      'roomId': instance.roomId,
      'storeyNo': instance.storeyNo,
      'pictures': instance.pictures,
    };
