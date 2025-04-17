// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtihani_app/models/user.dart';

part 'classroom.freezed.dart';
part 'classroom.g.dart';

@freezed
class ClassroomModel with _$ClassroomModel {
  factory ClassroomModel({
    int? id,
    String? name,
    String? school_name,
    String? school_address,
    String? subject,
    int? grade,
    String? code,
    TeacherModel? teacher,
    List<DateTime>? lessons_today,
    List<DateTime>? lessons_times,
    int? student_count,
    double? avg_term_score,
    String? avg_term_expectation_level,
    double? avg_mtihani_score,
    String? avg_mtihani_expectation_level,
  }) = _ClassroomModel;

  factory ClassroomModel.fromJson(Map<String, dynamic> json) =>
      _$ClassroomModelFromJson(json);
}
