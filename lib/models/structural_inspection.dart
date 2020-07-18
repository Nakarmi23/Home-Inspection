import 'package:house_review/models/base_model.dart';
import 'package:house_review/models/non_destructive_test.dart';
import 'package:house_review/models/visual_inspection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'structural_inspection.g.dart';

@JsonSerializable(explicitToJson: true)
class StructuralInspection extends BaseModel {
  VisualInspection visualInspection;
  NonDestructiveTest nonDestructiveTest;

  StructuralInspection({this.visualInspection, this.nonDestructiveTest});

  factory StructuralInspection.fromJson(Map<String, dynamic> json) =>
      _$StructuralInspectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StructuralInspectionToJson(this);
}
