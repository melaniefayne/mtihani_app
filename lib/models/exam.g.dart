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
      student_id: (json['student_id'] as num?)?.toInt(),
      student_name: json['student_name'] as String?,
      exam_id: (json['exam_id'] as num?)?.toInt(),
      avg_score: (json['avg_score'] as num?)?.toDouble(),
      avg_expectation_level: json['avg_expectation_level'] as String?,
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
      'student_id': instance.student_id,
      'student_name': instance.student_name,
      'exam_id': instance.exam_id,
      'avg_score': instance.avg_score,
      'avg_expectation_level': instance.avg_expectation_level,
    };

const _$ExamStatusEnumMap = {
  ExamStatus.generating: 'Generating',
  ExamStatus.failed: 'Failed',
  ExamStatus.upcoming: 'Upcoming',
  ExamStatus.ongoing: 'Ongoing',
  ExamStatus.grading: 'Grading',
  ExamStatus.analysing: 'Analysing',
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

_$ExamQuestionModelImpl _$$ExamQuestionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExamQuestionModelImpl(
      id: (json['id'] as num?)?.toInt(),
      number: (json['number'] as num?)?.toInt(),
      grade: (json['grade'] as num?)?.toInt(),
      strand: json['strand'] as String?,
      sub_strand: json['sub_strand'] as String?,
      bloom_skill: json['bloom_skill'] as String?,
      description: json['description'] as String?,
      expected_answer: json['expected_answer'] as String?,
      bloom_skill_options: (json['bloom_skill_options'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      question_options: (json['question_options'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      answer_options: (json['answer_options'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tr_description: json['tr_description'] as String?,
      tr_expected_answer: json['tr_expected_answer'] as String?,
    );

Map<String, dynamic> _$$ExamQuestionModelImplToJson(
        _$ExamQuestionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'grade': instance.grade,
      'strand': instance.strand,
      'sub_strand': instance.sub_strand,
      'bloom_skill': instance.bloom_skill,
      'description': instance.description,
      'expected_answer': instance.expected_answer,
      'bloom_skill_options': instance.bloom_skill_options,
      'question_options': instance.question_options,
      'answer_options': instance.answer_options,
      'tr_description': instance.tr_description,
      'tr_expected_answer': instance.tr_expected_answer,
    };

_$StudentExamSessionModelImpl _$$StudentExamSessionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentExamSessionModelImpl(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      is_late_submission: json['is_late_submission'] as bool?,
      start_date_time: json['start_date_time'] == null
          ? null
          : DateTime.parse(json['start_date_time'] as String),
      end_date_time: json['end_date_time'] == null
          ? null
          : DateTime.parse(json['end_date_time'] as String),
      duration_min: (json['duration_min'] as num?)?.toInt(),
      avg_score: (json['avg_score'] as num?)?.toDouble(),
      expectation_level: json['expectation_level'] as String?,
      exam_id: (json['exam_id'] as num?)?.toInt(),
      student_id: (json['student_id'] as num?)?.toInt(),
      student_name: json['student_name'] as String?,
    );

Map<String, dynamic> _$$StudentExamSessionModelImplToJson(
        _$StudentExamSessionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'is_late_submission': instance.is_late_submission,
      'start_date_time': instance.start_date_time?.toIso8601String(),
      'end_date_time': instance.end_date_time?.toIso8601String(),
      'duration_min': instance.duration_min,
      'avg_score': instance.avg_score,
      'expectation_level': instance.expectation_level,
      'exam_id': instance.exam_id,
      'student_id': instance.student_id,
      'student_name': instance.student_name,
    };

_$StudentAnswerModelImpl _$$StudentAnswerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentAnswerModelImpl(
      id: (json['id'] as num?)?.toInt(),
      question_id: (json['question_id'] as num?)?.toInt(),
      question_number: (json['question_number'] as num?)?.toInt(),
      question_description: json['question_description'] as String?,
      strand: json['strand'] as String?,
      sub_strand: json['sub_strand'] as String?,
      bloom_skill: json['bloom_skill'] as String?,
      grade: (json['grade'] as num?)?.toInt(),
      expected_answer: json['expected_answer'] as String?,
      description: json['description'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      expectation_level: json['expectation_level'] as String?,
      ai_score: (json['ai_score'] as num?)?.toDouble(),
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
    );

Map<String, dynamic> _$$StudentAnswerModelImplToJson(
        _$StudentAnswerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.question_id,
      'question_number': instance.question_number,
      'question_description': instance.question_description,
      'strand': instance.strand,
      'sub_strand': instance.sub_strand,
      'bloom_skill': instance.bloom_skill,
      'grade': instance.grade,
      'expected_answer': instance.expected_answer,
      'description': instance.description,
      'score': instance.score,
      'expectation_level': instance.expectation_level,
      'ai_score': instance.ai_score,
      'tr_score': instance.tr_score,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'question': instance.question,
    };

_$StudentExamSessionDataModelImpl _$$StudentExamSessionDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentExamSessionDataModelImpl(
      session: json['session'] == null
          ? null
          : StudentExamSessionModel.fromJson(
              json['session'] as Map<String, dynamic>),
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => StudentAnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StudentExamSessionDataModelImplToJson(
        _$StudentExamSessionDataModelImpl instance) =>
    <String, dynamic>{
      'session': instance.session,
      'answers': instance.answers,
    };

_$ScoreModelImpl _$$ScoreModelImplFromJson(Map<String, dynamic> json) =>
    _$ScoreModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'],
      count: (json['count'] as num?)?.toInt(),
      percentage: (json['percentage'] as num?)?.toDouble(),
      expectation_level: json['expectation_level'] as String?,
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      std_dev: (json['std_dev'] as num?)?.toDouble(),
      difference: (json['difference'] as num?)?.toDouble(),
      difference_desc: json['difference_desc'] as String?,
      scores: (json['scores'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      sub_strands: (json['sub_strands'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScoreModelImplToJson(_$ScoreModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
      'percentage': instance.percentage,
      'expectation_level': instance.expectation_level,
      'min': instance.min,
      'max': instance.max,
      'std_dev': instance.std_dev,
      'difference': instance.difference,
      'difference_desc': instance.difference_desc,
      'scores': instance.scores,
      'sub_strands': instance.sub_strands,
    };
