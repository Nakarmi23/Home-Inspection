import 'package:house_review/models/base_model.dart';
import 'package:house_review/models/minor_checks.dart';
import 'package:house_review/models/room_purpose.dart';
import 'package:house_review/models/seepage_analysis.dart';
import 'package:house_review/models/structural_inspection.dart';
import 'package:house_review/models/water_quality.dart';
import 'package:house_review/models/luxmeter_reading.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable(explicitToJson: true)
class Room extends BaseModel {
  RoomPurpose roomPurpose;
  StructuralInspection structuralInspection;
  List<WaterQuality> waterQualities;
  List<LuxmeterReading> luxmeterReadings;
  List<SeepageAnalysis> seepageAnalysis;
  MinorChecks minorChecks;
  String roomId;
  int storeyNo;
  List<String> pictures;
  Room(
      {this.roomPurpose,
      this.structuralInspection,
      this.roomId,
      this.storeyNo,
      List<String> pictures,
      List<WaterQuality> waterQualities,
      List<LuxmeterReading> luxmeterReadings,
      List<SeepageAnalysis> seepageAnalysis,
      this.minorChecks})
      : this.pictures = pictures ?? [],
        this.waterQualities = waterQualities ?? [],
        this.luxmeterReadings = luxmeterReadings ?? [],
        this.seepageAnalysis = seepageAnalysis ?? [];

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
