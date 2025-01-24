class ApiErrorModel {
  final String code;
  final String message;
  final String field;

  ApiErrorModel({
    required this.code,
    required this.message,
    required this.field,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      code: json['code'] ?? '',
      message: json['message'] ?? '',
      field: json['field'] ?? '',
    );
  }
}
