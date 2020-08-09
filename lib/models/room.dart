import 'package:house_review/models/base_model.dart';
import 'package:house_review/models/kitchen_inspection/kitchen_inspection.dart';
import 'package:house_review/models/minor_checks/minor_checks.dart';
import 'package:house_review/models/room_purpose.dart';
import 'package:house_review/models/seepage_analysis.dart';
import 'package:house_review/models/staircase_inspection/staircase_inspection.dart';
import 'package:house_review/models/structural_inspection/structural_inspection.dart';
import 'package:house_review/models/toilet_inspection/toilet_inspection.dart';
import 'package:house_review/models/water_quality.dart';
import 'package:house_review/models/luxmeter_reading.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable(explicitToJson: true)
class Room extends BaseModel {
  RoomPurpose roomPurpose;
  StructuralInspection structuralInspection;
  MinorChecks minorChecks;
  KitchenInspection kitchenInspection;
  ToiletInspection toiletInspection;
  List<WaterQuality> waterQualities;
  List<LuxmeterReading> luxmeterReadings;
  List<SeepageAnalysis> seepageAnalysis;
  List<StaircaseInspection> staircaseInspection;
  String roomId;
  double storeyNo;
  int roomNo;
  List<String> pictures;
  Room({
    this.roomPurpose,
    this.structuralInspection,
    this.roomId,
    this.storeyNo,
    List<String> pictures,
    List<WaterQuality> waterQualities,
    List<LuxmeterReading> luxmeterReadings,
    List<SeepageAnalysis> seepageAnalysis,
    this.kitchenInspection,
    this.toiletInspection,
    List<StaircaseInspection> staircaseInspection,
    this.minorChecks,
    this.roomNo,
  })  : this.pictures = pictures ?? [],
        this.waterQualities = waterQualities ?? [],
        this.luxmeterReadings = luxmeterReadings ?? [],
        this.staircaseInspection = staircaseInspection ?? [],
        this.seepageAnalysis = seepageAnalysis ?? [];

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
