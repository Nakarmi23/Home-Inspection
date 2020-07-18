import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'minor_checks.g.dart';

@JsonSerializable(explicitToJson: true)
class MinorChecks {
  List<Door> doors;
  List<Window> window;
  List<Ceiling> ceiling;
  List<Wall> wall;
  List<ElectricalFitting> electricalFitting;
  List<PestInspection> pestInspection;
  List<Carpentry> carpentry;
  List<MetalAluminiumWork> metalAluminiumWork;
  List<Cleaning> cleaning;

  MinorChecks({
    List<Door> doors,
    List<Window> window,
    List<Ceiling> ceiling,
    List<Wall> wall,
    List<ElectricalFitting> electricalFitting,
    List<PestInspection> pestInspection,
    List<Carpentry> carpentry,
    List<MetalAluminiumWork> metalAluminiumWork,
    List<Cleaning> cleaning,
  })  : this.doors = doors ?? [],
        this.window = window ?? [],
        this.ceiling = ceiling ?? [],
        this.wall = wall ?? [],
        this.electricalFitting = electricalFitting ?? [],
        this.pestInspection = pestInspection ?? [],
        this.carpentry = carpentry ?? [],
        this.metalAluminiumWork = metalAluminiumWork ?? [],
        this.cleaning = cleaning ?? [];

  factory MinorChecks.fromJson(Map<String, dynamic> json) =>
      _$MinorChecksFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MinorChecksToJson(this);
}

@JsonSerializable()
class Door extends BaseModel {
  String material;
  bool doorFramesCondition;
  bool doorPanelsCondition;
  bool hingesCondition;
  bool holderCondition;
  bool otherFixturesCondition;
  String condition;
  List<String> photos;

  Door({
    this.material,
    this.doorFramesCondition,
    this.doorPanelsCondition,
    this.hingesCondition,
    this.holderCondition,
    this.otherFixturesCondition,
    this.condition,
    List<String> photos,
  }) : this.photos = photos ?? [];
  factory Door.fromJson(Map<String, dynamic> json) => _$DoorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$DoorToJson(this);
}

@JsonSerializable()
class Window extends BaseModel {
  String material;
  bool doorFramesCondition;
  bool doorPanelsCondition;
  bool hingesCondition;
  bool holderCondition;
  bool otherFixturesCondition;
  String condition;
  List<String> photos;

  Window({
    this.material,
    this.doorFramesCondition,
    this.doorPanelsCondition,
    this.hingesCondition,
    this.holderCondition,
    this.otherFixturesCondition,
    this.condition,
    List<String> photos,
  }) : this.photos = photos ?? [];

  factory Window.fromJson(Map<String, dynamic> json) => _$WindowFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WindowToJson(this);
}

@JsonSerializable()
class Ceiling extends BaseModel {
  List<String> photos;
  String condition;
  bool paintingCondition;
  bool plasteringCondition;
  bool falseCeilingsCondition;
  bool masonProblemCondition;
  bool otherProblemCondition;

  Ceiling({
    List<String> photos,
    this.condition,
    this.paintingCondition,
    this.plasteringCondition,
    this.falseCeilingsCondition,
    this.masonProblemCondition,
    this.otherProblemCondition,
  }) : this.photos = photos ?? [];

  factory Ceiling.fromJson(Map<String, dynamic> json) =>
      _$CeilingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CeilingToJson(this);
}

@JsonSerializable()
class Wall extends BaseModel {
  List<String> photos;
  String condition;
  bool paintingCondition;
  bool plasteringCondition;
  bool masonProblemCondition;
  bool otherProblemCondition;

  Wall({
    List<String> photos,
    this.condition,
    this.paintingCondition,
    this.plasteringCondition,
    this.masonProblemCondition,
    this.otherProblemCondition,
  }) : this.photos = photos ?? [];

  factory Wall.fromJson(Map<String, dynamic> json) => _$WallFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WallToJson(this);
}

@JsonSerializable()
class ElectricalFitting extends BaseModel {
  List<String> photos;
  String condition;
  bool wiringCondition;
  bool switchesCondition;
  bool lightsCondition;
  bool ceilingFanCondition;
  bool otherAccessoriesCondition;

  ElectricalFitting({
    List<String> photos,
    this.condition,
    this.wiringCondition,
    this.switchesCondition,
    this.lightsCondition,
    this.ceilingFanCondition,
    this.otherAccessoriesCondition,
  }) : this.photos = photos ?? [];

  factory ElectricalFitting.fromJson(Map<String, dynamic> json) =>
      _$ElectricalFittingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ElectricalFittingToJson(this);
}

@JsonSerializable()
class PestInspection extends BaseModel {
  List<String> photos;
  String condition;
  String surroundingCondition;

  PestInspection({
    List<String> photos,
    this.condition,
    this.surroundingCondition,
  }) : this.photos = photos ?? [];

  factory PestInspection.fromJson(Map<String, dynamic> json) =>
      _$PestInspectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PestInspectionToJson(this);
}

@JsonSerializable()
class Carpentry extends BaseModel {
  List<String> photos;
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
