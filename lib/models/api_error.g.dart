// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiErrorModelImpl _$$ApiErrorModelImplFromJson(Map<String, dynamic> json) =>
    _$ApiErrorModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      msg: json['msg'] as String?,
      error: json['error'] as bool?,
      errors: json['errors'] as String?,
    );

Map<String, dynamic> _$$ApiErrorModelImplToJson(_$ApiErrorModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'msg': instance.msg,
      'error': instance.error,
      'errors': instance.errors,
    };
