part of 'minor_checks.dart';

@JsonSerializable()
class Door extends BaseModelWithConditionAndPhotos {
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

  Door({
    this.material,
    this.doorFramesCondition,
    this.doorPanelsCondition,
    this.hingesCondition,
    this.holderCondition,
    this.otherFixturesCondition,
    this.condition,
    List<String> photos,
  }) : this.photos = photos ?? [];
  factory Door.fromJson(Map<String, dynamic> json) => _$DoorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$DoorToJson(this);
}
