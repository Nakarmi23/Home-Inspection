part of 'toilet_inspection.dart';

@JsonSerializable()
class Flush implements BaseModelWithConditionAndPhotos {
  @override
  String condition;

  @override
  List<String> photos;

  Flush({List<String> photos, this.condition}) : this.photos = photos ?? [];

  factory Flush.fromJson(Map<String, dynamic> json) => _$FlushFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FlushToJson(this);
}
