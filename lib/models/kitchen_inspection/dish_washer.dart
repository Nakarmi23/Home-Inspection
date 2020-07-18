part of 'kitchen_inspection.dart';

@JsonSerializable()
class DishWasher implements BaseModelWithConditionAndPhotos {
  @override
  String condition;

  @override
  List<String> photos;

  DishWasher({List<String> photos, this.condition})
      : this.photos = photos ?? [];

  factory DishWasher.fromJson(Map<String, dynamic> json) =>
      _$DishWasherFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DishWasherToJson(this);
}
