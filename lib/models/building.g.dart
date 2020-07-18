// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Building _$BuildingFromJson(Map<String, dynamic> json) {
  return Building(
    structuralSystem: json['structuralSystem'] == null
        ? null
        : StructuralSystem.fromJson(
            json['structuralSystem'] as Map<String, dynamic>),
    inspectionCause: json['inspectionCause'] == null
        ? null
        : InspectionCause.fromJson(
            json['inspectionCause'] as Map<String, dynamic>),
    photo: json['photo'] as String,
    length: (json['length'] as num)?.toDouble(),
    breath: (json['breath'] as num)?.toDouble(),
    storeyNo: json['storeyNo'] as int,
    materialUsed:
        (json['materialUsed'] as List)?.map((e) => e as String)?.toList(),
    originalPurpose: json['originalPurpose'] as String,
    currentPurpose: json['currentPurpose'] as String,
    foundationCondition: json['foundationCondition'] as String,
    supervisionStatus: json['supervisionStatus'] as String,
    comment: json['comment'] as String,
    problemComment: json['problemComment'] as String,
  );
}

Map<String, dynamic> _$BuildingToJson(Building instance) => <String, dynamic>{
      'structuralSystem': instance.structuralSystem?.toJson(),
      'inspectionCause': instance.inspectionCause?.toJson(),
      'photo': instance.photo,
      'length': instance.length,
      'breath': instance.breath,
      'storeyNo': instance.storeyNo,
      'materialUsed': instance.materialUsed,
      'originalPurpose': instance.originalPurpose,
      'currentPurpose': instance.currentPurpose,
      'foundationCondition': instance.foundationCondition,
      'supervisionStatus': instance.supervisionStatus,
      'comment': instance.comment,
      'problemComment': instance.problemComment,
    };
