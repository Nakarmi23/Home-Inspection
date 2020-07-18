part of 'kitchen_inspection.dart';

@JsonSerializable()
class Plumbing implements BaseModelWithConditionAndPhotos {
  @override
  String condition;

  @override
  List<String> photos;

  Plumbing({List<String> photos, this.condition}) : this.photos = photos ?? [];

  factory Plumbing.fromJson(Map<String, dynamic> json) =>
      _$PlumbingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PlumbingToJson(this);
}
