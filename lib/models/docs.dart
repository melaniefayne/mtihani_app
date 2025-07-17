// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'docs.freezed.dart';
part 'docs.g.dart';

@freezed
class TeacherDocumentModel with _$TeacherDocumentModel {
  factory TeacherDocumentModel({
    int? id,
    String? title,
    String? description,
    String? extension,
    DateTime? uploaded_at,
    DateTime? approved_at,
    int? uploaded_by,
    int? approved_by,
    bool? approved_for_rag,
    String? file,
    String? file_url,
  }) = _TeacherDocumentModel;

  factory TeacherDocumentModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherDocumentModelFromJson(json);
}
