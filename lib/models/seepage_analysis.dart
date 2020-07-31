import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'seepage_analysis.g.dart';

@JsonSerializable()
class SeepageAnalysis extends BaseModel {
  String temperature;
  String condition;
  List<String> photosNormal;
  List<String> photosThermal;
  List<String> readings;
  List<String> photosDigitalLevel;
  List<String> photosMoistureMeter;
  String commentsDigitalLevel;

  SeepageAnalysis(
      {this.temperature,
      this.condition,
      List<String> photosNormal,
      List<String> photosThermal,
      List<String> readings,
      List<String> photosDigitalLevel,
      List<String> photosMoistureMeter,
      this.commentsDigitalLevel})
      : this.photosNormal = photosNormal ?? [],
        this.photosThermal = photosThermal ?? [],
        this.readings = readings ?? [],
        this.photosDigitalLevel = photosDigitalLevel ?? [],
        this.photosMoistureMeter = photosMoistureMeter ?? [];

  factory SeepageAnalysis.fromJson(Map<String, dynamic> json) =>
      _$SeepageAnalysisFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SeepageAnalysisToJson(this);
}
