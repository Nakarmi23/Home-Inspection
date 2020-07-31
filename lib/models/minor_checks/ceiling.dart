part of 'minor_checks.dart';

@JsonSerializable(explicitToJson: true)
class Ceiling implements ImageAndComment {
  MinorChecksCondition paintingCondition;
  MinorChecksCondition plasteringCondition;
  MinorChecksCondition falseCeilingsCondition;
  MinorChecksCondition masonProblemCondition;
  MinorChecksCondition otherProblemCondition;
  @override
  List<String> photos;
  @override
  String comment;

  Ceiling({
    List<String> photos,
    this.comment,
    MinorChecksCondition paintingCondition,
    MinorChecksCondition plasteringCondition,
    MinorChecksCondition falseCeilingsCondition,
    MinorChecksCondition masonProblemCondition,
    MinorChecksCondition otherProblemCondition,
  })  : this.photos = photos ?? [],
        this.paintingCondition = paintingCondition ?? MinorChecksCondition(),
        this.plasteringCondition = paintingCondition ?? MinorChecksCondition(),
        this.falseCeilingsCondition =
            paintingCondition ?? MinorChecksCondition(),
        this.masonProblemCondition =
            paintingCondition ?? MinorChecksCondition(),
        this.otherProblemCondition =
            paintingCondition ?? MinorChecksCondition();

  factory Ceiling.fromJson(Map<String, dynamic> json) =>
      _$CeilingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CeilingToJson(this);
}
