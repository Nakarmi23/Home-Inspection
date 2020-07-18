// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structural_inspection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StructuralInspection _$StructuralInspectionFromJson(Map<String, dynamic> json) {
  return StructuralInspection(
    visualInspection: json['visualInspection'] == null
        ? null
        : VisualInspection.fromJson(
            json['visualInspection'] as Map<String, dynamic>),
    nonDestructiveTest: json['nonDestructiveTest'] == null
        ? null
        : NonDestructiveTest.fromJson(
            json['nonDestructiveTest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StructuralInspectionToJson(
        StructuralInspection instance) =>
    <String, dynamic>{
      'visualInspection': instance.visualInspection?.toJson(),
      'nonDestructiveTest': instance.nonDestructiveTest?.toJson(),
    };
