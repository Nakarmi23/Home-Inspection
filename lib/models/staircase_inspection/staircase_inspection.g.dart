// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staircase_inspection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaircaseInspection _$StaircaseInspectionFromJson(Map<String, dynamic> json) {
  return StaircaseInspection(
    clearanceCondition: json['clearanceCondition'] == null
        ? null
        : ImageAndComment.fromJson(
            json['clearanceCondition'] as Map<String, dynamic>),
    railing: json['railing'] == null
        ? null
        : ImageAndComment.fromJson(json['railing'] as Map<String, dynamic>),
    functionality: json['functionality'] == null
        ? null
        : ImageAndComment.fromJson(
            json['functionality'] as Map<String, dynamic>),
    location: json['location'] as String,
    type: json['type'] as String,
    material: json['material'] as String,
  );
}

Map<String, dynamic> _$StaircaseInspectionToJson(
        StaircaseInspection instance) =>
    <String, dynamic>{
      'clearanceCondition': instance.clearanceCondition?.toJson(),
      'railing': instance.railing?.toJson(),
      'functionality': instance.functionality?.toJson(),
      'location': instance.location,
      'type': instance.type,
      'material': instance.material,
    };
