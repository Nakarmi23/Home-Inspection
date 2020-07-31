// part 'luxmeter_reading.g.dart';
import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'luxmeter_reading.g.dart';

@JsonSerializable()
class LuxmeterReading extends BaseModel {
  int sampleNo;
  String source;
  List<String> photos;
  List<String> readings;

  LuxmeterReading({
    this.sampleNo,
    this.source,
    List<String> photos,
    List<String> readings,
  })  : this.photos = photos ?? [],
        this.readings = readings ?? [];

  factory LuxmeterReading.fromJson(Map<String, dynamic> json) =>
      _$LuxmeterReadingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LuxmeterReadingToJson(this);
}
