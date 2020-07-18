// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'non_destructive_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NonDestructiveTest _$NonDestructiveTestFromJson(Map<String, dynamic> json) {
  return NonDestructiveTest(
    structureElement: json['structureElement'] as String,
    concreteGrade: json['concreteGrade'] as String,
    impactDirection: json['impactDirection'] as String,
    location: json['location'] as String,
    readings: (json['readings'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$NonDestructiveTestToJson(NonDestructiveTest instance) =>
    <String, dynamic>{
      'structureElement': instance.structureElement,
      'concreteGrade': instance.concreteGrade,
      'impactDirection': instance.impactDirection,
      'location': instance.location,
      'readings': instance.readings,
    };
