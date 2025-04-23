// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamModelImpl _$$ExamModelImplFromJson(Map<String, dynamic> json) =>
    _$ExamModelImpl(
      id: (json['id'] as num?)?.toInt(),
      teacher_id: (json['teacher_id'] as num?)?.toInt(),
      classroom: json['classroom'] == null
          ? null
          : ClassroomModel.fromJson(json['classroom'] as Map<String, dynamic>),
      grade: (json['grade'] as num?)?.toInt(),
      code: json['code'] as String?,
      status: $enumDecodeNullable(_$ExamStatusEnumMap, json['status']),
      duration_min: (json['duration_min'] as num?)?.toInt(),
      start_time: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      end_time: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      isPublished: json['isPublished'] as bool?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ExamModelImplToJson(_$ExamModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'teacher_id': instance.teacher_id,
      'classroom': instance.classroom,
      'grade': instance.grade,
      'code': instance.code,
      'status': _$ExamStatusEnumMap[instance.status],
      'duration_min': instance.duration_min,
      'start_time': instance.start_time?.toIso8601String(),
      'end_time': instance.end_time?.toIso8601String(),
      'isPublished': instance.isPublished,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };

const _$ExamStatusEnumMap = {
  ExamStatus.generating: 'generating',
  ExamStatus.upcoming: 'upcoming',
  ExamStatus.ongoing: 'ongoing',
  ExamStatus.grading: 'grading',
  ExamStatus.complete: 'complete',
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

_$ExamQuestionAnalysisModelImpl _$$ExamQuestionAnalysisModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExamQuestionAnalysisModelImpl(
      exam_id: (json['exam_id'] as num?)?.toInt(),
      question_count: (json['question_count'] as num?)?.toInt(),
      grade_distribution: (json['grade_distribution'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bloom_skill_distribution:
          (json['bloom_skill_distribution'] as List<dynamic>?)
              ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      strand_distribution: (json['strand_distribution'] as List<dynamic>?)
          ?.map((e) => StrandScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      difficulty_distribution:
          (json['difficulty_distribution'] as List<dynamic>?)
              ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => ExamQuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExamQuestionAnalysisModelImplToJson(
        _$ExamQuestionAnalysisModelImpl instance) =>
    <String, dynamic>{
      'exam_id': instance.exam_id,
      'question_count': instance.question_count,
      'grade_distribution': instance.grade_distribution,
      'bloom_skill_distribution': instance.bloom_skill_distribution,
      'strand_distribution': instance.strand_distribution,
      'difficulty_distribution': instance.difficulty_distribution,
      'questions': instance.questions,
    };

_$ScoreModelImpl _$$ScoreModelImplFromJson(Map<String, dynamic> json) =>
    _$ScoreModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
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

_$StrandScoreModelImpl _$$StrandScoreModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StrandScoreModelImpl(
      strand: json['strand'] == null
          ? null
          : ScoreModel.fromJson(json['strand'] as Map<String, dynamic>),
      sub_strands: (json['sub_strands'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StrandScoreModelImplToJson(
        _$StrandScoreModelImpl instance) =>
    <String, dynamic>{
      'strand': instance.strand,
      'sub_strands': instance.sub_strands,
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
