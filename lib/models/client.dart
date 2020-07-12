import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'client.g.dart';

@JsonSerializable()
class Client extends BaseModel {
  int id;
  String name;
  String address;
  DateTime dateOfInspection;

  Client({this.id, this.name, this.address, this.dateOfInspection});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
