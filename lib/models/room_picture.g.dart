// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomPicture _$RoomPictureFromJson(Map<String, dynamic> json) {
  return RoomPicture(
    roomId: json['roomId'] as int,
    picture: json['picture'] as String,
  );
}

Map<String, dynamic> _$RoomPictureToJson(RoomPicture instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'picture': instance.picture,
    };
