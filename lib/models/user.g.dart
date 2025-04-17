// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      user_id: (json['user_id'] as num?)?.toInt(),
      email: json['email'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
      teacher_id: (json['teacher_id'] as num?)?.toInt(),
      student_id: (json['student_id'] as num?)?.toInt(),
      phone_no: json['phone_no'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'teacher_id': instance.teacher_id,
      'student_id': instance.student_id,
      'phone_no': instance.phone_no,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };

_$TeacherModelImpl _$$TeacherModelImplFromJson(Map<String, dynamic> json) =>
    _$TeacherModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      phone_no: json['phone_no'] as String?,
    );

Map<String, dynamic> _$$TeacherModelImplToJson(_$TeacherModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_no': instance.phone_no,
    };

_$StudentClassModelImpl _$$StudentClassModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentClassModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      classroom: json['classroom'] == null
          ? null
          : ClassroomModel.fromJson(json['classroom'] as Map<String, dynamic>),
      avg_term_score: (json['avg_term_score'] as num?)?.toDouble(),
      avg_term_expectation_level: json['avg_term_expectation_level'] as String?,
      avg_mtihani_score: (json['avg_mtihani_score'] as num?)?.toDouble(),
      avg_mtihani_expectation_level:
          json['avg_mtihani_expectation_level'] as String?,
      term_scores: (json['term_scores'] as List<dynamic>?)
          ?.map((e) => TermScore.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StudentClassModelImplToJson(
        _$StudentClassModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'classroom': instance.classroom,
      'avg_term_score': instance.avg_term_score,
      'avg_term_expectation_level': instance.avg_term_expectation_level,
      'avg_mtihani_score': instance.avg_mtihani_score,
      'avg_mtihani_expectation_level': instance.avg_mtihani_expectation_level,
      'term_scores': instance.term_scores,
    };

_$TermScoreImpl _$$TermScoreImplFromJson(Map<String, dynamic> json) =>
    _$TermScoreImpl(
      id: (json['id'] as num?)?.toInt(),
      classroom: json['classroom'] == null
          ? null
          : ClassroomModel.fromJson(json['classroom'] as Map<String, dynamic>),
      grade: (json['grade'] as num?)?.toInt(),
      term: (json['term'] as num?)?.toInt(),
      score: (json['score'] as num?)?.toDouble(),
      expectation_level: json['expectation_level'] as String?,
    );

Map<String, dynamic> _$$TermScoreImplToJson(_$TermScoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'classroom': instance.classroom,
      'grade': instance.grade,
      'term': instance.term,
      'score': instance.score,
      'expectation_level': instance.expectation_level,
    };
