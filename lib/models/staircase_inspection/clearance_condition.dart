part of 'staircase_inspection.dart';

@JsonSerializable()
class ClearanceCondition implements BaseModelWithCommentAndPhotos {
  @override
  String comment;

  @override
  List<String> photos;

  ClearanceCondition({List<String> photos, this.comment})
      : this.photos = photos ?? [];

  factory ClearanceCondition.fromJson(Map<String, dynamic> json) =>
      _$ClearanceConditionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ClearanceConditionToJson(this);
}
