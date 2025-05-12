// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam.freezed.dart';
part 'exam.g.dart';

@JsonEnum()
enum ExamStatus {
  @JsonValue('Generating')
  generating,
  @JsonValue('Failed')
  failed,
  @JsonValue('Upcoming')
  upcoming,
  @JsonValue('Ongoing')
  ongoing,
  @JsonValue('Grading')
  grading,
  @JsonValue('Complete')
  complete,
  @JsonValue('Archived')
  archived,
}

@freezed
class ExamModel with _$ExamModel {
  factory ExamModel({
    int? id,
    DateTime? start_date_time,
    DateTime? end_date_time,
    ExamStatus? status,
    bool? is_published,
    String? code,
    int? duration_min,
    String? generation_error,
    int? classroom_id,
    String? classroom_name,
    DateTime? created_at,
    DateTime? updated_at,
    ExamQuestionAnalysisModel? analysis,
    int? student_id,
  }) = _ExamModel;

  factory ExamModel.fromJson(Map<String, dynamic> json) =>
      _$ExamModelFromJson(json);
}

@freezed
class ExamQuestionAnalysisModel with _$ExamQuestionAnalysisModel {
  factory ExamQuestionAnalysisModel({
    int? question_count,
    List<ScoreModel>? grade_distribution,
    List<ScoreModel>? bloom_skill_distribution,
    List<ScoreModel>? strand_distribution,
    List<ScoreModel>? sub_strand_distribution,
  }) = _ExamQuestionAnalysisModel;

  factory ExamQuestionAnalysisModel.fromJson(Map<String, dynamic> json) =>
      _$ExamQuestionAnalysisModelFromJson(json);
}

@freezed
class ScoreModel with _$ScoreModel {
  factory ScoreModel({
    int? id,
    dynamic name, // String or int
    int? count,
    double? score,
    String? expectation_level,
  }) = _ScoreModel;

  factory ScoreModel.fromJson(Map<String, dynamic> json) =>
      _$ScoreModelFromJson(json);
}

@freezed
class ExamQuestionModel with _$ExamQuestionModel {
  factory ExamQuestionModel({
    int? id,
    int? number,
    int? grade,
    String? strand,
    String? sub_strand,
    String? bloom_skill,
    String? description,
    String? expected_answer,
    List<String>? bloom_skill_options,
    List<String>? question_options,
    List<String>? answer_options,
    String? tr_description,
    String? tr_expected_answer,
  }) = _ExamQuestionModel;

  factory ExamQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$ExamQuestionModelFromJson(json);
}

@freezed
class StudentExamSessionModel with _$StudentExamSessionModel {
  factory StudentExamSessionModel({
    int? id,
    String? status,
    bool? is_late_submission,
    DateTime? start_date_time,
    DateTime? end_date_time,
    int? duration_min,
    double? avg_score,
    String? expectation_level,
    int? exam_id,
    int? student_id,
    String? student_name,
  }) = _StudentExamSessionModel;

  factory StudentExamSessionModel.fromJson(Map<String, dynamic> json) =>
      _$StudentExamSessionModelFromJson(json);
}

@freezed
class StudentAnswerModel with _$StudentAnswerModel {
  factory StudentAnswerModel({
    int? id,
    int? question_id,
    int? question_number,
    String? question_description,
    String? strand,
    String? sub_strand,
    String? bloom_skill,
    int? grade,
    String? expected_answer,
    //
    String? description,
    double? score,
    double? tr_score,
    DateTime? created_at,
    DateTime? updated_at,
    ExamQuestionModel? question,
  }) = _StudentAnswerModel;

  factory StudentAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$StudentAnswerModelFromJson(json);
}

@freezed
class StudentExamSessionDataModel with _$StudentExamSessionDataModel {
  factory StudentExamSessionDataModel({
    StudentExamSessionModel? session,
    List<StudentAnswerModel>? answers,
  }) = _StudentExamSessionDataModel;

  factory StudentExamSessionDataModel.fromJson(Map<String, dynamic> json) =>
      _$StudentExamSessionDataModelFromJson(json);
}
