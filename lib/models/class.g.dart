// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassModelImpl _$$ClassModelImplFromJson(Map<String, dynamic> json) =>
    _$ClassModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      school_name: json['school_name'] as String?,
      school_address: json['school_address'] as String?,
      grade: (json['grade'] as num?)?.toInt(),
      code: json['code'] as String?,
      teacher_id: (json['teacher_id'] as num?)?.toInt(),
      student_count: (json['student_count'] as num?)?.toInt(),
      avg_term_score: (json['avg_term_score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ClassModelImplToJson(_$ClassModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'school_name': instance.school_name,
      'school_address': instance.school_address,
      'grade': instance.grade,
      'code': instance.code,
      'teacher_id': instance.teacher_id,
      'student_count': instance.student_count,
      'avg_term_score': instance.avg_term_score,
    };
