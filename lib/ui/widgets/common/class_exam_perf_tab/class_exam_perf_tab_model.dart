import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';

class ClassExamPerfTabModel
    extends FutureViewModel<ClassExamPerformanceModel?> {
  final ExamModel exam;
  ClassExamPerfTabModel(this.exam);

  @override
  Future<ClassExamPerformanceModel?> futureToRun() async {
    var classExamPerfRes = await onApiGetCall<ClassExamPerformanceModel>(
      getEndpoint: endPointGetClassExamPerformance,
      queryParams: {"exam_id": exam.id},
      dataFromJson: ClassExamPerformanceModel.fromJson,
    );

    if (apiCallChecks(classExamPerfRes, 'class exam performance')) {
      return classExamPerfRes.$1?.data;
    }

    return null;
  }
}
