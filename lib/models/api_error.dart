import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';

@freezed
class ApiErrorModel with _$ApiErrorModel {
  factory ApiErrorModel({
    String? message,
    String? error,
    String? detail,
  }) = _ApiErrorModel;

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    String? flattened;

    // If it's field-specific validation errors
    if (json.isNotEmpty && json.values.first is List) {
      flattened = json.entries
          .map((e) => "${e.key}: ${(e.value as List).join(', ')}")
          .join('\n');
    } else if (json.containsKey('message')) {
      flattened = json['message'];
    } else if (json.containsKey('error')) {
      flattened = json['error'];
    }

    return ApiErrorModel(
      message: flattened,
      error: json['error'],
      detail: json['detail'],
    );
  }
}
