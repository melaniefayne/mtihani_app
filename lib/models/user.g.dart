// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      (json['user_id'] as num?)?.toInt(),
      json['email'] as String?,
      json['name'] as String?,
      json['role'] as String?,
      (json['teacher_id'] as num?)?.toInt(),
      (json['student_id'] as num?)?.toInt(),
      json['phone_no'] as String?,
      json['code'] as String?,
      (json['classroom_id'] as num?)?.toInt(),
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      json['updated_at'] == null
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
      'code': instance.code,
      'classroom_id': instance.classroom_id,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
