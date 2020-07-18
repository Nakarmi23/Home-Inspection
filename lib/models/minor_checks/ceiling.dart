part of 'minor_checks.dart';

@JsonSerializable()
class Ceiling extends BaseModelWithConditionAndPhotos {
  bool paintingCondition;
  bool plasteringCondition;
  bool falseCeilingsCondition;
  bool masonProblemCondition;
  bool otherProblemCondition;
  @override
  List<String> photos;
  @override
  String condition;

  Ceiling({
    List<String> photos,
    this.condition,
    this.paintingCondition,
    this.plasteringCondition,
    this.falseCeilingsCondition,
    this.masonProblemCondition,
    this.otherProblemCondition,
  }) : this.photos = photos ?? [];

  factory Ceiling.fromJson(Map<String, dynamic> json) =>
      _$CeilingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CeilingToJson(this);
}
