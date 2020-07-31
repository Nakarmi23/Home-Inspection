part of 'kitchen_inspection.dart';

@JsonSerializable()
class KitchenCabinet implements ImageAndComment {
  String material;
  @override
  String comment;

  @override
  List<String> photos;

  KitchenCabinet({List<String> photos, this.comment, this.material})
      : this.photos = photos ?? [];

  factory KitchenCabinet.fromJson(Map<String, dynamic> json) =>
      _$KitchenCabinetFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KitchenCabinetToJson(this);
}
