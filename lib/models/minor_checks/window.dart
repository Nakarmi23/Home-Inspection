part of 'minor_checks.dart';

@JsonSerializable()
class Window extends BaseModelWithConditionAndPhotos {
  String material;
  bool doorFramesCondition;
  bool doorPanelsCondition;
  bool hingesCondition;
  bool holderCondition;
  bool otherFixturesCondition;
  @override
  String condition;
  @override
  List<String> photos;

  Window({
    this.material,
    this.doorFramesCondition,
    this.doorPanelsCondition,
    this.hingesCondition,
    this.holderCondition,
    this.otherFixturesCondition,
    this.condition,
    List<String> photos,
  }) : this.photos = photos ?? [];

  factory Window.fromJson(Map<String, dynamic> json) => _$WindowFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WindowToJson(this);
}
