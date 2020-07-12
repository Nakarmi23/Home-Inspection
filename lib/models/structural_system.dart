import 'package:house_review/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'structural_system.g.dart';

@JsonSerializable()
class StructuralSystem extends BaseModel {
  int id;
  String systemName;
  bool isEditable;

  StructuralSystem({
    this.id,
    this.systemName,
    this.isEditable,
  });

  factory StructuralSystem.fromJson(Map<String, dynamic> json) =>
      _$StructuralSystemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StructuralSystemToJson(this);
}
