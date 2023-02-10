import 'package:dio/dio.dart';

class JLInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(options.path);
    super.onRequest(options, handler);
  }
}
