part of 'toilet_inspection.dart';

@JsonSerializable()
class WaterCloset implements BaseModelWithConditionAndPhotos {
  @override
  String condition;

  @override
  List<String> photos;

  WaterCloset({List<String> photos, this.condition})
      : this.photos = photos ?? [];

  factory WaterCloset.fromJson(Map<String, dynamic> json) =>
      _$WaterClosetFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WaterClosetToJson(this);
}
