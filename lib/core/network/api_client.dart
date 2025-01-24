import 'package:assesmentmanushtech/core/constants/api_urls.dart';
import 'package:assesmentmanushtech/core/extensions/num_extension.dart';
import 'package:assesmentmanushtech/core/network/network_interceptor.dart';
import 'package:assesmentmanushtech/core/services/auth_service.dart';
import 'package:assesmentmanushtech/core/storage/storage_adapter.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  late final Dio _dio;
  final _maxLineWidth = 90;
  final AuthService authService;

  ApiClient({Dio? dio, required this.authService}) {
    // init
    _dio = dio ??
        Dio(
          BaseOptions(
            baseUrl: ApiUrls.baseUrl,
            connectTimeout: 60.seconds,
            receiveTimeout: 60.seconds,
          ),
        );

    // Add interceptors
    _dio.interceptors.add(prettyDioLogger);
    _dio.interceptors.add(NetworkInterceptor(authService));
  }

  get prettyDioLogger => PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: _maxLineWidth);

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return _dio.post(path, data: data);
  }

  Future<Response> put(String path, {dynamic data}) async {
    return _dio.put(path, data: data);
  }

  Future<Response> delete(String path, {dynamic data}) async {
    return _dio.delete(path, data: data);
  }

  Future<Response> patch(String path, {dynamic data}) async {
    return _dio.patch(path, data: data);
  }

  Dio get dio => _dio; // Accessor for Dio if needed

  Future<Options> getFormOptions() async {
    final token = await authService.getAccessToken();
    return Options(headers: {
      'accept': 'application/json',
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token'
    });
  }
}
