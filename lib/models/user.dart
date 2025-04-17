// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtihani_app/models/classroom.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    int? user_id,
    String? email,
    String? name,
    String? role,
    int? teacher_id,
    int? student_id,
    String? phone_no,
    DateTime? created_at,
    DateTime? updated_at,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class TeacherModel with _$TeacherModel {
  factory TeacherModel({
    int? id,
    String? name,
    String? phone_no,
  }) = _TeacherModel;

  factory TeacherModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherModelFromJson(json);
}

@freezed
class StudentClassModel with _$StudentClassModel {
  factory StudentClassModel({
    int? id,
    String? name,
    String? code,
    ClassroomModel? classroom,
    double? avg_term_score,
    String? avg_term_expectation_level,
    double? avg_mtihani_score,
    String? avg_mtihani_expectation_level,
    List<TermScore>? term_scores,
  }) = _StudentClassModel;

  factory StudentClassModel.fromJson(Map<String, dynamic> json) =>
      _$StudentClassModelFromJson(json);
}

@freezed
class TermScore with _$TermScore {
  factory TermScore({
    int? id,
    ClassroomModel? classroom,
    int? grade,
    int? term,
    double? score,
    String? expectation_level,
  }) = _TermScore;

  factory TermScore.fromJson(Map<String, dynamic> json) =>
      _$TermScoreFromJson(json);
}
