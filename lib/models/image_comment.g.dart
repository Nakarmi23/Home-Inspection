// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageAndComment _$ImageAndCommentFromJson(Map<String, dynamic> json) {
  return ImageAndComment(
    photos: (json['photos'] as List)?.map((e) => e as String)?.toList(),
    comment: json['comment'] as String,
  );
}

Map<String, dynamic> _$ImageAndCommentToJson(ImageAndComment instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'photos': instance.photos,
    };
