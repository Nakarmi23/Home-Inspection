import 'package:house_review/models/base_model.dart';
import 'package:house_review/models/insepction_cause.dart';
import 'package:house_review/models/structural_system.dart';
import 'package:json_annotation/json_annotation.dart';

part 'building.g.dart';

@JsonSerializable(explicitToJson: true)
class Building extends BaseModel {
  StructuralSystem structuralSystem;
  InspectionCause inspectionCause;
  String photo;
  double length;
  double breath;
  int storeyNo;
  List<String> materialUsed;
  String originalPurpose;
  String currentPurpose;
  String foundationCondition;
  String supervisionStatus;
  String comment;
  String problemComment;

  Building({
    this.structuralSystem,
    this.inspectionCause,
    this.photo,
    this.length,
    this.breath,
    this.storeyNo,
    List<String> materialUsed,
    this.originalPurpose,
    this.currentPurpose,
    this.foundationCondition,
    this.supervisionStatus,
    this.comment,
    this.problemComment,
  }) : materialUsed = materialUsed ?? [];

  factory Building.fromJson(Map<String, dynamic> json) =>
      _$BuildingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BuildingToJson(this);
}
