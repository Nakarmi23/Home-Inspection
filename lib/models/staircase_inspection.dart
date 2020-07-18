import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staircase_inspection.g.dart';

@JsonSerializable(explicitToJson: true)
class StaircaseInspection extends BaseModel {
  ClearanceCondition clearanceCondition;
  Railing railing;
  Functionality functionality;

  StaircaseInspection({
    this.clearanceCondition,
    this.railing,
    this.functionality,
  });

  factory StaircaseInspection.fromJson(Map<String, dynamic> json) =>
      _$StaircaseInspectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StaircaseInspectionToJson(this);
}

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

@JsonSerializable()
class Railing implements BaseModelWithCommentAndPhotos {
  @override
  String comment;

  @override
  List<String> photos;

  Railing({List<String> photos, this.comment}) : this.photos = photos ?? [];

  factory Railing.fromJson(Map<String, dynamic> json) =>
      _$RailingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RailingToJson(this);
}

@JsonSerializable()
class Functionality implements BaseModelWithCommentAndPhotos {
  @override
  String comment;

  @override
  List<String> photos;

  Functionality({List<String> photos, this.comment})
      : this.photos = photos ?? [];

  factory Functionality.fromJson(Map<String, dynamic> json) =>
      _$FunctionalityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FunctionalityToJson(this);
}
