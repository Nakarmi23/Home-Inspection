part of 'minor_checks.dart';

@JsonSerializable()
class ElectricalFitting extends BaseModelWithConditionAndPhotos {
  bool wiringCondition;
  bool switchesCondition;
  bool lightsCondition;
  bool ceilingFanCondition;
  bool otherAccessoriesCondition;
  @override
  List<String> photos;
  @override
  String condition;

  ElectricalFitting({
    List<String> photos,
    this.condition,
    this.wiringCondition,
    this.switchesCondition,
    this.lightsCondition,
    this.ceilingFanCondition,
    this.otherAccessoriesCondition,
  }) : this.photos = photos ?? [];

  factory ElectricalFitting.fromJson(Map<String, dynamic> json) =>
      _$ElectricalFittingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ElectricalFittingToJson(this);
}
