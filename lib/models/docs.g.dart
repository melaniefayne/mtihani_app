// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'docs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeacherDocumentModelImpl _$$TeacherDocumentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TeacherDocumentModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      extension: json['extension'] as String?,
      uploaded_at: json['uploaded_at'] == null
          ? null
          : DateTime.parse(json['uploaded_at'] as String),
      approved_at: json['approved_at'] == null
          ? null
          : DateTime.parse(json['approved_at'] as String),
      uploaded_by: (json['uploaded_by'] as num?)?.toInt(),
      approved_by: (json['approved_by'] as num?)?.toInt(),
      approved_for_rag: json['approved_for_rag'] as bool?,
      file: json['file'] as String?,
      file_url: json['file_url'] as String?,
    );

Map<String, dynamic> _$$TeacherDocumentModelImplToJson(
        _$TeacherDocumentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'extension': instance.extension,
      'uploaded_at': instance.uploaded_at?.toIso8601String(),
      'approved_at': instance.approved_at?.toIso8601String(),
      'uploaded_by': instance.uploaded_by,
      'approved_by': instance.approved_by,
      'approved_for_rag': instance.approved_for_rag,
      'file': instance.file,
      'file_url': instance.file_url,
    };
