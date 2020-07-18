import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'structural_inspection.g.dart';
part 'non_destructive_test.dart';
part 'visual_inspection.dart';

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
