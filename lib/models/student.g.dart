// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentModelImpl _$$StudentModelImplFromJson(Map<String, dynamic> json) =>
    _$StudentModelImpl(
      name: json['name'] as String?,
      code: json['code'] as String?,
      student_id: (json['student_id'] as num?)?.toInt(),
      grade: (json['grade'] as num?)?.toInt(),
      class_name: json['class_name'] as String?,
      avg_term_score: (json['avg_term_score'] as num?)?.toDouble(),
      avg_term_expectation_level: json['avg_term_expectation_level'] as String?,
      avg_mtihani_score: (json['avg_mtihani_score'] as num?)?.toDouble(),
      avg_mtihani_expectation_level:
          json['avg_mtihani_expectation_level'] as String?,
    );

Map<String, dynamic> _$$StudentModelImplToJson(_$StudentModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'student_id': instance.student_id,
      'grade': instance.grade,
      'class_name': instance.class_name,
      'avg_term_score': instance.avg_term_score,
      'avg_term_expectation_level': instance.avg_term_expectation_level,
      'avg_mtihani_score': instance.avg_mtihani_score,
      'avg_mtihani_expectation_level': instance.avg_mtihani_expectation_level,
    };
