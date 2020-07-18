part of 'minor_checks.dart';

@JsonSerializable()
class Cleaning extends BaseModel {
  List<String> photos;
  String condition;

  Cleaning({
    List<String> photos,
    this.condition,
  }) : this.photos = photos ?? [];

  factory Cleaning.fromJson(Map<String, dynamic> json) =>
      _$CleaningFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CleaningToJson(this);
}
