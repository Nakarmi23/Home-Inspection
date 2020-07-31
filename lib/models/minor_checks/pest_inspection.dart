part of 'minor_checks.dart';

@JsonSerializable()
class PestInspection implements ImageAndComment {
  String surroundingCondition;
  @override
  String comment;
  @override
  List<String> photos;

  PestInspection({
    List<String> photos,
    this.comment,
    this.surroundingCondition,
  }) : this.photos = photos ?? [];

  factory PestInspection.fromJson(Map<String, dynamic> json) =>
      _$PestInspectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PestInspectionToJson(this);
}
