// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassroomModelImpl _$$ClassroomModelImplFromJson(Map<String, dynamic> json) =>
    _$ClassroomModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      school_name: json['school_name'] as String?,
      school_address: json['school_address'] as String?,
      subject: json['subject'] as String?,
      grade: (json['grade'] as num?)?.toInt(),
      teacher_id: (json['teacher_id'] as num?)?.toInt(),
      lesson_times: _dateTimeListFromJson(json['lesson_times'] as List?),
      student_count: (json['student_count'] as num?)?.toInt(),
      avg_term_score: (json['avg_term_score'] as num?)?.toDouble(),
      avg_term_expectation_level: json['avg_term_expectation_level'] as String?,
      avg_mtihani_score: (json['avg_mtihani_score'] as num?)?.toDouble(),
      avg_mtihani_expectation_level:
          json['avg_mtihani_expectation_level'] as String?,
      student_code: json['student_code'] as String?,
      term_scores: (json['term_scores'] as List<dynamic>?)
          ?.map((e) => TermScore.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClassroomModelImplToJson(
        _$ClassroomModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'school_name': instance.school_name,
      'school_address': instance.school_address,
      'subject': instance.subject,
      'grade': instance.grade,
      'teacher_id': instance.teacher_id,
      'lesson_times': _dateTimeListToJson(instance.lesson_times),
      'student_count': instance.student_count,
      'avg_term_score': instance.avg_term_score,
      'avg_term_expectation_level': instance.avg_term_expectation_level,
      'avg_mtihani_score': instance.avg_mtihani_score,
      'avg_mtihani_expectation_level': instance.avg_mtihani_expectation_level,
      'student_code': instance.student_code,
      'term_scores': instance.term_scores,
    };

_$ClassroomStudentModelImpl _$$ClassroomStudentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClassroomStudentModelImpl(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      avg_score: (json['avg_score'] as num?)?.toDouble(),
      avg_expectation_level: json['avg_expectation_level'] as String?,
      avg_mtihani_score: (json['avg_mtihani_score'] as num?)?.toDouble(),
      avg_mtihani_expectation_level:
          json['avg_mtihani_expectation_level'] as String?,
      term_scores: (json['term_scores'] as List<dynamic>?)
          ?.map((e) => TermScore.fromJson(e as Map<String, dynamic>))
          .toList(),
      classroom_id: (json['classroom_id'] as num?)?.toInt(),
      classroom_name: json['classroom_name'] as String?,
    );

Map<String, dynamic> _$$ClassroomStudentModelImplToJson(
        _$ClassroomStudentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'status': instance.status,
      'avg_score': instance.avg_score,
      'avg_expectation_level': instance.avg_expectation_level,
      'avg_mtihani_score': instance.avg_mtihani_score,
      'avg_mtihani_expectation_level': instance.avg_mtihani_expectation_level,
      'term_scores': instance.term_scores,
      'classroom_id': instance.classroom_id,
      'classroom_name': instance.classroom_name,
    };

_$ClassPerformanceModelImpl _$$ClassPerformanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClassPerformanceModelImpl(
      avg_term_score: (json['avg_term_score'] as num?)?.toDouble(),
      avg_term_expectation_level: json['avg_term_expectation_level'] as String?,
      avg_mtihani_score: (json['avg_mtihani_score'] as num?)?.toDouble(),
      avg_mtihani_expectation_level:
          json['avg_mtihani_expectation_level'] as String?,
      grade_scores: (json['grade_scores'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bloom_skill_scores: (json['bloom_skill_scores'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      strand_scores: (json['strand_scores'] as List<dynamic>?)
          ?.map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      class_term_scores: (json['class_term_scores'] as List<dynamic>?)
          ?.map((e) => TermScore.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClassPerformanceModelImplToJson(
        _$ClassPerformanceModelImpl instance) =>
    <String, dynamic>{
      'avg_term_score': instance.avg_term_score,
      'avg_term_expectation_level': instance.avg_term_expectation_level,
      'avg_mtihani_score': instance.avg_mtihani_score,
      'avg_mtihani_expectation_level': instance.avg_mtihani_expectation_level,
      'grade_scores': instance.grade_scores,
      'bloom_skill_scores': instance.bloom_skill_scores,
      'strand_scores': instance.strand_scores,
      'class_term_scores': instance.class_term_scores,
    };

_$TermScoreImpl _$$TermScoreImplFromJson(Map<String, dynamic> json) =>
    _$TermScoreImpl(
      id: (json['id'] as num?)?.toInt(),
      grade: (json['grade'] as num?)?.toInt(),
      term: (json['term'] as num?)?.toInt(),
      score: (json['score'] as num?)?.toDouble(),
      expectation_level: json['expectation_level'] as String?,
    );

Map<String, dynamic> _$$TermScoreImplToJson(_$TermScoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'grade': instance.grade,
      'term': instance.term,
      'score': instance.score,
      'expectation_level': instance.expectation_level,
    };
