part of 'minor_checks.dart';

@JsonSerializable(explicitToJson: true)
class Window implements ImageAndComment {
  String material;
  MinorChecksCondition windowFramesCondition;
  MinorChecksCondition windowPanelsCondition;
  MinorChecksCondition hingesCondition;
  MinorChecksCondition holderCondition;
  List<MinorChecksCondition> otherFixturesCondition;
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
    List<MinorChecksCondition> otherFixturesCondition,
    this.comment,
    List<String> photos,
  })  : this.photos = photos ?? [],
        windowFramesCondition = doorFramesCondition ?? MinorChecksCondition(),
        windowPanelsCondition = doorFramesCondition ?? MinorChecksCondition(),
        hingesCondition = doorFramesCondition ?? MinorChecksCondition(),
        holderCondition = doorFramesCondition ?? MinorChecksCondition(),
        otherFixturesCondition = doorFramesCondition ?? [];

  factory Window.fromJson(Map<String, dynamic> json) => _$WindowFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WindowToJson(this);
}
