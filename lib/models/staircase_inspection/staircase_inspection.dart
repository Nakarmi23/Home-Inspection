import 'package:house_review/models/base_model.dart';
import 'package:house_review/models/image_comment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staircase_inspection.g.dart';

@JsonSerializable(explicitToJson: true)
class StaircaseInspection extends BaseModel {
  ImageAndComment clearanceCondition;
  ImageAndComment railing;
  ImageAndComment functionality;
  String location;
  String type;
  String material;

  StaircaseInspection({
    ImageAndComment clearanceCondition,
    ImageAndComment railing,
    ImageAndComment functionality,
    this.location,
    this.type,
    this.material,
  })  : this.clearanceCondition = clearanceCondition ?? ImageAndComment(),
        this.railing = railing ?? ImageAndComment(),
        this.functionality = functionality ?? ImageAndComment();

  factory StaircaseInspection.fromJson(Map<String, dynamic> json) =>
      _$StaircaseInspectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StaircaseInspectionToJson(this);
}
