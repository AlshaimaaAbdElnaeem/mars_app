import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/material.dart';

class Api {
  late Dio _dio ;
  Api(){
    _dio = Dio(
BaseOptions(
  connectTimeout:const Duration(seconds: 180),
  receiveTimeout:const Duration(seconds: 180),
  method: "GET",
  baseUrl: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity",
  receiveDataWhenStatusError: true,
  queryParameters: {
    "api_key":"yRGIraQQgX8BYn7SR5J0XTqo61k7ruBYexmxBwRe",
  },
)
    );
    _dio.interceptors.add(
RetryInterceptor(dio: _dio , retries: 3 , 
retryDelays:const [
  Duration(seconds: 1),
  Duration(seconds: 2),
  Duration(seconds: 3)
]
 )
);
  }
  Future<List<Map<String , dynamic>>> fetchPhotos ()async{
    try {
      final Response response = await _dio.request("latest_photos");
      final data = response.data['latest_photos'];
      print(data);
      return data ;
    } catch (e) {
      if(e is DioException){
       debugPrint (e.message);
      }else {
        debugPrint ("Normal Message $e");
      }
       return [];
    }
  }
  
}