part of 'minor_checks.dart';

@JsonSerializable(explicitToJson: true)
class ElectricalFitting implements ImageAndComment {
  MinorChecksCondition wiringCondition;
  MinorChecksCondition switchesCondition;
  MinorChecksCondition lightsCondition;
  MinorChecksCondition ceilingFanCondition;
  MinorChecksCondition otherAccessoriesCondition;
  @override
  List<String> photos;
  @override
  String comment;

  ElectricalFitting({
    List<String> photos,
    this.comment,
    MinorChecksCondition wiringCondition,
    MinorChecksCondition switchesCondition,
    MinorChecksCondition lightsCondition,
    MinorChecksCondition ceilingFanCondition,
    MinorChecksCondition otherAccessoriesCondition,
  })  : this.photos = photos ?? [],
        this.wiringCondition = wiringCondition ?? MinorChecksCondition(),
        this.switchesCondition = switchesCondition ?? MinorChecksCondition(),
        this.lightsCondition = lightsCondition ?? MinorChecksCondition(),
        this.ceilingFanCondition =
            ceilingFanCondition ?? MinorChecksCondition(),
        this.otherAccessoriesCondition =
            otherAccessoriesCondition ?? MinorChecksCondition();

  factory ElectricalFitting.fromJson(Map<String, dynamic> json) =>
      _$ElectricalFittingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ElectricalFittingToJson(this);
}
