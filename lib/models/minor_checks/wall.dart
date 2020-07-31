part of 'minor_checks.dart';

@JsonSerializable(explicitToJson: true)
class Wall implements ImageAndComment {
  MinorChecksCondition paintingCondition;
  MinorChecksCondition plasteringCondition;
  MinorChecksCondition masonProblemCondition;
  MinorChecksCondition otherProblemCondition;
  @override
  List<String> photos;
  @override
  String comment;

  Wall({
    List<String> photos,
    this.comment,
    MinorChecksCondition paintingCondition,
    MinorChecksCondition plasteringCondition,
    MinorChecksCondition masonProblemCondition,
    MinorChecksCondition otherProblemCondition,
  })  : this.photos = photos ?? [],
        this.paintingCondition = paintingCondition ?? MinorChecksCondition(),
        this.plasteringCondition =
            plasteringCondition ?? MinorChecksCondition(),
        this.masonProblemCondition =
            masonProblemCondition ?? MinorChecksCondition(),
        this.otherProblemCondition =
            otherProblemCondition ?? MinorChecksCondition();

  factory Wall.fromJson(Map<String, dynamic> json) => _$WallFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WallToJson(this);
}
