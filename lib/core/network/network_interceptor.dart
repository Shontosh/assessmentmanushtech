
import 'package:assesmentmanushtech/core/services/auth_service.dart';
import 'package:dio/dio.dart';

class NetworkInterceptor extends InterceptorsWrapper {
  NetworkInterceptor(this.authService);
  final AuthService authService;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await authService.getAccessToken();
    //Log.i('token: $token, headers: ${options.headers}');

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    //Log.i('updated headers: ${options.headers}');
    // Proceed to the next step
    //return super.onRequest(options, handler);
    handler.next(options);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // You can handle specific responses if needed

    // Proceed to the next step
    //return super.onResponse(response, handler);
    handler.next(response);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    // Optionally handle specific errors like token expiration or network issues

    //return super.onError(err, handler); // Proceed to the next step
    handler.next(err);
  }
}
