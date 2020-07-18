part of 'kitchen_inspection.dart';

@JsonSerializable()
class KitchenSink implements BaseModelWithConditionAndPhotos {
  @override
  String condition;

  @override
  List<String> photos;

  KitchenSink({List<String> photos, this.condition})
      : this.photos = photos ?? [];

  factory KitchenSink.fromJson(Map<String, dynamic> json) =>
      _$KitchenSinkFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KitchenSinkToJson(this);
}
