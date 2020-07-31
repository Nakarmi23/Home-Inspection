// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toilet_inspection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToiletInspection _$ToiletInspectionFromJson(Map<String, dynamic> json) {
  return ToiletInspection(
    washBasin: json['washBasin'] == null
        ? null
        : ImageAndComment.fromJson(json['washBasin'] as Map<String, dynamic>),
    mirror: json['mirror'] == null
        ? null
        : ImageAndComment.fromJson(json['mirror'] as Map<String, dynamic>),
    waterCloset: json['waterCloset'] == null
        ? null
        : ImageAndComment.fromJson(json['waterCloset'] as Map<String, dynamic>),
    flush: json['flush'] == null
        ? null
        : ImageAndComment.fromJson(json['flush'] as Map<String, dynamic>),
    plumbing: json['plumbing'] == null
        ? null
        : ImageAndComment.fromJson(json['plumbing'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ToiletInspectionToJson(ToiletInspection instance) =>
    <String, dynamic>{
      'washBasin': instance.washBasin?.toJson(),
      'mirror': instance.mirror?.toJson(),
      'waterCloset': instance.waterCloset?.toJson(),
      'flush': instance.flush?.toJson(),
      'plumbing': instance.plumbing?.toJson(),
    };
