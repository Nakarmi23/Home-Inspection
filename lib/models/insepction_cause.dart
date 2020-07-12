import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insepction_cause.g.dart';

@JsonSerializable()
class InspectionCause extends BaseModel {
  int id;
  String inspectionCause;
  bool isEditable;

  InspectionCause({
    this.id,
    this.inspectionCause,
    this.isEditable,
  });

  factory InspectionCause.fromJson(Map<String, dynamic> json) =>
      _$InspectionCauseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InspectionCauseToJson(this);
}
