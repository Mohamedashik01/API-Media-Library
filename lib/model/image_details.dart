
import 'package:json_annotation/json_annotation.dart';
part 'image_details.g.dart';

@JsonSerializable()
class ImageDetails{
  dynamic id;
  dynamic pageURL;
  dynamic type;
  dynamic tags;
  dynamic previewURL;
  dynamic previewWidth;
  dynamic previewHeight;
  dynamic webformatURL;
  dynamic webformatWidth;
  dynamic webformatHeight;
  dynamic largeImageURL;
  dynamic imageWidth;
  dynamic imageHeight;
  dynamic imageSize;
  dynamic views;
  dynamic downloads;
  dynamic collections;
  dynamic likes;
  dynamic comments;
  dynamic user_id;
  dynamic user;
  dynamic userImageURL;    

  ImageDetails({
    this.id,
    this.pageURL,
    this.type,
    this.tags,
    this.previewURL,
    this.previewWidth,
    this.previewHeight,
    this.webformatURL,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageURL,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.collections,
    this.likes,
    this.comments,
    this.user_id,
    this.user,
    this.userImageURL,  
  });

  factory ImageDetails.fromJson(Map<dynamic, dynamic> json) => _$ImageDetailsFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$ImageDetailsToJson(this);
}

 