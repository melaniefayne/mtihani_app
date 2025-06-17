import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/ui/icon_mapper.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';

class StudentExamPerfTabModel
    extends FutureViewModel<StudentExamSessionPerformanceModel?> {
  final StudentExamSessionModel examSession;
  String? selectedStrandName;
  List<double> subStrandValues = [];
  List<String> subStrandLabels = [];

  StudentExamPerfTabModel(this.examSession);

  @override
  Future<StudentExamSessionPerformanceModel?> futureToRun() async {
    var studentPerfApiRes =
        await onApiGetCall<StudentExamSessionPerformanceModel>(
      getEndpoint: endPointGetStudentExamPerformance,
      queryParams: {"student_session_id": examSession.id},
      dataFromJson: StudentExamSessionPerformanceModel.fromJson,
    );

    if (apiCallChecks(studentPerfApiRes, 'student performance')) {
      return studentPerfApiRes.$1?.data;
    }

    return null;
  }

  List<double> get gradeScores => (data?.grade_scores ?? [])
      .map((e) => (e.percentage ?? 0).toDouble())
      .toList();
  List<String> get gradeNames => (data?.grade_scores ?? [])
      .map((e) => ("Grade ${e.name.toString()}"))
      .toList();
  List<IconData> get gradeIcons =>
      gradeNames.map((e) => (appIconMapper[e] ?? Icons.category)).toList();

  List<double> get strandScores => (data?.strand_scores ?? [])
      .map((e) => (e.percentage ?? 0).toDouble())
      .toList();
  List<String> get strandNames =>
      (data?.strand_scores ?? []).map((e) => e.name.toString()).toList();

  List<IconData> get strandIcons => strandNames
      .map((e) => (appIconMapper[e.split(' (').first] ?? Icons.category))
      .toList();

  onStrandTap(String strandName) {
    if (strandName == selectedStrandName) return;
    selectedStrandName = strandName;
    ScoreModel? selectedStrand = (data?.strand_scores ?? [])
        .where((e) => e.name == strandName)
        .firstOrNull;
    if (selectedStrand != null) {
      subStrandValues = (selectedStrand.sub_strands ?? [])
          .map((e) => e.percentage ?? 0.0)
          .toList();
      subStrandLabels = (selectedStrand.sub_strands ?? [])
          .map((e) => e.name.toString())
          .toList();
    } else {
      subStrandLabels = [];
      subStrandValues = [];
    }
    rebuildUi();
  }
}
