import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/services/cbc_service.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:universal_html/html.dart' as html;

class ExamSetupViewModel extends BaseViewModel {
  final _sharedPrefsService = locator<SharedPrefsService>();
  ClassroomModel? trClassroom;
  List<GradeModel> currentClassCurriculum = [];
  List<int> allStrandIds = [];
  List<int> selectedStrandsIds = [];
  //
  final _navigationService = locator<NavigationService>();
  final _cbcService = locator<CbcService>();
  bool isLoading = false;
  String? examSetupError;

  int defaultGrade = allGradesList.first;

  String? strandSelectError;

  onExamSetupViewReady() async {
    trClassroom = await _sharedPrefsService.getSingleTrClassroomNavArg();
    if (trClassroom == null) {
      _navigationService.clearStackAndShow(Routes.startupView);
      return;
    }
    currentClassCurriculum =
        _cbcService.getGradesUpTo(trClassroom!.grade ?? defaultGrade);

    allStrandIds = currentClassCurriculum
        .where((e) => (e.grade ?? defaultGrade) <= trClassroom!.grade!)
        .expand((e) => (e.strands ?? []))
        .map((s) => s.id ?? -1)
        .where((id) => id != -1)
        .toList()
        .cast<int>();
    selectedStrandsIds = [...allStrandIds];
    rebuildUi();
  }

  onStrandSelected(int strandId) {
    strandSelectError = null;

    if (selectedStrandsIds.contains(strandId)) {
      if (selectedStrandsIds.length == 1) {
        strandSelectError = "You must select at least one strand";
        rebuildUi();
        return;
      }
      selectedStrandsIds.remove(strandId);
    } else {
      selectedStrandsIds.add(strandId);
    }
    rebuildUi();
  }

  onSelectAllStrands() {
    if (!hasSelectedAllStrands) {
      strandSelectError = null;
      selectedStrandsIds.clear();
      selectedStrandsIds.addAll(allStrandIds);
      rebuildUi();
    }
  }

  bool get hasSelectedAllStrands =>
      selectedStrandsIds.length == allStrandIds.length;

  List<StrandModel> get selectedStrands {
    return currentClassCurriculum
        .where((grade) => grade.strands != null)
        .expand((grade) => grade.strands!)
        .toList()
        .where((strand) => selectedStrandsIds.contains(strand.id))
        .toList();
  }

  // ==== FILES
  List<html.File> selectedFiles = [];
  onCustomFileSelected(html.File file) {
    selectedFiles.add(file);
    rebuildUi();
  }

  onCustomFilesRemoved(int fileIdx) {
    selectedFiles.removeAt(fileIdx);
    rebuildUi();
  }

  // ==== TIMES
  List<DateTime> selectedTimes = [];
  onDateTimesSelected(DateTime startTime, DateTime endTime) {
    selectedTimes.clear();
    selectedTimes.addAll([startTime, endTime]);
    examSetupError = null;
    rebuildUi();
  }

  // ==== SUBMIT
  onConfirmExamConfig() async {
    if (selectedStrands.isEmpty) {
      examSetupError = "You must select at least one strand to continue";
      rebuildUi();
      return;
    }

    if (selectedTimes.isEmpty) {
      examSetupError = "Confirm exam schedule to continue";
      rebuildUi();
      return;
    }

    examSetupError = null;
    rebuildUi();

    await onApiExamSetup();
  }

  onApiExamSetup() async {
    Map<String, dynamic> examBody = {
      "start_date_time": selectedTimes.first.toIso8601String(),
      "end_date_time": selectedTimes.last.toIso8601String(),
      "strand_ids": selectedStrandsIds,
      // "question_count": 3,
      // "bloom_skill_count": 1,
    };
    if (selectedFiles.isNotEmpty) {
      examBody["selected_files"] = selectedFiles;
    }

    isLoading = true;
    rebuildUi();
    var apiCallRes = await onApiPostCall(
      queryParams: {"classroom_id": trClassroom!.id},
      postEndpoint: endPointCreateClassroomExam,
      dataMap: examBody,
    );
    isLoading = false;
    rebuildUi();

    if (apiCallChecks(apiCallRes, "exam generation result",
            showSuccessMessage: true) ==
        true) {
      _navigationService.clearStackAndShow(Routes.dashboardView);
    }
  }

  onDispose() async {
    await _sharedPrefsService.clearSingleTrClassroomNavArg();
  }
}
