// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamModelImpl _$$ExamModelImplFromJson(Map<String, dynamic> json) =>
    _$ExamModelImpl(
      id: (json['id'] as num?)?.toInt(),
      start_date_time: json['start_date_time'] == null
          ? null
          : DateTime.parse(json['start_date_time'] as String),
      end_date_time: json['end_date_time'] == null
          ? null
          : DateTime.parse(json['end_date_time'] as String),
      status: $enumDecodeNullable(_$ExamStatusEnumMap, json['status']),
      is_published: json['is_published'] as bool?,
      code: json['code'] as String?,
      duration_min: (json['duration_min'] as num?)?.toInt(),
      generation_error: json['generation_error'] as String?,
      classroom_id: (json['classroom_id'] as num?)?.toInt(),
      classroom_name: json['classroom_name'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      analysis: json['analysis'] == null
          ? null
          : ExamQuestionAnalysisModel.fromJson(
              json['analysis'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExamModelImplToJson(_$ExamModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_date_time': instance.start_date_time?.toIso8601String(),
      'end_date_time': instance.end_date_time?.toIso8601String(),
      'status': _$ExamStatusEnumMap[instance.status],
      'is_published': instance.is_published,
      'code': instance.code,
      'duration_min': instance.duration_min,
      'generation_error': instance.generation_error,
      'classroom_id': instance.classroom_id,
      'classroom_name': instance.classroom_name,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'analysis': instance.analysis,
    };

const _$ExamStatusEnumMap = {
  ExamStatus.generating: 'Generating',
  ExamStatus.failed: 'Failed',
  ExamStatus.upcoming: 'Upcoming',
  ExamStatus.ongoing: 'Ongoing',
  ExamStatus.grading: 'Grading',
  ExamStatus.complete: 'Complete',
  ExamStatus.archived: 'Archived',
};

_$ExamQuestionAnalysisModelImpl _$$ExamQuestionAnalysisModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExamQuestionAnalysisModelImpl(
      question_count: (json['question_count'] as num?)?.toInt(),
      grade_distribution: (json['grade_distribution'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bloom_skill_distribution:
          (json['bloom_skill_distribution'] as List<dynamic>?)
              ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      strand_distribution: (json['strand_distribution'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sub_strand_distribution:
          (json['sub_strand_distribution'] as List<dynamic>?)
              ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$ExamQuestionAnalysisModelImplToJson(
        _$ExamQuestionAnalysisModelImpl instance) =>
    <String, dynamic>{
      'question_count': instance.question_count,
      'grade_distribution': instance.grade_distribution,
      'bloom_skill_distribution': instance.bloom_skill_distribution,
      'strand_distribution': instance.strand_distribution,
      'sub_strand_distribution': instance.sub_strand_distribution,
    };

_$ScoreModelImpl _$$ScoreModelImplFromJson(Map<String, dynamic> json) =>
    _$ScoreModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'],
      count: (json['count'] as num?)?.toInt(),
      score: (json['score'] as num?)?.toDouble(),
      expectation_level: json['expectation_level'] as String?,
    );

Map<String, dynamic> _$$ScoreModelImplToJson(_$ScoreModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
      'score': instance.score,
      'expectation_level': instance.expectation_level,
    };

_$ExamQuestionModelImpl _$$ExamQuestionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExamQuestionModelImpl(
      id: (json['id'] as num?)?.toInt(),
      exam_id: (json['exam_id'] as num?)?.toInt(),
      grade: (json['grade'] as num?)?.toInt(),
      strand: json['strand'] == null
          ? null
          : ScoreModel.fromJson(json['strand'] as Map<String, dynamic>),
      sub_strand: json['sub_strand'] == null
          ? null
          : ScoreModel.fromJson(json['sub_strand'] as Map<String, dynamic>),
      bloom_skill: json['bloom_skill'] == null
          ? null
          : ScoreModel.fromJson(json['bloom_skill'] as Map<String, dynamic>),
      description: json['description'] as String?,
      expected_answer: json['expected_answer'] as String?,
      tr_description: json['tr_description'] as String?,
      tr_expected_answer: json['tr_expected_answer'] as String?,
      difficulty_level: json['difficulty_level'] as String?,
    );

Map<String, dynamic> _$$ExamQuestionModelImplToJson(
        _$ExamQuestionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_id': instance.exam_id,
      'grade': instance.grade,
      'strand': instance.strand,
      'sub_strand': instance.sub_strand,
      'bloom_skill': instance.bloom_skill,
      'description': instance.description,
      'expected_answer': instance.expected_answer,
      'tr_description': instance.tr_description,
      'tr_expected_answer': instance.tr_expected_answer,
      'difficulty_level': instance.difficulty_level,
    };

_$StudentAnswerModelImpl _$$StudentAnswerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentAnswerModelImpl(
      id: (json['id'] as num?)?.toInt(),
      description: json['description'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      tr_score: (json['tr_score'] as num?)?.toDouble(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      question: json['question'] == null
          ? null
          : ExamQuestionModel.fromJson(
              json['question'] as Map<String, dynamic>),
      session: json['session'] == null
          ? null
          : StudentExamSessionModel.fromJson(
              json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StudentAnswerModelImplToJson(
        _$StudentAnswerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'score': instance.score,
      'tr_score': instance.tr_score,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'question': instance.question,
      'session': instance.session,
    };
