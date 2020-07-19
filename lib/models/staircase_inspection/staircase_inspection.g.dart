// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staircase_inspection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaircaseInspection _$StaircaseInspectionFromJson(Map<String, dynamic> json) {
  return StaircaseInspection(
    clearanceCondition: json['clearanceCondition'] == null
        ? null
        : ClearanceCondition.fromJson(
            json['clearanceCondition'] as Map<String, dynamic>),
    railing: json['railing'] == null
        ? null
        : Railing.fromJson(json['railing'] as Map<String, dynamic>),
    functionality: json['functionality'] == null
        ? null
        : Functionality.fromJson(json['functionality'] as Map<String, dynamic>),
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

ClearanceCondition _$ClearanceConditionFromJson(Map<String, dynamic> json) {
  return ClearanceCondition(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    comment: json['comment'] as String,
  );
}

Map<String, dynamic> _$ClearanceConditionToJson(ClearanceCondition instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'photos': instance.photos,
    };

Functionality _$FunctionalityFromJson(Map<String, dynamic> json) {
  return Functionality(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    comment: json['comment'] as String,
  );
}

Map<String, dynamic> _$FunctionalityToJson(Functionality instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'photos': instance.photos,
    };

Railing _$RailingFromJson(Map<String, dynamic> json) {
  return Railing(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    comment: json['comment'] as String,
  );
}

Map<String, dynamic> _$RailingToJson(Railing instance) => <String, dynamic>{
      'comment': instance.comment,
      'photos': instance.photos,
    };
