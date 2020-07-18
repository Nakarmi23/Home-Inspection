part of 'staircase_inspection.dart';

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
