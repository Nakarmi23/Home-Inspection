import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'water_quality.g.dart';

@JsonSerializable()
class WaterQuality extends BaseModel {
  int sampleNo;
  String source;
  List<String> photos;
  String color;
  String taste;
  String odour;
  String phValue;
  String turbidty;
  String ecMeterReading;
  String temperature;
  String tdsMeterReading;
  String chlorineMeterReading;

  WaterQuality({
    this.sampleNo,
    this.source,
    List<String> photos,
    this.color,
    this.taste,
    this.odour,
    this.phValue,
    this.turbidty,
    this.ecMeterReading,
    this.temperature,
    this.tdsMeterReading,
    this.chlorineMeterReading,
  }) : this.photos = photos ?? [];

  factory WaterQuality.fromJson(Map<String, dynamic> json) =>
      _$WaterQualityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WaterQualityToJson(this);
}
