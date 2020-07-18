import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'toilet_inspection.g.dart';

@JsonSerializable(explicitToJson: true)
class ToiletInspection extends BaseModel {
  WashBasin washBasin;
  Mirror mirror;
  WaterCloset waterCloset;
  Flush flush;
  Plumbing plumbing;
  ToiletInspection({
    this.washBasin,
    this.mirror,
    this.waterCloset,
    this.flush,
    this.plumbing,
  });
  factory ToiletInspection.fromJson(Map<String, dynamic> json) =>
      _$ToiletInspectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ToiletInspectionToJson(this);
}

@JsonSerializable()
class WashBasin implements BaseModelWithConditionAndPhotos {
  @override
  String condition;

  @override
  List<String> photos;

  WashBasin({List<String> photos, this.condition}) : this.photos = photos ?? [];

  factory WashBasin.fromJson(Map<String, dynamic> json) =>
      _$WashBasinFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WashBasinToJson(this);
}

@JsonSerializable()
class Mirror implements BaseModelWithConditionAndPhotos {
  @override
  String condition;

  @override
  List<String> photos;

  Mirror({List<String> photos, this.condition}) : this.photos = photos ?? [];

  factory Mirror.fromJson(Map<String, dynamic> json) => _$MirrorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MirrorToJson(this);
}

@JsonSerializable()
class WaterCloset implements BaseModelWithConditionAndPhotos {
  @override
  String condition;

  @override
  List<String> photos;

  WaterCloset({List<String> photos, this.condition})
      : this.photos = photos ?? [];

  factory WaterCloset.fromJson(Map<String, dynamic> json) =>
      _$WaterClosetFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WaterClosetToJson(this);
}

@JsonSerializable()
class Flush implements BaseModelWithConditionAndPhotos {
  @override
  String condition;

  @override
  List<String> photos;

  Flush({List<String> photos, this.condition}) : this.photos = photos ?? [];

  factory Flush.fromJson(Map<String, dynamic> json) => _$FlushFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FlushToJson(this);
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
