// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kitchen_inspection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KitchenInspection _$KitchenInspectionFromJson(Map<String, dynamic> json) {
  return KitchenInspection(
    kitchenCabinet: json['kitchenCabinet'] == null
        ? null
        : KitchenCabinet.fromJson(
            json['kitchenCabinet'] as Map<String, dynamic>),
    dishWasher: json['dishWasher'] == null
        ? null
        : DishWasher.fromJson(json['dishWasher'] as Map<String, dynamic>),
    garbageDisposal: json['garbageDisposal'] == null
        ? null
        : GarbageDisposal.fromJson(
            json['garbageDisposal'] as Map<String, dynamic>),
    kitchenSink: json['kitchenSink'] == null
        ? null
        : KitchenSink.fromJson(json['kitchenSink'] as Map<String, dynamic>),
    gasAndGasStove: json['gasAndGasStove'] == null
        ? null
        : GasAndGasStove.fromJson(
            json['gasAndGasStove'] as Map<String, dynamic>),
    plumbing: json['plumbing'] == null
        ? null
        : Plumbing.fromJson(json['plumbing'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$KitchenInspectionToJson(KitchenInspection instance) =>
    <String, dynamic>{
      'kitchenCabinet': instance.kitchenCabinet?.toJson(),
      'dishWasher': instance.dishWasher?.toJson(),
      'garbageDisposal': instance.garbageDisposal?.toJson(),
      'kitchenSink': instance.kitchenSink?.toJson(),
      'gasAndGasStove': instance.gasAndGasStove?.toJson(),
      'plumbing': instance.plumbing?.toJson(),
    };

KitchenCabinet _$KitchenCabinetFromJson(Map<String, dynamic> json) {
  return KitchenCabinet(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
    material: json['material'] as String,
  );
}

Map<String, dynamic> _$KitchenCabinetToJson(KitchenCabinet instance) =>
    <String, dynamic>{
      'material': instance.material,
      'condition': instance.condition,
      'photos': instance.photos,
    };

DishWasher _$DishWasherFromJson(Map<String, dynamic> json) {
  return DishWasher(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
  );
}

Map<String, dynamic> _$DishWasherToJson(DishWasher instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'photos': instance.photos,
    };

GarbageDisposal _$GarbageDisposalFromJson(Map<String, dynamic> json) {
  return GarbageDisposal(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
  );
}

Map<String, dynamic> _$GarbageDisposalToJson(GarbageDisposal instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'photos': instance.photos,
    };

KitchenSink _$KitchenSinkFromJson(Map<String, dynamic> json) {
  return KitchenSink(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
  );
}

Map<String, dynamic> _$KitchenSinkToJson(KitchenSink instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'photos': instance.photos,
    };

GasAndGasStove _$GasAndGasStoveFromJson(Map<String, dynamic> json) {
  return GasAndGasStove(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
  );
}

Map<String, dynamic> _$GasAndGasStoveToJson(GasAndGasStove instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'photos': instance.photos,
    };

Plumbing _$PlumbingFromJson(Map<String, dynamic> json) {
  return Plumbing(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    condition: json['condition'] as String,
  );
}

Map<String, dynamic> _$PlumbingToJson(Plumbing instance) => <String, dynamic>{
      'condition': instance.condition,
      'photos': instance.photos,
    };
