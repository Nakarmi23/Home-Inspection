import 'package:house_review/models/base_model.dart';
import 'package:house_review/models/image_comment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kitchen_inspection.g.dart';
part 'kitchen_cabinet.dart';

@JsonSerializable(explicitToJson: true)
class KitchenInspection extends BaseModel {
  KitchenCabinet kitchenCabinet;
  ImageAndComment dishWasher;
  ImageAndComment garbageDisposal;
  ImageAndComment kitchenSink;
  ImageAndComment gasAndGasStove;
  ImageAndComment plumbing;

  KitchenInspection({
    KitchenCabinet kitchenCabinet,
    ImageAndComment dishWasher,
    ImageAndComment garbageDisposal,
    ImageAndComment kitchenSink,
    ImageAndComment gasAndGasStove,
    ImageAndComment plumbing,
  })  : this.kitchenCabinet = kitchenCabinet ?? KitchenCabinet(),
        this.dishWasher = dishWasher ?? ImageAndComment(),
        this.garbageDisposal = garbageDisposal ?? ImageAndComment(),
        this.kitchenSink = kitchenSink ?? ImageAndComment(),
        this.gasAndGasStove = gasAndGasStove ?? ImageAndComment(),
        this.plumbing = plumbing ?? ImageAndComment();

  factory KitchenInspection.fromJson(Map<String, dynamic> json) =>
      _$KitchenInspectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KitchenInspectionToJson(this);
}
