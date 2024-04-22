import 'package:flutter/foundation.dart';

class ApiResponse {
  // int? get total => body["total"];
  // int? get totalPageCount => body["totalHits"];
  Map<String,dynamic>? get data => body;
  // Just a way of saying there was no error with the request and response return
  //bool get allGood => errors!.isEmpty;
 //// bool hasError() => errors!.isNotEmpty;
  bool hasData() => data != null;
 // int? code;
 // String? message;
  dynamic body;
 // List? errors;

  ApiResponse({
   // this.code,
  //  this.message,
    this.body,
   // this.errors,
  });

  factory ApiResponse.fromResponse(dynamic response) {
  //  int? code = response.statusCode;
    dynamic body = response; // Would mostly be a Map
 //   List errors = [];
  //  String? message = "";
    // switch (code) {
    //   case 200:
    //     try {
    //       if (body is Map && body.containsKey("message")) {
    //         message = body["message"];
    //       }
    //     } catch (error) {
    //       if (kDebugMode) {
    //         final currentTime = DateTime.now();
    //         print("$currentTime - ApiResponse - Message reading error ==> $error");
    //       }
    //     }
    //     break;
    //   default:
    //     // message = body["message"] ?? "Whoops Something went wrong, please contact support.";
    //     // errors.add(message);
    //     break;
    // }
    return ApiResponse(
      //code: code,
      //message: message,
      body: body,
      //errors: errors,
    );
  }
}
