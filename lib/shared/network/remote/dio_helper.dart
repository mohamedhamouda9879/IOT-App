import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: '',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String Url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? auth,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.get(
      Url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String Url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? auth,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return dio.post(Url, queryParameters: query, data: data);
  }
}
