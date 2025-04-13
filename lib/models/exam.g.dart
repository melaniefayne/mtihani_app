// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamModelImpl _$$ExamModelImplFromJson(Map<String, dynamic> json) =>
    _$ExamModelImpl(
      id: (json['id'] as num?)?.toInt(),
      grade: (json['grade'] as num?)?.toInt(),
      code: json['code'] as String?,
      class_name: json['class_name'] as String?,
      status: json['status'] as String?,
      duration_min: (json['duration_min'] as num?)?.toInt(),
      start_time: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      end_time: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
    );

Map<String, dynamic> _$$ExamModelImplToJson(_$ExamModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'grade': instance.grade,
      'code': instance.code,
      'class_name': instance.class_name,
      'status': instance.status,
      'duration_min': instance.duration_min,
      'start_time': instance.start_time?.toIso8601String(),
      'end_time': instance.end_time?.toIso8601String(),
    };
