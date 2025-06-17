import 'package:flutter/material.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/ui/icon_mapper.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';

const String studentAvgPerfFetch = 'studentAvgPerfFetch';

class StudentPerformanceTabModel extends MultipleFutureViewModel {
  final StudentModel student;

  StudentPerformanceTabModel(this.student);

  @override
  Map<String, Future Function()> get futuresMap => {
        studentAvgPerfFetch: fetchAvgClassPerf,
      };

  List<double> get termScores {
    return (student.term_scores ?? []).map((e) => e.score ?? 0.0).toList();
  }

  List<String> get termNames {
    return (student.term_scores ?? [])
        .map((e) => "G${e.grade ?? '--'} T${e.term ?? '--'}")
        .toList();
  }

  // fetchAvgClassPerf =====
  StudentExamSessionPerformanceModel? get studentAvgPerf =>
      dataMap?[studentAvgPerfFetch];
  bool get isFetchingStudentAvgPerf => busy(studentAvgPerfFetch);
  StrandPerformanceModel? selectedStrand;

  Future<StudentExamSessionPerformanceModel?> fetchAvgClassPerf() async {
    var studentAvgPerfRes =
        await onApiGetCall<StudentExamSessionPerformanceModel>(
      getEndpoint: endPointGetAvgStudentPerformance,
      queryParams: {"student_id": student.id},
      dataFromJson: StudentExamSessionPerformanceModel.fromJson,
    );

    if (apiCallChecks(studentAvgPerfRes, 'average student exam performance')) {
      return studentAvgPerfRes.$1?.data;
    }

    return null;
  }

  List<double> get gradeScores => (studentAvgPerf?.grade_scores ?? [])
      .map((e) => (e.percentage ?? 0).toDouble())
      .toList();
  List<String> get gradeNames => (studentAvgPerf?.grade_scores ?? [])
      .map((e) => ("Grade ${e.name.toString()}"))
      .toList();
  List<IconData> get gradeIcons =>
      gradeNames.map((e) => (appIconMapper[e] ?? Icons.category)).toList();
}
