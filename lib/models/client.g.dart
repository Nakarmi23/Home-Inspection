// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client(
    id: json['id'] as int,
    name: json['name'] as String,
    address: json['address'] as String,
    dateOfInspection: json['dateOfInspection'] == null
        ? null
        : DateTime.parse(json['dateOfInspection'] as String),
  );
}

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'dateOfInspection': instance.dateOfInspection?.toIso8601String(),
    };
