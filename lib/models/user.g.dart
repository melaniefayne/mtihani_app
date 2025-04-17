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
