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
      code: json['code'] as String?,
      teacher: json['teacher'] == null
          ? null
          : TeacherModel.fromJson(json['teacher'] as Map<String, dynamic>),
      lessons_today: (json['lessons_today'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
      lessons_times: (json['lessons_times'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
      student_count: (json['student_count'] as num?)?.toInt(),
      avg_term_score: (json['avg_term_score'] as num?)?.toDouble(),
      avg_term_expectation_level: json['avg_term_expectation_level'] as String?,
      avg_mtihani_score: (json['avg_mtihani_score'] as num?)?.toDouble(),
      avg_mtihani_expectation_level:
          json['avg_mtihani_expectation_level'] as String?,
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
      'code': instance.code,
      'teacher': instance.teacher,
      'lessons_today':
          instance.lessons_today?.map((e) => e.toIso8601String()).toList(),
      'lessons_times':
          instance.lessons_times?.map((e) => e.toIso8601String()).toList(),
      'student_count': instance.student_count,
      'avg_term_score': instance.avg_term_score,
      'avg_term_expectation_level': instance.avg_term_expectation_level,
      'avg_mtihani_score': instance.avg_mtihani_score,
      'avg_mtihani_expectation_level': instance.avg_mtihani_expectation_level,
    };
