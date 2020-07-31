part of 'minor_checks.dart';

@JsonSerializable(explicitToJson: true)
class Window implements ImageAndComment {
  String material;
  MinorChecksCondition doorFramesCondition;
  MinorChecksCondition doorPanelsCondition;
  MinorChecksCondition hingesCondition;
  MinorChecksCondition holderCondition;
  MinorChecksCondition otherFixturesCondition;
  @override
  String comment;
  @override
  List<String> photos;

  Window({
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
        doorPanelsCondition = doorFramesCondition ?? MinorChecksCondition(),
        hingesCondition = doorFramesCondition ?? MinorChecksCondition(),
        holderCondition = doorFramesCondition ?? MinorChecksCondition(),
        otherFixturesCondition = doorFramesCondition ?? MinorChecksCondition();

  factory Window.fromJson(Map<String, dynamic> json) => _$WindowFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WindowToJson(this);
}
