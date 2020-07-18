part of 'kitchen_inspection.dart';

@JsonSerializable()
class GasAndGasStove implements BaseModelWithConditionAndPhotos {
  @override
  String condition;

  @override
  List<String> photos;

  GasAndGasStove({List<String> photos, this.condition})
      : this.photos = photos ?? [];

  factory GasAndGasStove.fromJson(Map<String, dynamic> json) =>
      _$GasAndGasStoveFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GasAndGasStoveToJson(this);
}
