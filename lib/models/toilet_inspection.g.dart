// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toilet_inspection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToiletInspection _$ToiletInspectionFromJson(Map<String, dynamic> json) {
  return ToiletInspection(
    washBasin: json['washBasin'] == null
        ? null
        : WashBasin.fromJson(json['washBasin'] as Map<String, dynamic>),
    mirror: json['mirror'] == null
        ? null
        : Mirror.fromJson(json['mirror'] as Map<String, dynamic>),
    waterCloset: json['waterCloset'] == null
        ? null
        : WaterCloset.fromJson(json['waterCloset'] as Map<String, dynamic>),
    flush: json['flush'] == null
        ? null
        : Flush.fromJson(json['flush'] as Map<String, dynamic>),
    plumbing: json['plumbing'] == null
        ? null
        : Plumbing.fromJson(json['plumbing'] as Map<String, dynamic>),
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

WashBasin _$WashBasinFromJson(Map<String, dynamic> json) {
  return WashBasin(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
  );
}

Map<String, dynamic> _$WashBasinToJson(WashBasin instance) => <String, dynamic>{
      'condition': instance.condition,
      'photos': instance.photos,
    };

Mirror _$MirrorFromJson(Map<String, dynamic> json) {
  return Mirror(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
  );
}

Map<String, dynamic> _$MirrorToJson(Mirror instance) => <String, dynamic>{
      'condition': instance.condition,
      'photos': instance.photos,
    };

WaterCloset _$WaterClosetFromJson(Map<String, dynamic> json) {
  return WaterCloset(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
  );
}

Map<String, dynamic> _$WaterClosetToJson(WaterCloset instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'photos': instance.photos,
    };

Flush _$FlushFromJson(Map<String, dynamic> json) {
  return Flush(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
  );
}

Map<String, dynamic> _$FlushToJson(Flush instance) => <String, dynamic>{
      'condition': instance.condition,
      'photos': instance.photos,
    };

Plumbing _$PlumbingFromJson(Map<String, dynamic> json) {
  return Plumbing(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
  );
}

Map<String, dynamic> _$PlumbingToJson(Plumbing instance) => <String, dynamic>{
      'condition': instance.condition,
      'photos': instance.photos,
    };
