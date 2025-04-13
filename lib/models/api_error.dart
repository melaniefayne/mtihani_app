import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';
part 'api_error.g.dart';

@freezed
class ApiErrorModel with _$ApiErrorModel {
  factory ApiErrorModel({
    bool? status,
    String? message,
    String? msg,
    bool? error,
    String? errors,
  }) = _ApiErrorModel;

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
}
