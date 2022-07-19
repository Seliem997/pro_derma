import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://pro-derma.net/api/',
        // baseUrl: 'https://student.valuxapps.com/api/',
        // baseUrl: 'http://pro-derma.net/api',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'User-Agent': 'PostmanRuntime/7.29.2',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Accept': '*/*',
      'lang': lang,
      'Authorization': token ?? '',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'User-Agent': 'PostmanRuntime/7.29.2',
      // 'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Accept': '*/*',
      // 'lang': lang,
      // 'Authorization': token ?? '',
      'Postman-Token': token ?? '',
    };

    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'User-Agent': 'PostmanRuntime/7.29.2',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
      'Accept': '*/*',
      'lang': lang,
      'Authorization': token ?? '',
    };

    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
