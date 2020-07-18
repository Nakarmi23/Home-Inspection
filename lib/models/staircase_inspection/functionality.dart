part of 'staircase_inspection.dart';

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
