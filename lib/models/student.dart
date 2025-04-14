import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
class StudentModel with _$StudentModel {
  factory StudentModel({
    String? name,
    String? code,
    int? student_id,
    int? grade,
    String? class_name,
    double? avg_term_score,
    String? avg_term_expectation_level,
    double? avg_mtihani_score,
    String? avg_mtihani_expectation_level,
  }) = _StudentModel;

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);
}
