

import 'package:dio/dio.dart';

import '../local/storage_repository.dart';

class SecureApiClient {
  SecureApiClient() {
    _init();
  }

  late Dio dio;

  void _init() {
    dio = Dio();
    dio.options = BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        "Authorization": StorageRepository.getString("token")

      },
      receiveTimeout: const Duration(seconds: 5),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse: (Response<dynamic> response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }
}
