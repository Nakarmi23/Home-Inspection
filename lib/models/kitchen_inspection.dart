import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kitchen_inspection.g.dart';

@JsonSerializable(explicitToJson: true)
class KitchenInspection extends BaseModel {
  KitchenCabinet kitchenCabinet;
  DishWasher dishWasher;
  GarbageDisposal garbageDisposal;
  KitchenSink kitchenSink;
  GasAndGasStove gasAndGasStove;
  Plumbing plumbing;

  KitchenInspection({
    this.kitchenCabinet,
    this.dishWasher,
    this.garbageDisposal,
    this.kitchenSink,
    this.gasAndGasStove,
    this.plumbing,
  });

  factory KitchenInspection.fromJson(Map<String, dynamic> json) =>
      _$KitchenInspectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KitchenInspectionToJson(this);
}

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
