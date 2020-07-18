part of 'kitchen_inspection.dart';

@JsonSerializable()
class GarbageDisposal implements BaseModelWithConditionAndPhotos {
  @override
  String condition;

  @override
  List<String> photos;

  GarbageDisposal({List<String> photos, this.condition})
      : this.photos = photos ?? [];

  factory GarbageDisposal.fromJson(Map<String, dynamic> json) =>
      _$GarbageDisposalFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GarbageDisposalToJson(this);
}
