import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_strand_score.freezed.dart';
part 'class_strand_score.g.dart';

@freezed
class ClassStrandScore with _$ClassStrandScore {
  factory ClassStrandScore({
    ExamScore? strand_score,
    List<ExamScore>? sub_strand_scores,
  }) = _ClassStrandScore;

  factory ClassStrandScore.fromJson(Map<String, dynamic> json) =>
      _$ClassStrandScoreFromJson(json);
}

@freezed
class ExamScore with _$ExamScore {
  factory ExamScore({
    int? id,
    String? name,
    double? score,
  }) = _ExamScore;

  factory ExamScore.fromJson(Map<String, dynamic> json) =>
      _$ExamScoreFromJson(json);
}
