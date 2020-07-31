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
        : ImageAndComment.fromJson(json['dishWasher'] as Map<String, dynamic>),
    garbageDisposal: json['garbageDisposal'] == null
        ? null
        : ImageAndComment.fromJson(
            json['garbageDisposal'] as Map<String, dynamic>),
    kitchenSink: json['kitchenSink'] == null
        ? null
        : ImageAndComment.fromJson(json['kitchenSink'] as Map<String, dynamic>),
    gasAndGasStove: json['gasAndGasStove'] == null
        ? null
        : ImageAndComment.fromJson(
            json['gasAndGasStove'] as Map<String, dynamic>),
    plumbing: json['plumbing'] == null
        ? null
        : ImageAndComment.fromJson(json['plumbing'] as Map<String, dynamic>),
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
    comment: json['comment'] as String,
    material: json['material'] as String,
  );
}

Map<String, dynamic> _$KitchenCabinetToJson(KitchenCabinet instance) =>
    <String, dynamic>{
      'material': instance.material,
      'comment': instance.comment,
      'photos': instance.photos,
    };
