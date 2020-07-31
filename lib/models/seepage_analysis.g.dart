// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seepage_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeepageAnalysis _$SeepageAnalysisFromJson(Map<String, dynamic> json) {
  return SeepageAnalysis(
    temperature: json['temperature'] as String,
    condition: json['condition'] as String,
    photosNormal:
        (json['photosNormal'] as List)?.map((e) => e as String)?.toList(),
    photosThermal:
        (json['photosThermal'] as List)?.map((e) => e as String)?.toList(),
    readings: (json['readings'] as List)?.map((e) => e as String)?.toList(),
    photosDigitalLevel:
        (json['photosDigitalLevel'] as List)?.map((e) => e as String)?.toList(),
    photosMoistureMeter: (json['photosMoistureMeter'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    commentsDigitalLevel: json['commentsDigitalLevel'] as String,
  );
}

Map<String, dynamic> _$SeepageAnalysisToJson(SeepageAnalysis instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'condition': instance.condition,
      'photosNormal': instance.photosNormal,
      'photosThermal': instance.photosThermal,
      'readings': instance.readings,
      'photosDigitalLevel': instance.photosDigitalLevel,
      'photosMoistureMeter': instance.photosMoistureMeter,
      'commentsDigitalLevel': instance.commentsDigitalLevel,
    };
