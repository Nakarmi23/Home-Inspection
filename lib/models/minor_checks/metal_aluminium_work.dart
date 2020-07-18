part of 'minor_checks.dart';

@JsonSerializable()
class MetalAluminiumWork extends BaseModel {
  List<String> photos;
  String condition;

  MetalAluminiumWork({
    List<String> photos,
    this.condition,
  }) : this.photos = photos ?? [];

  factory MetalAluminiumWork.fromJson(Map<String, dynamic> json) =>
      _$MetalAluminiumWorkFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MetalAluminiumWorkToJson(this);
}
