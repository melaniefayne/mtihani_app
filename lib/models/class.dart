// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'class.freezed.dart';
part 'class.g.dart';

@freezed
class ClassModel with _$ClassModel {
  factory ClassModel({
    int? id,
    String? name,
    String? school_name,
    String? school_address,
    int? grade,
    String? code,
    int? teacher_id,
    int? student_count,
    double? avg_term_score,
    double? avg_exam_score,
    List<DateTime>? lessons_today,
  }) = _ClassModel;

  factory ClassModel.fromJson(Map<String, dynamic> json) =>
      _$ClassModelFromJson(json);
}
