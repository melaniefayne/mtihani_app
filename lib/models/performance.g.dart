// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassExamPerformanceModelImpl _$$ClassExamPerformanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClassExamPerformanceModelImpl(
      avg_score: (json['avg_score'] as num?)?.toDouble(),
      grade_scores: (json['grade_scores'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bloom_skill_scores: (json['bloom_skill_scores'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      strand_scores: (json['strand_scores'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      exam: json['exam'] == null
          ? null
          : ExamModel.fromJson(json['exam'] as Map<String, dynamic>),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      classroom: json['classroom'] == null
          ? null
          : ClassroomModel.fromJson(json['classroom'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClassExamPerformanceModelImplToJson(
        _$ClassExamPerformanceModelImpl instance) =>
    <String, dynamic>{
      'avg_score': instance.avg_score,
      'grade_scores': instance.grade_scores,
      'bloom_skill_scores': instance.bloom_skill_scores,
      'strand_scores': instance.strand_scores,
      'exam': instance.exam,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'classroom': instance.classroom,
    };

_$StudentExamSessionModelImpl _$$StudentExamSessionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentExamSessionModelImpl(
      student_id: (json['student_id'] as num?)?.toInt(),
      exam: json['exam'] == null
          ? null
          : ExamModel.fromJson(json['exam'] as Map<String, dynamic>),
      start_date_time: json['start_date_time'] == null
          ? null
          : DateTime.parse(json['start_date_time'] as String),
      end_date_time: json['end_date_time'] == null
          ? null
          : DateTime.parse(json['end_date_time'] as String),
      duration_min: (json['duration_min'] as num?)?.toInt(),
      avg_score: (json['avg_score'] as num?)?.toDouble(),
      expectation_level: json['expectation_level'] as String?,
    );

Map<String, dynamic> _$$StudentExamSessionModelImplToJson(
        _$StudentExamSessionModelImpl instance) =>
    <String, dynamic>{
      'student_id': instance.student_id,
      'exam': instance.exam,
      'start_date_time': instance.start_date_time?.toIso8601String(),
      'end_date_time': instance.end_date_time?.toIso8601String(),
      'duration_min': instance.duration_min,
      'avg_score': instance.avg_score,
      'expectation_level': instance.expectation_level,
    };

_$StudentExamSessionPerformanceModelImpl
    _$$StudentExamSessionPerformanceModelImplFromJson(
            Map<String, dynamic> json) =>
        _$StudentExamSessionPerformanceModelImpl(
          id: (json['id'] as num?)?.toInt(),
          avg_score: (json['avg_score'] as num?)?.toDouble(),
          grade_scores: (json['grade_scores'] as List<dynamic>?)
              ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          bloom_skill_scores: (json['bloom_skill_scores'] as List<dynamic>?)
              ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          strand_scores: (json['strand_scores'] as List<dynamic>?)
              ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          created_at: json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
          updated_at: json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String),
          session: json['session'] == null
              ? null
              : StudentExamSessionModel.fromJson(
                  json['session'] as Map<String, dynamic>),
          answers: (json['answers'] as List<dynamic>?)
              ?.map(
                  (e) => StudentAnswerModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$StudentExamSessionPerformanceModelImplToJson(
        _$StudentExamSessionPerformanceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avg_score': instance.avg_score,
      'grade_scores': instance.grade_scores,
      'bloom_skill_scores': instance.bloom_skill_scores,
      'strand_scores': instance.strand_scores,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'session': instance.session,
      'answers': instance.answers,
    };
