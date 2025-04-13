// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam.freezed.dart';
part 'exam.g.dart';

@freezed
class ExamModel with _$ExamModel {
  factory ExamModel({
    int? id,
    int? grade,
    String? code,
    String? class_name,
    String? status,
    int? duration_min,
    DateTime? start_time,
    DateTime? end_time,
  }) = _ExamModel;

  factory ExamModel.fromJson(Map<String, dynamic> json) =>
      _$ExamModelFromJson(json);
}
