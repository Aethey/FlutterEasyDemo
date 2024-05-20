import 'package:dio/dio.dart';
import 'package:select_one/config_dev.dart';

class DioClient {
  final Dio _dio = Dio();
  final baseUrl = AppConfig.baseUrl;
  final connectTimeout = AppConfig.connectTimeout;
  final receiveTimeout = AppConfig.receiveTimeout;

  DioClient() {
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = Duration(seconds: connectTimeout)
      ..options.receiveTimeout = Duration(seconds: receiveTimeout);

    // interceptor(optional)
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // do before request
      return handler.next(options);
    }, onResponse: (response, handler) {
      // Do some preprocessing before the response data return
      return handler.next(response);
    }, onError: (DioException error, handler) {
      // error process
      return handler.next(error);
    }));
  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      return await _dio.get(endpoint, queryParameters: params);
    } on DioException catch (e) {
      throw e;
    }
  }

  Future<Response> post(String endpoint, {dynamic body}) async {
    try {
      return await _dio.post(endpoint, data: body);
    } on DioException catch (e) {
      rethrow;
    }
  }
}
