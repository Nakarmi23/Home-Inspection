import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'toilet_inspection.g.dart';
part 'wash_basin.dart';
part 'mirror.dart';
part 'water_closet.dart';
part 'flush.dart';
part 'plumbing.dart';

@JsonSerializable(explicitToJson: true)
class ToiletInspection extends BaseModel {
  WashBasin washBasin;
  Mirror mirror;
  WaterCloset waterCloset;
  Flush flush;
  Plumbing plumbing;
  ToiletInspection({
    WashBasin washBasin,
    Mirror mirror,
    WaterCloset waterCloset,
    Flush flush,
    Plumbing plumbing,
  })  : this.washBasin = washBasin ?? WashBasin(),
        this.mirror = mirror ?? Mirror(),
        this.waterCloset = WaterCloset(),
        this.flush = Flush(),
        this.plumbing = Plumbing();
  factory ToiletInspection.fromJson(Map<String, dynamic> json) =>
      _$ToiletInspectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ToiletInspectionToJson(this);
}
