import 'package:dio/dio.dart';
import 'package:morket_ai/core/constants/api_constant.dart';

class NetworkClient{
  late final Dio dio;
  final String? token;

  NetworkClient([this.token]){
    dio = Dio();
    dio.options.baseUrl= ApiConstants.baseUrl;
    dio.options.headers= {'Content-Type': 'application/json'};

    //log interceptornuya buat logging
    dio.interceptors.add(LogInterceptor());

    //interceptor token
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['authorization']= "Bearer $token";
        handler.next(options);
      }
    ));
  }

}