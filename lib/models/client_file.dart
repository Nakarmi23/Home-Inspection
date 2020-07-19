import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_file.g.dart';

@JsonSerializable()
class ClientFile extends BaseModel {
  int id;
  String name;
  String address;
  String path;

  ClientFile({this.id, this.name, this.address, this.path});

  factory ClientFile.fromJson(Map<String, dynamic> json) =>
      _$ClientFileFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ClientFileToJson(this);
}
