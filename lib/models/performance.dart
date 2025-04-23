// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/exam.dart';

part 'performance.freezed.dart';
part 'performance.g.dart';

@freezed
class ClassExamPerformanceModel with _$ClassExamPerformanceModel {
  factory ClassExamPerformanceModel({
    double? avg_score,
    List<ScoreModel>? grade_scores,
    List<ScoreModel>? bloom_skill_scores,
    List<StrandScoreModel>? strand_scores,
    ExamModel? exam,
    DateTime? created_at,
    DateTime? updated_at,
    ClassroomModel? classroom,
  }) = _ClassExamPerformanceModel;

  factory ClassExamPerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$ClassExamPerformanceModelFromJson(json);
}

@freezed
class StudentExamSessionModel with _$StudentExamSessionModel {
  factory StudentExamSessionModel({
    int? student_id,
    ExamModel? exam,
    DateTime? start_date_time,
    DateTime? end_date_time,
    int? duration_min,
    double? avg_score,
    String? expectation_level,
  }) = _StudentExamSessionModel;

  factory StudentExamSessionModel.fromJson(Map<String, dynamic> json) =>
      _$StudentExamSessionModelFromJson(json);
}

@freezed
class StudentExamSessionPerformanceModel
    with _$StudentExamSessionPerformanceModel {
  factory StudentExamSessionPerformanceModel({
    int? id,
    double? avg_score,
    List<ScoreModel>? grade_scores,
    List<ScoreModel>? bloom_skill_scores,
    List<StrandScoreModel>? strand_scores,
    DateTime? created_at,
    DateTime? updated_at,
    StudentExamSessionModel? session,
    List<StudentAnswerModel>? answers,
  }) = _StudentExamSessionPerformanceModel;

  factory StudentExamSessionPerformanceModel.fromJson(
          Map<String, dynamic> json) =>
      _$StudentExamSessionPerformanceModelFromJson(json);
}
