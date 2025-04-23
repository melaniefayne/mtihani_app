// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/performance.dart';

part 'exam.freezed.dart';
part 'exam.g.dart';

@JsonEnum()
enum ExamStatus {
  @JsonValue('generating')
  generating,
  @JsonValue('upcoming')
  upcoming,
  @JsonValue('ongoing')
  ongoing,
  @JsonValue('grading')
  grading,
  @JsonValue('complete')
  complete,
}

@freezed
class ExamModel with _$ExamModel {
  factory ExamModel({
    int? id,
    int? teacher_id,
    ClassroomModel? classroom,
    int? grade,
    String? code,
    ExamStatus? status,
    int? duration_min,
    DateTime? start_time,
    DateTime? end_time,
    bool? isPublished,
    DateTime? created_at,
    DateTime? updated_at,
  }) = _ExamModel;

  factory ExamModel.fromJson(Map<String, dynamic> json) =>
      _$ExamModelFromJson(json);
}

@freezed
class ExamQuestionModel with _$ExamQuestionModel {
  factory ExamQuestionModel({
    int? id,
    int? exam_id,
    int? grade,
    ScoreModel? strand,
    ScoreModel? sub_strand,
    ScoreModel? bloom_skill,
    String? description,
    String? expected_answer,
    String? tr_description,
    String? tr_expected_answer,
    String? difficulty_level,
  }) = _ExamQuestionModel;

  factory ExamQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$ExamQuestionModelFromJson(json);
}

@freezed
class ExamQuestionAnalysisModel with _$ExamQuestionAnalysisModel {
  factory ExamQuestionAnalysisModel({
    int? exam_id,
    int? question_count,
    List<ScoreModel>? grade_distribution,
    List<ScoreModel>? bloom_skill_distribution,
    List<StrandScoreModel>? strand_distribution,
    List<ScoreModel>? difficulty_distribution,
    List<ExamQuestionModel>? questions,
  }) = _ExamQuestionAnalysisModel;

  factory ExamQuestionAnalysisModel.fromJson(Map<String, dynamic> json) =>
      _$ExamQuestionAnalysisModelFromJson(json);
}

@freezed
class ScoreModel with _$ScoreModel {
  factory ScoreModel({
    int? id,
    String? name,
    int? count,
    double? score,
    String? expectation_level,
  }) = _ScoreModel;

  factory ScoreModel.fromJson(Map<String, dynamic> json) =>
      _$ScoreModelFromJson(json);
}

@freezed
class StrandScoreModel with _$StrandScoreModel {
  factory StrandScoreModel({
    ScoreModel? strand,
    List<ScoreModel>? sub_strands,
  }) = _StrandScoreModel;

  factory StrandScoreModel.fromJson(Map<String, dynamic> json) =>
      _$StrandScoreModelFromJson(json);
}

@freezed
class StudentAnswerModel with _$StudentAnswerModel {
  factory StudentAnswerModel({
    int? id,
    String? description,
    double? score,
    double? tr_score,
    DateTime? created_at,
    DateTime? updated_at,
    ExamQuestionModel? question,
    StudentExamSessionModel? session,
  }) = _StudentAnswerModel;

  factory StudentAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$StudentAnswerModelFromJson(json);
}
