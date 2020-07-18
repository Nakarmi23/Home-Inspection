part of 'toilet_inspection.dart';

@JsonSerializable()
class Mirror implements BaseModelWithConditionAndPhotos {
  @override
  String condition;

  @override
  List<String> photos;

  Mirror({List<String> photos, this.condition}) : this.photos = photos ?? [];

  factory Mirror.fromJson(Map<String, dynamic> json) => _$MirrorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MirrorToJson(this);
}
