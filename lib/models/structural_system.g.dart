// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structural_system.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StructuralSystem _$StructuralSystemFromJson(Map<String, dynamic> json) {
  return StructuralSystem(
    id: json['id'] as int,
    systemName: json['systemName'] as String,
    isEditable: json['isEditable'] as int,
  );
}

Map<String, dynamic> _$StructuralSystemToJson(StructuralSystem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'systemName': instance.systemName,
      'isEditable': instance.isEditable,
    };
