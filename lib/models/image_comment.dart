import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'image_comment.g.dart';

@JsonSerializable()
class ImageAndComment {
  String comment;
  List<String> photos;

  ImageAndComment({List<String> photos, this.comment})
      : this.photos = photos ?? [];

  factory ImageAndComment.fromJson(Map<String, dynamic> json) =>
      _$ImageAndCommentFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ImageAndCommentToJson(this);
}
