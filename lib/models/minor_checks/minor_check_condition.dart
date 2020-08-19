import 'package:house_review/models/base_model.dart';
import 'package:house_review/models/image_comment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'minor_check_condition.g.dart';

@JsonSerializable()
class MinorChecksCondition implements ImageAndComment {
  int condition;
  @override
  String comment;

  String otherFixtureName;

  @override
  List<String> photos;

  MinorChecksCondition(
      {this.condition = 0,
      List<String> photos,
      this.comment,
      this.otherFixtureName})
      : this.photos = photos ?? [];

  factory MinorChecksCondition.fromJson(Map<String, dynamic> json) =>
      _$MinorChecksConditionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MinorChecksConditionToJson(this);
}
