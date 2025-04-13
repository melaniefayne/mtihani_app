// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_strand_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassStrandScoreImpl _$$ClassStrandScoreImplFromJson(
        Map<String, dynamic> json) =>
    _$ClassStrandScoreImpl(
      strand_score: json['strand_score'] == null
          ? null
          : ExamScore.fromJson(json['strand_score'] as Map<String, dynamic>),
      sub_strand_scores: (json['sub_strand_scores'] as List<dynamic>?)
          ?.map((e) => ExamScore.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClassStrandScoreImplToJson(
        _$ClassStrandScoreImpl instance) =>
    <String, dynamic>{
      'strand_score': instance.strand_score,
      'sub_strand_scores': instance.sub_strand_scores,
    };

_$ExamScoreImpl _$$ExamScoreImplFromJson(Map<String, dynamic> json) =>
    _$ExamScoreImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      score: (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ExamScoreImplToJson(_$ExamScoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'score': instance.score,
    };
