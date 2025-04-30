// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtihani_app/models/exam.dart';

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
    int? teacher_id,
    @JsonKey(
      name: 'lesson_times',
      fromJson: _dateTimeListFromJson,
      toJson: _dateTimeListToJson,
    )
    List<DateTime>? lesson_times,
    int? student_count,
    double? avg_term_score,
    String? avg_term_expectation_level,
    double? avg_mtihani_score,
    String? avg_mtihani_expectation_level,
    String? student_code,
    List<TermScore>? term_scores,
  }) = _ClassroomModel;

  factory ClassroomModel.fromJson(Map<String, dynamic> json) =>
      _$ClassroomModelFromJson(json);
}

List<DateTime>? _dateTimeListFromJson(List<dynamic>? jsonList) {
  if (jsonList == null) return null;
  return jsonList.map((e) => DateTime.parse(e as String)).toList();
}

List<String>? _dateTimeListToJson(List<DateTime>? dateList) {
  if (dateList == null) return null;
  return dateList.map((e) => e.toIso8601String()).toList();
}

@freezed
class ClassroomStudent with _$ClassroomStudent {
  factory ClassroomStudent({
    int? student_id,
    ClassroomModel? classroom,
    String? code,
    String? name,
    double? avg_term_score,
    String? avg_term_expectation_level,
    double? avg_mtihani_score,
    String? avg_mtihani_expectation_level,
    List<TermScore>? term_scores,
  }) = _ClassroomStudent;

  factory ClassroomStudent.fromJson(Map<String, dynamic> json) =>
      _$ClassroomStudentFromJson(json);
}

@freezed
class ClassPerformanceModel with _$ClassPerformanceModel {
  factory ClassPerformanceModel({
    double? avg_term_score,
    String? avg_term_expectation_level,
    double? avg_mtihani_score,
    String? avg_mtihani_expectation_level,
    List<ScoreModel>? grade_scores,
    List<ScoreModel>? bloom_skill_scores,
    List<StrandScoreModel>? strand_scores,
    List<TermScore>? class_term_scores,
  }) = _ClassPerformanceModel;

  factory ClassPerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$ClassPerformanceModelFromJson(json);
}

@freezed
class TermScore with _$TermScore {
  factory TermScore({
    int? id,
    int? grade,
    int? term,
    double? score,
    String? expectation_level,
  }) = _TermScore;

  factory TermScore.fromJson(Map<String, dynamic> json) =>
      _$TermScoreFromJson(json);
}
