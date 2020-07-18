// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visual_inspection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisualInspection _$VisualInspectionFromJson(Map<String, dynamic> json) {
  return VisualInspection(
    spalling: json['spalling'] == null
        ? null
        : Spalling.fromJson(json['spalling'] as Map<String, dynamic>),
    tilting: json['tilting'] == null
        ? null
        : Tilting.fromJson(json['tilting'] as Map<String, dynamic>),
    bulging: json['bulging'] == null
        ? null
        : Bulging.fromJson(json['bulging'] as Map<String, dynamic>),
    cracking: json['cracking'] == null
        ? null
        : Cracking.fromJson(json['cracking'] as Map<String, dynamic>),
    otherProblems: (json['otherProblems'] as List)
        ?.map((e) =>
            e == null ? null : OtherProblem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$VisualInspectionToJson(VisualInspection instance) =>
    <String, dynamic>{
      'spalling': instance.spalling?.toJson(),
      'tilting': instance.tilting?.toJson(),
      'bulging': instance.bulging?.toJson(),
      'cracking': instance.cracking?.toJson(),
      'otherProblems':
          instance.otherProblems?.map((e) => e?.toJson())?.toList(),
    };

Spalling _$SpallingFromJson(Map<String, dynamic> json) {
  return Spalling(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    comment: json['comment'] as String,
  );
}

Map<String, dynamic> _$SpallingToJson(Spalling instance) => <String, dynamic>{
      'comment': instance.comment,
      'photos': instance.photos,
    };

Tilting _$TiltingFromJson(Map<String, dynamic> json) {
  return Tilting(
    comment: json['comment'] as String,
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    tiltingReading: json['tiltingReading'] as String,
    digitalLevelMeterPhotos: (json['digitalLevelMeterPhotos'] as List)
        ?.map((e) => e as String)
        ?.toList(),
  );
}

Map<String, dynamic> _$TiltingToJson(Tilting instance) => <String, dynamic>{
      'tiltingReading': instance.tiltingReading,
      'digitalLevelMeterPhotos': instance.digitalLevelMeterPhotos,
      'comment': instance.comment,
      'photos': instance.photos,
    };

Bulging _$BulgingFromJson(Map<String, dynamic> json) {
  return Bulging(
    comment: json['comment'] as String,
    height: (json['height'] as num)?.toDouble(),
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    width: (json['width'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$BulgingToJson(Bulging instance) => <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'comment': instance.comment,
      'photos': instance.photos,
    };

Cracking _$CrackingFromJson(Map<String, dynamic> json) {
  return Cracking(
    comment: json['comment'] as String,
    height: (json['height'] as num)?.toDouble(),
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    width: (json['width'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CrackingToJson(Cracking instance) => <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'comment': instance.comment,
      'photos': instance.photos,
    };

OtherProblem _$OtherProblemFromJson(Map<String, dynamic> json) {
  return OtherProblem(
    comment: json['comment'] as String,
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$OtherProblemToJson(OtherProblem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'comment': instance.comment,
      'photos': instance.photos,
    };
