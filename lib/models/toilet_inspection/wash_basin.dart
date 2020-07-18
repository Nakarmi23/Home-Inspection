part of 'toilet_inspection.dart';

@JsonSerializable()
class WashBasin implements BaseModelWithConditionAndPhotos {
  @override
  String condition;

  @override
  List<String> photos;

  WashBasin({List<String> photos, this.condition}) : this.photos = photos ?? [];

  factory WashBasin.fromJson(Map<String, dynamic> json) =>
      _$WashBasinFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WashBasinToJson(this);
}
