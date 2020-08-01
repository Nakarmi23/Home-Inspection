part of 'minor_checks.dart';

@JsonSerializable(explicitToJson: true)
class Door implements ImageAndComment {
  String material;
  MinorChecksCondition doorFramesCondition;
  MinorChecksCondition doorPanelsCondition;
  MinorChecksCondition hingesCondition;
  MinorChecksCondition holderCondition;
  MinorChecksCondition otherFixturesCondition;
  @override
  List<String> photos;
  @override
  String comment;

  Door({
    this.material,
    MinorChecksCondition doorFramesCondition,
    MinorChecksCondition doorPanelsCondition,
    MinorChecksCondition hingesCondition,
    MinorChecksCondition holderCondition,
    MinorChecksCondition otherFixturesCondition,
    this.comment,
    List<String> photos,
  })  : this.photos = photos ?? [],
        doorFramesCondition = doorFramesCondition ?? MinorChecksCondition(),
        doorPanelsCondition = doorPanelsCondition ?? MinorChecksCondition(),
        hingesCondition = hingesCondition ?? MinorChecksCondition(),
        holderCondition = holderCondition ?? MinorChecksCondition(),
        otherFixturesCondition =
            otherFixturesCondition ?? MinorChecksCondition();
  factory Door.fromJson(Map<String, dynamic> json) => _$DoorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$DoorToJson(this);
}
