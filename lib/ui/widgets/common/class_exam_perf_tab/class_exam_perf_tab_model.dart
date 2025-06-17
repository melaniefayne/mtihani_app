import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ClassExamPerfTabModel
    extends FutureViewModel<ClassExamPerformanceModel?> {
  final ExamModel exam;
  final _sharedPrefsService = locator<SharedPrefsService>();
  final _navigationService = locator<NavigationService>();

  ClassExamPerfTabModel(this.exam);

  @override
  Future<ClassExamPerformanceModel?> futureToRun() async {
    if (exam.status != ExamStatus.complete) return null;

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

  onStrandStudentItemTap(Map<String, String> item) async {
    ExamModel studentExam =
        allStudentExams.firstWhere((e) => e.student_name == item['name']);
    studentExam = studentExam.copyWith(
      id: studentExam.exam_id,
      status: ExamStatus.complete,
      code: exam.code,
    );

    bool canNavigate =
        await _sharedPrefsService.setSingleStExamNavArg(studentExam);
    if (canNavigate) {
      _navigationService.navigateToSingleStExamView();
    }
  }

  List<ExamModel> get allStudentExams {
    return (data?.strand_analysis ?? [])
        .expand((e) => [
              ...(e.top_students ?? <ExamModel>[]),
              ...(e.bottom_students ?? <ExamModel>[]),
            ])
        .cast<ExamModel>()
        .toList();
  }
}
