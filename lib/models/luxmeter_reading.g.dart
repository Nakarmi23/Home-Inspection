// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'luxmeter_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LuxmeterReading _$LuxmeterReadingFromJson(Map<String, dynamic> json) {
  return LuxmeterReading(
    sampleNo: json['sampleNo'] as int,
    source: json['source'] as String,
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    readings: (json['readings'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$LuxmeterReadingToJson(LuxmeterReading instance) =>
    <String, dynamic>{
      'sampleNo': instance.sampleNo,
      'source': instance.source,
      'photos': instance.photos,
      'readings': instance.readings,
    };
