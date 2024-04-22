import 'dart:convert';
import 'dart:developer';
import 'package:gapopo_media/constants/app_constants.dart';
import 'package:gapopo_media/services/http_service.dart';
import 'package:gapopo_media/model/image_details.dart';
import 'package:gapopo_media/services/base_list_provider.dart';
import 'package:http/http.dart' as http;

class HomeController extends BaseListProvider {
  // #region Properties
  late HttpService httpService;

  HomeController() {
    httpService = HttpService();
    getImages();
  }

  List<ImageDetails> _imageDetailsList = [];
  List<ImageDetails> get imageDetailsList => _imageDetailsList;

  void setImageDetailsList(dynamic data){
    _imageDetailsList = data;
    notifyListeners();
  }
  // #region GET Images
  Future<void> getImages() async {
    try {
      await httpService.request(
          url: pixabayPhotoUrl,
          method: Method.get,
          queryParams: {
            'image_type': 'photo',
          //  'q':'flower'
          },
          onSuccess: (data) {
            List<ImageDetails> _tempList = [];
            _imageDetailsList.clear();
            List<dynamic> imgList = data;
            for (var item in imgList) {
              ImageDetails imageDetails = ImageDetails(
                id: item['id'],
                pageURL: item['pageURL'],
                type: item['type'],
                tags: item['tags'],
                previewURL: item['previewURL'],
                previewWidth: item['previewWidth'],
                previewHeight: item['previewHeight'],
                webformatURL: item['webformatURL'],
                webformatWidth: item['webformatWidth'],
                webformatHeight: item['webformatHeight'],
                largeImageURL: item['largeImageURL'],
                imageWidth: item['imageWidth'],
                imageHeight: item['imageHeight'],
                imageSize: item['imageSize'],
                views: item['views'],
                downloads: item['downloads'],
                collections: item['collections'],
                likes: item['likes'],
                comments: item['comments'],
                user_id: item['user_id'],
                user: item['user'],
                userImageURL: item['userImageURL'],
              );
              _tempList.add(imageDetails);
            }  
            setImageDetailsList(_tempList)  ;    
          });
      } catch (error) {
      final currentTime = DateTime.now();
      log('$currentTime - HomeController - getImages error: $error');
    }
  }
  // #endregion
}
