import 'dart:developer';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:gapopo_media/model/api_response.dart';
import 'package:gapopo_media/constants/app_constants.dart';
// import 'package:orderz/models/apis/locator.dart';
// import 'package:orderz/models/services/navigation/navigation_service.dart';
// import 'package:orderz/utils/utils.dart';
// import 'package:orderz/utils/shared_preferences_utils_impl.dart';
// import 'package:orderz/utils/api.dart';
// import 'package:orderz/models/apis/api_response.dart';

class HttpService {
  Response? response;
  late Dio _dio;
  String host = pixabayPhotoUrl;
  ApiResponse apiResponse = ApiResponse();
 // final NavigationService? navigationService = locator<NavigationService>();

  HttpService() {
    _dio = Dio();
    BaseOptions? baseOptions = BaseOptions(
      baseUrl: host,
      validateStatus: (status) {
        return status! <= 500;
      },
      connectTimeout: 300000,
    );
    _dio = Dio(baseOptions);

    final options = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 1),
      priority: CachePriority.normal,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );
    _dio.interceptors.add(DioCacheInterceptor(options: options));
  }

  //  Future<void> _fetchImages() async {
    
  //   try {
  //     // Make GET request to Pixabay API
  //     Response response = await _dio.get(
  //         'https://pixabay.com/api/?key=YOUR_API_KEY_HERE&image_type=photo');
      
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         _images = response.data['hits'];
  //       });
  //     } else {
  //       // Handle error
  //       print('Failed to load images: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     // Handle Dio errors
  //     print('Error fetching images: $error');
  //   }
  // }

  Future request(
      {required String url,
      required Method method,
      Map<String, dynamic>? queryParams,
      dynamic data,
      Function? onError,
      void Function(List<dynamic> response)? onSuccess,
      Options? options}) async {
    try {
      dynamic token = '43412863-a2357762539045abd5f972470';//await SharedPreferencesUtilsImpl.getAuthBearerToken();
      if (token != null) {
        if (queryParams == null) {
          queryParams = {'key': token};
        } else {
          queryParams.addAll({'key': token});
        }
      }
      //  Toast.show(url);
      if (appType == AppType.debug) {
        log('....................... start .............................');
        log('API URL: $url');
        log('Query params: $queryParams');
        log('Request Body: $data');
        log('Method: $method');
      }
      switch (method) {
        case Method.get:
        Response  response = await _dio.get(url,             
              queryParameters: queryParams);
        //  apiResponse = ApiResponse.fromResponse(response!);
 if (response.statusCode == 200) {
        if (onSuccess != null && response != null) {          
            onSuccess(  response.data['hits']);
          }
          if (appType == AppType.debug) {
            log('statusCode: ${response?.statusCode}');
            log('response: $response');
            log('........................ end ..............................\n');
          }
     
      } else {
        // Handle error
        print('Failed to load images: ${response.statusCode}');
      }
         

          return  response.data['hits'];
        //  break;
     
        case Method.post: break;
        case Method.put: break;
        case Method.delete: break;
      }
    } on DioError catch (e) {
      if (appType == AppType.debug) {
        log('....................... start .............................');
        log('API Error: ');
        log('url: $url, Method: $method');
        log('Error: ${e.error.toString()}');
        log('........................ end ..............................\n');
      }

      if (onError != null) {
        onError(e);
      } else {
        rethrow;
      }
    }
    return apiResponse;
  }
}
