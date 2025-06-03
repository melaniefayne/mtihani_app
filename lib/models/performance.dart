// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtihani_app/models/exam.dart';

part 'performance.freezed.dart';
part 'performance.g.dart';

@freezed
class ClassExamPerformanceModel with _$ClassExamPerformanceModel {
  factory ClassExamPerformanceModel({
    int? id,
    int? exam,
    double? avg_score,
    String? avg_expectation_level,
    int? student_count,
    List<ScoreModel>? expectation_level_distribution,
    List<ScoreModel>? score_distribution,
    ScoreModel? score_variance,
    List<ScoreModel>? bloom_skill_scores,
    List<String>? general_insights,
    List<ScoreModel>? grade_scores,
    List<StrandPerformanceModel>? strand_analysis,
    StrandStudentMasteryModel? strand_student_mastery,
    List<FlaggedSubStrandModel>? flagged_sub_strands,
    DateTime? created_at,
    DateTime? updated_at,
  }) = _ClassExamPerformanceModel;

  factory ClassExamPerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$ClassExamPerformanceModelFromJson(json);
}

@freezed
class StrandPerformanceModel with _$StrandPerformanceModel {
  factory StrandPerformanceModel({
    String? name,
    int? grade,
    double? avg_score,
    String? avg_expectation_level,
    List<ScoreModel>? bloom_skill_scores,
    ScoreModel? score_variance,
    List<ScoreModel>? sub_strand_scores,
    List<String>? insights,
    List<String>? suggestions,
    List<ExamModel>? top_students,
    List<ExamModel>? bottom_students,
  }) = _StrandPerformanceModel;

  factory StrandPerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$StrandPerformanceModelFromJson(json);
}

@freezed
class StrandStudentMasteryModel with _$StrandStudentMasteryModel {
  factory StrandStudentMasteryModel({
    List<String>? strands,
    List<ScoreModel>? students,
  }) = _StrandStudentMasteryModel;

  factory StrandStudentMasteryModel.fromJson(Map<String, dynamic> json) =>
      _$StrandStudentMasteryModelFromJson(json);
}

@freezed
class FlaggedSubStrandModel with _$FlaggedSubStrandModel {
  factory FlaggedSubStrandModel({
    List<String>? pair,
    double? correlation,
    String? insight,
    String? suggestion,
  }) = _FlaggedSubStrandModel;

  factory FlaggedSubStrandModel.fromJson(Map<String, dynamic> json) =>
      _$FlaggedSubStrandModelFromJson(json);
}

@freezed
class StudentExamSessionPerformanceModel
    with _$StudentExamSessionPerformanceModel {
  factory StudentExamSessionPerformanceModel({
    int? id,
    double? avg_score,
    List<ScoreModel>? grade_scores,
    List<ScoreModel>? bloom_skill_scores,
    List<ScoreModel>? strand_scores,
    DateTime? created_at,
    DateTime? updated_at,
    StudentExamSessionModel? session,
    List<StudentAnswerModel>? answers,
  }) = _StudentExamSessionPerformanceModel;

  factory StudentExamSessionPerformanceModel.fromJson(
          Map<String, dynamic> json) =>
      _$StudentExamSessionPerformanceModelFromJson(json);
}
