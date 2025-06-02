import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';

class ClassExamPerfTabModel
    extends FutureViewModel<ClassExamPerformanceModel?> {
  final ExamModel exam;
  StrandPerformanceModel? selectedStrand;
  ClassExamPerfTabModel(this.exam);

  @override
  Future<ClassExamPerformanceModel?> futureToRun() async {
    var classExamPerfRes = await onApiGetCall<ClassExamPerformanceModel>(
      getEndpoint: endPointGetClassExamPerformance,
      queryParams: {"exam_id": exam.id},
      dataFromJson: ClassExamPerformanceModel.fromJson,
    );

    if (apiCallChecks(classExamPerfRes, 'class exam performance')) {
      ClassExamPerformanceModel? classPerf = classExamPerfRes.$1?.data;
      selectedStrand = classPerf?.strand_analysis?.firstOrNull;
      return classPerf;
    }

    return null;
  }

  onChangeStrand(StrandPerformanceModel strandData) {
    selectedStrand = strandData;
    rebuildUi();
  }
}
