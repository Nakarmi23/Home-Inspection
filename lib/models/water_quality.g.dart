// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_quality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterQuality _$WaterQualityFromJson(Map<String, dynamic> json) {
  return WaterQuality(
    sampleNo: json['sampleNo'] as int,
    source: json['source'] as String,
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    color: json['color'] as String,
    taste: json['taste'] as String,
    odour: json['odour'] as String,
    phValue: json['phValue'] as String,
    turbidty: json['turbidty'] as String,
    ecMeterReading: json['ecMeterReading'] as String,
    temperature: json['temperature'] as String,
    tdsMeterReading: json['tdsMeterReading'] as String,
    chlorineMeterReading: json['chlorineMeterReading'] as String,
  );
}

Map<String, dynamic> _$WaterQualityToJson(WaterQuality instance) =>
    <String, dynamic>{
      'sampleNo': instance.sampleNo,
      'source': instance.source,
      'photos': instance.photos,
      'color': instance.color,
      'taste': instance.taste,
      'odour': instance.odour,
      'phValue': instance.phValue,
      'turbidty': instance.turbidty,
      'ecMeterReading': instance.ecMeterReading,
      'temperature': instance.temperature,
      'tdsMeterReading': instance.tdsMeterReading,
      'chlorineMeterReading': instance.chlorineMeterReading,
    };
