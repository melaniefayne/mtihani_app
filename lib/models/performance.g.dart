// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassExamPerformanceModelImpl _$$ClassExamPerformanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClassExamPerformanceModelImpl(
      id: (json['id'] as num?)?.toInt(),
      exam: (json['exam'] as num?)?.toInt(),
      exam_count: (json['exam_count'] as num?)?.toInt(),
      avg_score: (json['avg_score'] as num?)?.toDouble(),
      avg_expectation_level: json['avg_expectation_level'] as String?,
      student_count: (json['student_count'] as num?)?.toInt(),
      expectation_level_distribution:
          (json['expectation_level_distribution'] as List<dynamic>?)
              ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      score_distribution: (json['score_distribution'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      score_variance: json['score_variance'] == null
          ? null
          : ScoreModel.fromJson(json['score_variance'] as Map<String, dynamic>),
      bloom_skill_scores: (json['bloom_skill_scores'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      general_insights: (json['general_insights'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      grade_scores: (json['grade_scores'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      strand_analysis: (json['strand_analysis'] as List<dynamic>?)
          ?.map(
              (e) => StrandPerformanceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      strand_student_mastery: json['strand_student_mastery'] == null
          ? null
          : StrandStudentMasteryModel.fromJson(
              json['strand_student_mastery'] as Map<String, dynamic>),
      flagged_sub_strands: (json['flagged_sub_strands'] as List<dynamic>?)
          ?.map(
              (e) => FlaggedSubStrandModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ClassExamPerformanceModelImplToJson(
        _$ClassExamPerformanceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam': instance.exam,
      'exam_count': instance.exam_count,
      'avg_score': instance.avg_score,
      'avg_expectation_level': instance.avg_expectation_level,
      'student_count': instance.student_count,
      'expectation_level_distribution': instance.expectation_level_distribution,
      'score_distribution': instance.score_distribution,
      'score_variance': instance.score_variance,
      'bloom_skill_scores': instance.bloom_skill_scores,
      'general_insights': instance.general_insights,
      'grade_scores': instance.grade_scores,
      'strand_analysis': instance.strand_analysis,
      'strand_student_mastery': instance.strand_student_mastery,
      'flagged_sub_strands': instance.flagged_sub_strands,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };

_$StrandPerformanceModelImpl _$$StrandPerformanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StrandPerformanceModelImpl(
      name: json['name'] as String?,
      grade: (json['grade'] as num?)?.toInt(),
      avg_score: (json['avg_score'] as num?)?.toDouble(),
      avg_expectation_level: json['avg_expectation_level'] as String?,
      bloom_skill_scores: (json['bloom_skill_scores'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      score_variance: json['score_variance'] == null
          ? null
          : ScoreModel.fromJson(json['score_variance'] as Map<String, dynamic>),
      sub_strand_scores: (json['sub_strand_scores'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      insights: (json['insights'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      suggestions: (json['suggestions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      top_students: (json['top_students'] as List<dynamic>?)
          ?.map((e) => ExamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bottom_students: (json['bottom_students'] as List<dynamic>?)
          ?.map((e) => ExamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StrandPerformanceModelImplToJson(
        _$StrandPerformanceModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'grade': instance.grade,
      'avg_score': instance.avg_score,
      'avg_expectation_level': instance.avg_expectation_level,
      'bloom_skill_scores': instance.bloom_skill_scores,
      'score_variance': instance.score_variance,
      'sub_strand_scores': instance.sub_strand_scores,
      'insights': instance.insights,
      'suggestions': instance.suggestions,
      'top_students': instance.top_students,
      'bottom_students': instance.bottom_students,
    };

_$StrandStudentMasteryModelImpl _$$StrandStudentMasteryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StrandStudentMasteryModelImpl(
      strands:
          (json['strands'] as List<dynamic>?)?.map((e) => e as String).toList(),
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StrandStudentMasteryModelImplToJson(
        _$StrandStudentMasteryModelImpl instance) =>
    <String, dynamic>{
      'strands': instance.strands,
      'students': instance.students,
    };

_$FlaggedSubStrandModelImpl _$$FlaggedSubStrandModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FlaggedSubStrandModelImpl(
      pair: (json['pair'] as List<dynamic>?)?.map((e) => e as String).toList(),
      correlation: (json['correlation'] as num?)?.toDouble(),
      insight: json['insight'] as String?,
      suggestion: json['suggestion'] as String?,
    );

Map<String, dynamic> _$$FlaggedSubStrandModelImplToJson(
        _$FlaggedSubStrandModelImpl instance) =>
    <String, dynamic>{
      'pair': instance.pair,
      'correlation': instance.correlation,
      'insight': instance.insight,
      'suggestion': instance.suggestion,
    };

_$StudentExamSessionPerformanceModelImpl
    _$$StudentExamSessionPerformanceModelImplFromJson(
            Map<String, dynamic> json) =>
        _$StudentExamSessionPerformanceModelImpl(
          id: (json['id'] as num?)?.toInt(),
          exam_id: (json['exam_id'] as num?)?.toInt(),
          exam_count: (json['exam_count'] as num?)?.toInt(),
          student_id: (json['student_id'] as num?)?.toInt(),
          student_name: json['student_name'] as String?,
          avg_score: (json['avg_score'] as num?)?.toDouble(),
          avg_expectation_level: json['avg_expectation_level'] as String?,
          class_avg_difference:
              (json['class_avg_difference'] as num?)?.toDouble(),
          grade_scores: (json['grade_scores'] as List<dynamic>?)
              ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          bloom_skill_scores: (json['bloom_skill_scores'] as List<dynamic>?)
              ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          strand_scores: (json['strand_scores'] as List<dynamic>?)
              ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          questions_answered: (json['questions_answered'] as num?)?.toInt(),
          questions_unanswered: (json['questions_unanswered'] as num?)?.toInt(),
          completion_rate: (json['completion_rate'] as num?)?.toDouble(),
          best_5_answers: (json['best_5_answers'] as List<dynamic>?)
              ?.map(
                  (e) => StudentAnswerModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          worst_5_answers: (json['worst_5_answers'] as List<dynamic>?)
              ?.map(
                  (e) => StudentAnswerModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          created_at: json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
          updated_at: json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String),
        );

Map<String, dynamic> _$$StudentExamSessionPerformanceModelImplToJson(
        _$StudentExamSessionPerformanceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_id': instance.exam_id,
      'exam_count': instance.exam_count,
      'student_id': instance.student_id,
      'student_name': instance.student_name,
      'avg_score': instance.avg_score,
      'avg_expectation_level': instance.avg_expectation_level,
      'class_avg_difference': instance.class_avg_difference,
      'grade_scores': instance.grade_scores,
      'bloom_skill_scores': instance.bloom_skill_scores,
      'strand_scores': instance.strand_scores,
      'questions_answered': instance.questions_answered,
      'questions_unanswered': instance.questions_unanswered,
      'completion_rate': instance.completion_rate,
      'best_5_answers': instance.best_5_answers,
      'worst_5_answers': instance.worst_5_answers,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };

_$ClassExamPerfClusterModelImpl _$$ClassExamPerfClusterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClassExamPerfClusterModelImpl(
      id: (json['id'] as num?)?.toInt(),
      exam: (json['exam'] as num?)?.toInt(),
      cluster_label: json['cluster_label'] as String?,
      cluster_size: (json['cluster_size'] as num?)?.toInt(),
      avg_score: (json['avg_score'] as num?)?.toDouble(),
      avg_expectation_level: json['avg_expectation_level'] as String?,
      student_sessions: (json['student_sessions'] as List<dynamic>?)
          ?.map((e) => ExamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      score_variance: json['score_variance'] == null
          ? null
          : ScoreModel.fromJson(json['score_variance'] as Map<String, dynamic>),
      bloom_skill_scores: (json['bloom_skill_scores'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      strand_scores: (json['strand_scores'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      top_best_questions: (json['top_best_questions'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      top_worst_questions: (json['top_worst_questions'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      follow_up_exam_id: (json['follow_up_exam_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ClassExamPerfClusterModelImplToJson(
        _$ClassExamPerfClusterModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam': instance.exam,
      'cluster_label': instance.cluster_label,
      'cluster_size': instance.cluster_size,
      'avg_score': instance.avg_score,
      'avg_expectation_level': instance.avg_expectation_level,
      'student_sessions': instance.student_sessions,
      'score_variance': instance.score_variance,
      'bloom_skill_scores': instance.bloom_skill_scores,
      'strand_scores': instance.strand_scores,
      'top_best_questions': instance.top_best_questions,
      'top_worst_questions': instance.top_worst_questions,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'follow_up_exam_id': instance.follow_up_exam_id,
    };

_$ExamQuestionPerformanceModelImpl _$$ExamQuestionPerformanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExamQuestionPerformanceModelImpl(
      question_id: (json['question_id'] as num?)?.toInt(),
      avg_score: (json['avg_score'] as num?)?.toDouble(),
      avg_expectation_level: json['avg_expectation_level'] as String?,
      score_distribution: (json['score_distribution'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      answers_by_level: (json['answers_by_level'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ExamQuestionPerformanceModelImplToJson(
        _$ExamQuestionPerformanceModelImpl instance) =>
    <String, dynamic>{
      'question_id': instance.question_id,
      'avg_score': instance.avg_score,
      'avg_expectation_level': instance.avg_expectation_level,
      'score_distribution': instance.score_distribution,
      'answers_by_level': instance.answers_by_level,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
