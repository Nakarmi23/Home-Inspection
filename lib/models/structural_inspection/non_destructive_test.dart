part of 'structural_inspection.dart';

@JsonSerializable()
class NonDestructiveTest extends BaseModel {
  String structureElement;
  String concreteGrade;
  String impactDirection;
  String location;
  List<double> readings;
  List<String> photoSchmidtHammer;

  NonDestructiveTest({
    this.structureElement,
    this.concreteGrade,
    this.impactDirection,
    this.location,
    List<double> readings,
    List<String> photoSchmidtHammer,
  })  : this.readings = readings ?? [],
        this.photoSchmidtHammer = photoSchmidtHammer ?? [];

  factory NonDestructiveTest.fromJson(Map<String, dynamic> json) =>
      _$NonDestructiveTestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NonDestructiveTestToJson(this);
}
