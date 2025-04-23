// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cbc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GradeModelImpl _$$GradeModelImplFromJson(Map<String, dynamic> json) =>
    _$GradeModelImpl(
      grade: (json['grade'] as num?)?.toInt(),
      strands: (json['strands'] as List<dynamic>?)
          ?.map((e) => StrandModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GradeModelImplToJson(_$GradeModelImpl instance) =>
    <String, dynamic>{
      'grade': instance.grade,
      'strands': instance.strands,
    };

_$StrandModelImpl _$$StrandModelImplFromJson(Map<String, dynamic> json) =>
    _$StrandModelImpl(
      id: (json['id'] as num?)?.toInt(),
      grade: (json['grade'] as num?)?.toInt(),
      name: json['name'] as String?,
      number: (json['number'] as num?)?.toDouble(),
      sub_strands: (json['sub_strands'] as List<dynamic>?)
          ?.map((e) => SubStrandModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StrandModelImplToJson(_$StrandModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'grade': instance.grade,
      'name': instance.name,
      'number': instance.number,
      'sub_strands': instance.sub_strands,
    };

_$SubStrandModelImpl _$$SubStrandModelImplFromJson(Map<String, dynamic> json) =>
    _$SubStrandModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      number: (json['number'] as num?)?.toDouble(),
      lesson_count: (json['lesson_count'] as num?)?.toInt(),
      key_inquiries: (json['key_inquiries'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      learning_outcomes: (json['learning_outcomes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      learning_experiences: (json['learning_experiences'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      descriptions: (json['descriptions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      core_competencies: (json['core_competencies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      values:
          (json['values'] as List<dynamic>?)?.map((e) => e as String).toList(),
      pertinent_issues: (json['pertinent_issues'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      other_learning_areas: (json['other_learning_areas'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      learning_materials: (json['learning_materials'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      non_formal_activities: (json['non_formal_activities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => SubStrandSkillModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SubStrandModelImplToJson(
        _$SubStrandModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'lesson_count': instance.lesson_count,
      'key_inquiries': instance.key_inquiries,
      'learning_outcomes': instance.learning_outcomes,
      'learning_experiences': instance.learning_experiences,
      'descriptions': instance.descriptions,
      'core_competencies': instance.core_competencies,
      'values': instance.values,
      'pertinent_issues': instance.pertinent_issues,
      'other_learning_areas': instance.other_learning_areas,
      'learning_materials': instance.learning_materials,
      'non_formal_activities': instance.non_formal_activities,
      'skills': instance.skills,
    };

_$SubStrandSkillModelImpl _$$SubStrandSkillModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubStrandSkillModelImpl(
      id: (json['id'] as num?)?.toInt(),
      skill: json['skill'] as String?,
      skillRubrics: (json['skillRubrics'] as List<dynamic>?)
          ?.map((e) => SkillRubricModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SubStrandSkillModelImplToJson(
        _$SubStrandSkillModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'skill': instance.skill,
      'skillRubrics': instance.skillRubrics,
    };

_$SkillRubricModelImpl _$$SkillRubricModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SkillRubricModelImpl(
      expectation: json['expectation'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$SkillRubricModelImplToJson(
        _$SkillRubricModelImpl instance) =>
    <String, dynamic>{
      'expectation': instance.expectation,
      'description': instance.description,
    };
