import 'package:dio/dio.dart';

final Dio dio = Dio();
CancelToken cancelToken = CancelToken();

class DioInterceptors {
  // For UserService Interceptors
  static Future<Dio> userServiceInterceptors(context) async {
    dio.interceptors.clear();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (option, handler) async {
          option.headers["Content-Type"] = "application/json";
          option.headers["Authorization"] =
              "Bearer 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";
          option.connectTimeout = const Duration(seconds: 60);
          option.receiveTimeout = const Duration(seconds: 60);
          return handler.next(option); //continue
        },
        onResponse: (response, handler) async {
          return handler.next(response); // continue
        },
        onError: (dioError, handler) async {
          return handler.next(dioError);
        },
      ),
    );
    return dio;
  }

  static void cancelRequest() {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel('Request cancelled by user');
    }
  }
}
