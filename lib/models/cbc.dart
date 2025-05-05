// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cbc.freezed.dart';
part 'cbc.g.dart';

@freezed
class GradeModel with _$GradeModel {
  factory GradeModel({
    int? grade,
    List<StrandModel>? strands,
  }) = _GradeModel;

  factory GradeModel.fromJson(Map<String, dynamic> json) =>
      _$GradeModelFromJson(json);
}

@freezed
class StrandModel with _$StrandModel {
  factory StrandModel({
    int? id,
    int? grade,
    String? name,
    double? number,
    List<SubStrandModel>? sub_strands,
  }) = _StrandModel;

  factory StrandModel.fromJson(Map<String, dynamic> json) =>
      _$StrandModelFromJson(json);
}

@freezed
class SubStrandModel with _$SubStrandModel {
  factory SubStrandModel({
    int? id,
    String? name,
    double? number,
    int? lesson_count,
    List<String>? key_inquiries,
    List<String>? learning_outcomes,
    List<String>? learning_experiences,
    List<String>? descriptions,
    List<String>? core_competencies,
    List<String>? values,
    List<String>? pertinent_issues,
    List<String>? other_learning_areas,
    List<String>? learning_materials,
    List<String>? non_formal_activities,
    List<SubStrandSkillModel>? skills,
  }) = _SubStrandModel;

  factory SubStrandModel.fromJson(Map<String, dynamic> json) =>
      _$SubStrandModelFromJson(json);
}

@freezed
class SubStrandSkillModel with _$SubStrandSkillModel {
  factory SubStrandSkillModel({
    int? id,
    String? skill,
    List<SkillRubricModel>? rubrics,
  }) = _SubStrandSkillModel;

  factory SubStrandSkillModel.fromJson(Map<String, dynamic> json) =>
      _$SubStrandSkillModelFromJson(json);
}

@freezed
class SkillRubricModel with _$SkillRubricModel {
  factory SkillRubricModel({
    String? expectation,
    String? description,
  }) = _SkillRubricModel;

  factory SkillRubricModel.fromJson(Map<String, dynamic> json) =>
      _$SkillRubricModelFromJson(json);
}
