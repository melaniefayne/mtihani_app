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
    int? exam_id,
    int? student_id,
    String? student_name,
    double? avg_score,
    String? avg_expectation_level,
    double? class_avg_difference,
    List<ScoreModel>? grade_scores,
    List<ScoreModel>? bloom_skill_scores,
    List<ScoreModel>? strand_scores,
    int? questions_answered,
    int? questions_unanswered,
    double? completion_rate,
    List<StudentAnswerModel>? best_5_answers,
    List<StudentAnswerModel>? worst_5_answers,
    DateTime? created_at,
    DateTime? updated_at,
  }) = _StudentExamSessionPerformanceModel;

  factory StudentExamSessionPerformanceModel.fromJson(
          Map<String, dynamic> json) =>
      _$StudentExamSessionPerformanceModelFromJson(json);
}

@freezed
class ClassExamPerfClusterModel with _$ClassExamPerfClusterModel {
  factory ClassExamPerfClusterModel({
    int? id,
    int? exam,
    String? cluster_label,
    int? cluster_size,
    double? avg_score,
    String? avg_expectation_level,
    List<ExamModel>? student_sessions,
    ScoreModel? score_variance,
    List<ScoreModel>? bloom_skill_scores,
    List<ScoreModel>? strand_scores,
    List<ScoreModel>? top_best_questions,
    List<ScoreModel>? top_worst_questions,
    DateTime? created_at,
    DateTime? updated_at,
    int? follow_up_exam_id,
  }) = _ClassExamPerfClusterModel;

  factory ClassExamPerfClusterModel.fromJson(Map<String, dynamic> json) =>
      _$ClassExamPerfClusterModelFromJson(json);
}

@freezed
class ExamQuestionPerformanceModel with _$ExamQuestionPerformanceModel {
  factory ExamQuestionPerformanceModel({
    int? question_id,
    double? avg_score,
    String? avg_expectation_level,
    List<ScoreModel>? score_distribution,
    List<ScoreModel>? answers_by_level,
    DateTime? created_at,
    DateTime? updated_at,
  }) = _ExamQuestionPerformanceModel;

  factory ExamQuestionPerformanceModel.fromJson(Map<String, dynamic> json) =>
      _$ExamQuestionPerformanceModelFromJson(json);
}
