import 'package:flutter/material.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/ui/icon_mapper.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';

const String termScoresFetch = 'termScoresFetch';
const String classAvgPerfFetch = 'classAvgPerfFetch';

class ClassPerformanceTabModel extends MultipleFutureViewModel {
  final ClassroomModel classroom;

  ClassPerformanceTabModel(this.classroom);

  @override
  Map<String, Future Function()> get futuresMap => {
        termScoresFetch: fetchClassTermScores,
        classAvgPerfFetch: fetchAvgClassPerf,
      };

  // fetchClassTermScores =====
  List<TermScore> get classAvgTermScores => dataMap?[termScoresFetch] ?? [];
  bool get isFetchingTermScores => busy(termScoresFetch);

  Future<List<TermScore>> fetchClassTermScores() async {
    var classroomTermScoresRes = await onApiGetCall<TermScore>(
      getEndpoint: endPointGetClassroomTermScores,
      listDataFromJson: TermScore.fromJson,
      queryParams: {'classroom_id': classroom.id},
      dataField: "term_scores",
    );
    if (apiCallChecks(classroomTermScoresRes, 'classroom term scores')) {
      List<TermScore> classTermScores =
          classroomTermScoresRes.$1?.listData ?? [];
      return classTermScores;
    }
    return [];
  }

  List<double> get classTermScores {
    return (classAvgTermScores).map((e) => e.score ?? 0.0).toList();
  }

  List<String> get classTermNames {
    return (classAvgTermScores)
        .map((e) => "G${e.grade ?? '--'} T${e.term ?? '--'}")
        .toList();
  }

  // fetchAvgClassPerf =====
  ClassExamPerformanceModel? get classAvgPerf => dataMap?[classAvgPerfFetch];
  bool get isFetchingClassAvgPerf => busy(classAvgPerfFetch);
  StrandPerformanceModel? selectedStrand;

  Future<ClassExamPerformanceModel?> fetchAvgClassPerf() async {
    var classExamPerfRes = await onApiGetCall<ClassExamPerformanceModel>(
      getEndpoint: endPointGetAvgClassPerformance,
      queryParams: {"classroom_id": classroom.id},
      dataFromJson: ClassExamPerformanceModel.fromJson,
    );

    if (apiCallChecks(classExamPerfRes, 'average class exam performance')) {
      ClassExamPerformanceModel? classPerf = classExamPerfRes.$1?.data;
      selectedStrand = classPerf?.strand_analysis?.firstOrNull;
      return classPerf;
    }

    return null;
  }

  List<double> get gradeScores => (classAvgPerf?.grade_scores ?? [])
      .map((e) => (e.percentage ?? 0).toDouble())
      .toList();
  List<String> get gradeNames => (classAvgPerf?.grade_scores ?? [])
      .map((e) => ("Grade ${e.name.toString()}"))
      .toList();
  List<IconData> get gradeIcons =>
      gradeNames.map((e) => (appIconMapper[e] ?? Icons.category)).toList();

  onChangeStrand(StrandPerformanceModel strandData) {
    selectedStrand = strandData;
    rebuildUi();
  }
}
