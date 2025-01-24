
import 'package:assesmentmanushtech/core/error/exceptions.dart';
import 'package:assesmentmanushtech/core/models/api_response.dart';
import 'package:assesmentmanushtech/core/util/app_logger.dart';
import 'package:dio/dio.dart';

class ReturnResponse<T> {
  T call(Response<dynamic> response,
      T Function(Map<String, dynamic> json) fromJsonFunc) {
    try {
      final statusCode = response.statusCode;
      final ApiResponse responseData = ApiResponse.fromJson(response.data);

      if (statusCode == null) {
        throw ServerException(error: responseData.message);
      }

      if (statusCode >= 200 && statusCode <= 300) {
        return fromJsonFunc(responseData.data);
      }
      else if (statusCode >= 400 && statusCode < 500) {
        if (responseData.error.isNotEmpty) {
          final errorMessage = responseData.error;
          throw ApiException(error: errorMessage);
        } else {
          throw ApiException(error: 'Client error without specific message');
        }
      }
      // Handle server-side errors (5xx and others)
      else {
        throw ServerException(error: responseData.message);
      }
    } on Exception catch (e) {
      Log.e('on exception:: $e');
      rethrow;
    } catch (e) {
      Log.e('on unexpected error:: $e');
      throw UnexpectedException(error: 'Unexpected error: $e');
    }
  }
}
