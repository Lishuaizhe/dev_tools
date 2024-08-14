import 'package:dio/dio.dart';

class DioClient {
  // 私有构造函数
  DioClient._internal();

  // 单例对象
  static final DioClient _instance = DioClient._internal();

  // 获取单例对象
  static DioClient get instance => _instance;

  // Dio实例
  late Dio _dio;

  // 初始化Dio
  factory DioClient() {
    _instance._dio = Dio(BaseOptions(
      baseUrl: 'https://api.example.com', // 设置你的基础URL
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));

    // 添加拦截器
    _instance._dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // 在这里你可以添加全局的请求配置，比如添加token
        options.headers['Authorization'] = 'Bearer YOUR_TOKEN';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // 处理响应
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        // 处理错误
        return handler.next(e);
      },
    ));

    return _instance;
  }

  // 获取Dio实例
  Dio get dio => _dio;
}
