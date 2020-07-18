part of 'minor_checks.dart';

@JsonSerializable()
class PestInspection extends BaseModel {
  List<String> photos;
  String condition;
  String surroundingCondition;

  PestInspection({
    List<String> photos,
    this.condition,
    this.surroundingCondition,
  }) : this.photos = photos ?? [];

  factory PestInspection.fromJson(Map<String, dynamic> json) =>
      _$PestInspectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PestInspectionToJson(this);
}
