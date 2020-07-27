part of 'structural_inspection.dart';

@JsonSerializable(explicitToJson: true)
class VisualInspection extends BaseModel {
  String location;
  Spalling spalling;
  Tilting tilting;
  Bulging bulging;
  Cracking cracking;
  List<OtherProblem> otherProblems;

  VisualInspection({
    this.location,
    Spalling spalling,
    Tilting tilting,
    Bulging bulging,
    Cracking cracking,
    List<OtherProblem> otherProblems,
  })  : this.otherProblems = otherProblems ?? [],
        this.spalling = spalling ?? Spalling(),
        this.tilting = tilting ?? Tilting(),
        this.bulging = bulging ?? Bulging(),
        this.cracking = cracking ?? Cracking();

  factory VisualInspection.fromJson(Map<String, dynamic> json) =>
      _$VisualInspectionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VisualInspectionToJson(this);
}

@JsonSerializable()
class Spalling implements BaseModelWithCommentAndPhotos {
  @override
  String comment;

  @override
  List<String> photos;

  Spalling({List<String> photos, this.comment}) : this.photos = photos ?? [];

  factory Spalling.fromJson(Map<String, dynamic> json) =>
      _$SpallingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SpallingToJson(this);
}

@JsonSerializable()
class Tilting implements BaseModelWithCommentAndPhotos {
  String tiltingReading;
  List<String> digitalLevelMeterPhotos;

  @override
  String comment;

  @override
  List<String> photos;

  Tilting(
      {this.comment,
      List<String> photos,
      this.tiltingReading,
      List<String> digitalLevelMeterPhotos})
      : this.photos = photos ?? [],
        this.digitalLevelMeterPhotos = digitalLevelMeterPhotos ?? [];

  factory Tilting.fromJson(Map<String, dynamic> json) =>
      _$TiltingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TiltingToJson(this);
}

@JsonSerializable()
class Bulging implements BaseModelWithCommentAndPhotos {
  double height, depth;

  @override
  String comment;

  @override
  List<String> photos;

  Bulging({this.comment, this.height, List<String> photos, this.depth})
      : this.photos = photos ?? [];

  factory Bulging.fromJson(Map<String, dynamic> json) =>
      _$BulgingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BulgingToJson(this);
}

@JsonSerializable()
class Cracking implements BaseModelWithCommentAndPhotos {
  double depth, width;

  @override
  String comment;

  @override
  List<String> photos;

  Cracking({this.comment, this.depth, List<String> photos, this.width})
      : this.photos = photos ?? [];

  factory Cracking.fromJson(Map<String, dynamic> json) =>
      _$CrackingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CrackingToJson(this);
}

@JsonSerializable()
class OtherProblem implements BaseModelWithCommentAndPhotos {
  String name;

  @override
  String comment;

  @override
  List<String> photos;

  OtherProblem({this.comment, List<String> photos, this.name})
      : this.photos = photos ?? [];

  factory OtherProblem.fromJson(Map<String, dynamic> json) =>
      _$OtherProblemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OtherProblemToJson(this);
}
