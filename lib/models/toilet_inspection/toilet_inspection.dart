import 'package:house_review/models/base_model.dart';
import 'package:house_review/models/image_comment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'toilet_inspection.g.dart';

@JsonSerializable(explicitToJson: true)
class ToiletInspection extends BaseModel {
  ImageAndComment washBasin;
  ImageAndComment mirror;
  ImageAndComment waterCloset;
  ImageAndComment flush;
  ImageAndComment plumbing;
  ToiletInspection({
    ImageAndComment washBasin,
    ImageAndComment mirror,
    ImageAndComment waterCloset,
    ImageAndComment flush,
    ImageAndComment plumbing,
  })  : this.washBasin = washBasin ?? ImageAndComment(),
        this.mirror = mirror ?? ImageAndComment(),
        this.waterCloset = ImageAndComment(),
        this.flush = ImageAndComment(),
        this.plumbing = ImageAndComment();
  factory ToiletInspection.fromJson(Map<String, dynamic> json) =>
      _$ToiletInspectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ToiletInspectionToJson(this);
}
