part of 'minor_checks.dart';

@JsonSerializable(explicitToJson: true)
class Door {
  String material;
  MinorChecksCondition doorFramesCondition;
  MinorChecksCondition doorPanelsCondition;
  MinorChecksCondition hingesCondition;
  MinorChecksCondition holderCondition;
  List<MinorChecksCondition> otherFixturesCondition;

  Door({
    this.material,
    MinorChecksCondition doorFramesCondition,
    MinorChecksCondition doorPanelsCondition,
    MinorChecksCondition hingesCondition,
    MinorChecksCondition holderCondition,
    List<MinorChecksCondition> otherFixturesCondition,
  })  : doorFramesCondition = doorFramesCondition ?? MinorChecksCondition(),
        doorPanelsCondition = doorPanelsCondition ?? MinorChecksCondition(),
        hingesCondition = hingesCondition ?? MinorChecksCondition(),
        holderCondition = holderCondition ?? MinorChecksCondition(),
        otherFixturesCondition = otherFixturesCondition ?? [];
  factory Door.fromJson(Map<String, dynamic> json) => _$DoorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$DoorToJson(this);
}
