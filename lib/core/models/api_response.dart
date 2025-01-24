
import 'package:assesmentmanushtech/core/models/api_error_model.dart';

class ApiResponse {
  final int status;
  final String message;
  final Map<String, dynamic> data;
  final String error;

  ApiResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.error,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: json['data'] ?? {},
      error: json['message'] ??'',
    );
  }

  bool get isSuccess => status == 200;
}
