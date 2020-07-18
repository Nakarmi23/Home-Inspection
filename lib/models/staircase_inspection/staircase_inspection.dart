import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staircase_inspection.g.dart';
part 'clearance_condition.dart';
part 'functionality.dart';
part 'railing.dart';

@JsonSerializable(explicitToJson: true)
class StaircaseInspection extends BaseModel {
  ClearanceCondition clearanceCondition;
  Railing railing;
  Functionality functionality;
  String location;
  String type;
  String material;

  StaircaseInspection({
    this.clearanceCondition,
    this.railing,
    this.functionality,
    this.location,
    this.type,
    this.material,
  });

  factory StaircaseInspection.fromJson(Map<String, dynamic> json) =>
      _$StaircaseInspectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StaircaseInspectionToJson(this);
}
