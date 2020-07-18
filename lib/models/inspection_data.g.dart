// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectionData _$InspectionDataFromJson(Map<String, dynamic> json) {
  return InspectionData(
    id: json['id'] as int,
    name: json['name'] as String,
    address: json['address'] as String,
    dateOfInspection: json['dateOfInspection'] == null
        ? null
        : DateTime.parse(json['dateOfInspection'] as String),
    buildingData: json['buildingData'] == null
        ? null
        : Building.fromJson(json['buildingData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InspectionDataToJson(InspectionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'dateOfInspection': instance.dateOfInspection?.toIso8601String(),
      'buildingData': instance.buildingData?.toJson(),
    };
