import 'package:house_review/models/base_model.dart';
import 'package:house_review/models/image_comment.dart';
import 'package:house_review/models/minor_checks/minor_check_condition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'minor_checks.g.dart';
part 'door.dart';
part 'window.dart';
part 'ceiling.dart';
part 'wall.dart';
part 'electrical_fitting.dart';
part 'pest_inspection.dart';

@JsonSerializable(explicitToJson: true)
class MinorChecks {
  List<Door> doors;
  List<Window> window;
  List<Ceiling> ceiling;
  List<Wall> wall;
  List<ElectricalFitting> electricalFitting;
  List<PestInspection> pestInspection;
  List<ImageAndComment> carpentry;
  List<ImageAndComment> metalAluminiumWork;
  List<ImageAndComment> cleaning;

  MinorChecks({
    List<Door> doors,
    List<Window> window,
    List<Ceiling> ceiling,
    List<Wall> wall,
    List<ElectricalFitting> electricalFitting,
    List<PestInspection> pestInspection,
    List<ImageAndComment> carpentry,
    List<ImageAndComment> metalAluminiumWork,
    List<ImageAndComment> cleaning,
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
