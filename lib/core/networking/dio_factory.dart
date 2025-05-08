import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;
  static getDio() {
    Duration item = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();

      dio!.options.connectTimeout = item;
      dio!.options.receiveTimeout = item;
      addDiointerceptors();

      return dio;
    } else {
      return dio;
    }
  }

  static void addDiointerceptors() {
    dio!.interceptors.add(PrettyDioLogger(
      request: true,
      error: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }
}




  // DioFactory() {
  //   // Duration item = const Duration(seconds: 30);
  //   dio ??= Dio(BaseOptions(
  //     receiveDataWhenStatusError: true,
  //     // connectTimeout: item,
  //     // receiveTimeout: item
  //   ));
  //   // dio!.interceptors.add(PrettyDioLogger(
  //   //   request: true,
  //   //   error: true,
  //   //   requestBody: true,
  //   //   requestHeader: true,
  //   //   responseBody: true,
  //   //   responseHeader: true,
  //   // ));
  // }