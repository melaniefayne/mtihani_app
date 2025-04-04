import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/exam_setup/cbc_data.dart';
import 'package:stacked/stacked.dart';

const String cbcFetchKey = 'cbcFetchKey';
const String classScoresKey = 'classScoresKey';

class ExamSetupViewModel extends MultipleFutureViewModel {
  final _trOnboardingService = locator<TeacherOnboardingService>();
  ClassModel? get currentClass => _trOnboardingService.currentClass;

  bool isLoading = false;
  List<int> selectedStrands = [];

  List<GradeModel> _fetchedCbc = [];
  List<GradeModel> get fetchedCbc => _fetchedCbc;
  List<double> get fetchedClassScores => dataMap?[classScoresKey] ?? [];
  bool get fetchingCbc => busy(cbcFetchKey);
  bool get fetchingClassScores => busy(classScoresKey);
  @override
  Map<String, Future Function()> get futuresMap => {
        cbcFetchKey: fetchCbcCurriculum,
        classScoresKey: fetchClassScores,
      };

  Future<List<GradeModel>> fetchCbcCurriculum() async {
    List<GradeModel> gradeContent =
        cbcDummyData.map((e) => GradeModel.fromJson(e)).toList();

    selectedStrands = gradeContent
        .where((e) => int.parse(e.grade ?? '') <= currentClass!.grade!)
        .expand((e) => (e.strands ?? []))
        .map((s) => s.id ?? -1)
        .where((id) => id != -1)
        .toList()
        .cast<int>();

    return gradeContent;
  }

  Future<List<double>> fetchClassScores() async {
    return [];
  }

  refreshView() async {
    setBusyForObject(cbcFetchKey, true);
    try {
      final cbc = await fetchCbcCurriculum();
      _fetchedCbc = cbc;
      rebuildUi();
    } finally {
      setBusyForObject(cbcFetchKey, false);
    }
  }

  onStrandSelected(int strandId) {
    if (selectedStrands.contains(strandId)) {
      selectedStrands.remove(strandId);
    } else {
      selectedStrands.add(strandId);
    }
    rebuildUi();
  }

  onApiExamSetup() async {
    onGoToHome();
  }

  onGoToHome() {
    _trOnboardingService.onFinishOnboarding();
  }
}
