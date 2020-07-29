import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kitchen_inspection.g.dart';
part 'kitchen_cabinet.dart';
part 'dish_washer.dart';
part 'garbage_disposal.dart';
part 'kitchen_sink.dart';
part 'gas_and_gas_stove.dart';
part 'plumbing.dart';

@JsonSerializable(explicitToJson: true)
class KitchenInspection extends BaseModel {
  KitchenCabinet kitchenCabinet;
  DishWasher dishWasher;
  GarbageDisposal garbageDisposal;
  KitchenSink kitchenSink;
  GasAndGasStove gasAndGasStove;
  Plumbing plumbing;

  KitchenInspection({
    KitchenCabinet kitchenCabinet,
    DishWasher dishWasher,
    GarbageDisposal garbageDisposal,
    KitchenSink kitchenSink,
    GasAndGasStove gasAndGasStove,
    Plumbing plumbing,
  })  : this.kitchenCabinet = kitchenCabinet ?? KitchenCabinet(),
        this.dishWasher = dishWasher ?? DishWasher(),
        this.garbageDisposal = garbageDisposal ?? GarbageDisposal(),
        this.kitchenSink = kitchenSink ?? KitchenSink(),
        this.gasAndGasStove = gasAndGasStove ?? GasAndGasStove(),
        this.plumbing = plumbing ?? Plumbing();

  factory KitchenInspection.fromJson(Map<String, dynamic> json) =>
      _$KitchenInspectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KitchenInspectionToJson(this);
}
