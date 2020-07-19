// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientFile _$ClientFileFromJson(Map<String, dynamic> json) {
  return ClientFile(
    id: json['id'] as int,
    name: json['name'] as String,
    address: json['address'] as String,
    path: json['path'] as String,
  );
}

Map<String, dynamic> _$ClientFileToJson(ClientFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'path': instance.path,
    };
