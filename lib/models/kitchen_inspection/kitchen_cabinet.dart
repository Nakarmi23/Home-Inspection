part of 'kitchen_inspection.dart';

@JsonSerializable()
class KitchenCabinet implements BaseModelWithConditionAndPhotos {
  String material;
  @override
  String condition;

  @override
  List<String> photos;

  KitchenCabinet({List<String> photos, this.condition, this.material})
      : this.photos = photos ?? [];

  factory KitchenCabinet.fromJson(Map<String, dynamic> json) =>
      _$KitchenCabinetFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KitchenCabinetToJson(this);
}
