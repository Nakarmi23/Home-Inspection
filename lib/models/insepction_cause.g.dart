// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insepction_cause.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectionCause _$InspectionCauseFromJson(Map<String, dynamic> json) {
  return InspectionCause(
    id: json['id'] as int,
    inspectionCause: json['inspectionCause'] as String,
    isEditable: json['isEditable'] as bool,
  );
}

Map<String, dynamic> _$InspectionCauseToJson(InspectionCause instance) =>
    <String, dynamic>{
      'id': instance.id,
      'inspectionCause': instance.inspectionCause,
      'isEditable': instance.isEditable,
    };
