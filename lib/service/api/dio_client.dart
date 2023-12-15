import 'package:dio/dio.dart';
import 'package:select_one/config_dev.dart';

class DioClient {
  final Dio _dio = Dio();
  final baseUrl = AppConfig.baseUrl;
  final connectTimeout = AppConfig.connectTimeout;
  final receiveTimeout = AppConfig.receiveTimeout;

  DioClient() {
    // Dio 配置
    _dio
      ..options.baseUrl = baseUrl // 设置你的 API 基地址
      ..options.connectTimeout =
          Duration(seconds: connectTimeout) // 连接服务器超时时间，单位是毫秒.
      ..options.receiveTimeout =
          Duration(seconds: receiveTimeout); // 接收数据的最长时限.

    // 添加拦截器（可选）
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // 在请求被发送之前做一些事情
      return handler.next(options); // 继续请求/响应处理
    }, onResponse: (response, handler) {
      // 在响应数据返回之前做一些预处理
      return handler.next(response); // 继续响应处理
    }, onError: (DioException error, handler) {
      // 当请求失败时做一些预处理
      return handler.next(error); // 继续错误处理
    }));
  }

  // GET 请求
  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      return await _dio.get(endpoint, queryParameters: params);
    } on DioException catch (e) {
      // 处理错误
      throw e;
    }
  }

  // POST 请求
  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } on DioException catch (e) {
      // 处理错误
      throw e;
    }
  }

// 其他请求方法（PUT, DELETE等）可以按需添加
}
