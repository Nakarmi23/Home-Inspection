import 'package:house_review/models/base_model.dart';
import 'package:house_review/models/building.dart';
import 'package:json_annotation/json_annotation.dart';
part 'inspection_data.g.dart';

@JsonSerializable(explicitToJson: true)
class InspectionData extends BaseModel {
  int id;
  String name;
  String address;
  DateTime dateOfInspection;
  final Building buildingData;

  InspectionData({
    this.id,
    this.name,
    this.address,
    this.dateOfInspection,
    Building buildingData,
  }) : buildingData = buildingData ?? Building();

  factory InspectionData.fromJson(Map<String, dynamic> json) =>
      _$InspectionDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InspectionDataToJson(this);
}
