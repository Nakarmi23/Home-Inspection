import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inspection_file_info.g.dart';

@JsonSerializable()
class InspectionFileInfo extends BaseModel {
  int id;
  String name;
  String address;
  String fileName;
  String path;

  InspectionFileInfo(
      {this.id, this.name, this.address, this.fileName, this.path});

  factory InspectionFileInfo.fromJson(Map<String, dynamic> json) =>
      _$InspectionFileInfoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InspectionFileInfoToJson(this);
}
