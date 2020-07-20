// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_file_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectionFileInfo _$InspectionFileInfoFromJson(Map<String, dynamic> json) {
  return InspectionFileInfo(
    id: json['id'] as int,
    name: json['name'] as String,
    address: json['address'] as String,
    fileName: json['fileName'] as String,
    path: json['path'] as String,
  );
}

Map<String, dynamic> _$InspectionFileInfoToJson(InspectionFileInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'fileName': instance.fileName,
      'path': instance.path,
    };
