part of 'minor_checks.dart';

@JsonSerializable()
class Carpentry extends BaseModelWithConditionAndPhotos {
  @override
  List<String> photos;
  @override
  String condition;

  Carpentry({
    List<String> photos,
    this.condition,
  }) : this.photos = photos ?? [];

  factory Carpentry.fromJson(Map<String, dynamic> json) =>
      _$CarpentryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CarpentryToJson(this);
}
