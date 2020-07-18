part of 'structural_inspection.dart';

@JsonSerializable()
class NonDestructiveTest extends BaseModel {
  String structureElement;
  String concreteGrade;
  String impactDirection;
  String location;
  List<String> readings;

  NonDestructiveTest(
      {this.structureElement,
      this.concreteGrade,
      this.impactDirection,
      this.location,
      List<String> readings})
      : this.readings = readings ?? [];

  factory NonDestructiveTest.fromJson(Map<String, dynamic> json) =>
      _$NonDestructiveTestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NonDestructiveTestToJson(this);
}
