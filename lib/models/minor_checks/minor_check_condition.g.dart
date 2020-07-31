// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minor_check_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinorChecksCondition _$MinorChecksConditionFromJson(Map<String, dynamic> json) {
  return MinorChecksCondition(
    condition: json['condition'] as int,
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    comment: json['comment'] as String,
  );
}

Map<String, dynamic> _$MinorChecksConditionToJson(
        MinorChecksCondition instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'comment': instance.comment,
      'photos': instance.photos,
    };
