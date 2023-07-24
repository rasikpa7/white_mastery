import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:white_mastery/const/url.dart';

class HomeServices {
  final dio = Dio(
      BaseOptions(baseUrl: baseUrl, queryParameters: {'client_id': accessKey},
      responseType: ResponseType.plain));

  Future<Response<dynamic>?> getPhotos() async {
    try {
      final response = await dio.get('photos'); 
      return response;
    } catch (e) {
      log('something went wrong on getphotos services $e');
    }
  }

    Future<Response<dynamic>?> search({required query}) async {
    try {
      final response = await dio.get('search/photos',queryParameters: {'query':query}); 
      return response;
    } catch (e) {
      log('something went wrong on search services $e');
    }
  }
}
