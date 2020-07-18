part of 'minor_checks.dart';

@JsonSerializable()
class Wall extends BaseModelWithConditionAndPhotos {
  bool paintingCondition;
  bool plasteringCondition;
  bool masonProblemCondition;
  bool otherProblemCondition;
  @override
  List<String> photos;
  @override
  String condition;

  Wall({
    List<String> photos,
    this.condition,
    this.paintingCondition,
    this.plasteringCondition,
    this.masonProblemCondition,
    this.otherProblemCondition,
  }) : this.photos = photos ?? [];

  factory Wall.fromJson(Map<String, dynamic> json) => _$WallFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WallToJson(this);
}
