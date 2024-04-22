// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDetails _$ImageDetailsFromJson(Map<String, dynamic> json) {
  return ImageDetails(
    id: json['id'],
    pageURL: json['pageURL'],
    type: json['type'],
    tags: json['tags'],
    previewURL: json['previewURL'],
    previewWidth: json['previewWidth'],
    previewHeight: json['previewHeight'],
    webformatURL: json['webformatURL'],
    webformatWidth: json['webformatWidth'],
    webformatHeight: json['webformatHeight'],
    largeImageURL: json['largeImageURL'],
    imageWidth: json['imageWidth'],
    imageHeight: json['imageHeight'],
    imageSize: json['imageSize'],
    views: json['views'],
    downloads: json['downloads'],
    collections: json['collections'],
    likes: json['likes'],
    comments: json['comments'],
    user_id: json['user_id'],
    user: json['user'],
    userImageURL: json['userImageURL'],
  );
}

Map<String, dynamic> _$ImageDetailsToJson(ImageDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pageURL': instance.pageURL,
      'type': instance.type,
      'tags': instance.tags,
      'previewURL': instance.previewURL,
      'previewWidth': instance.previewWidth,
      'previewHeight': instance.previewHeight,
      'webformatURL': instance.webformatURL,
      'webformatWidth': instance.webformatWidth,
      'webformatHeight': instance.webformatHeight,
      'largeImageURL': instance.largeImageURL,
      'imageWidth': instance.imageWidth,
      'imageHeight': instance.imageHeight,
      'imageSize': instance.imageSize,
      'views': instance.views,
      'downloads': instance.downloads,
      'collections': instance.collections,
      'likes': instance.likes,
      'comments': instance.comments,
      'user_id': instance.user_id,
      'user': instance.user,
      'userImageURL': instance.userImageURL,
    };
