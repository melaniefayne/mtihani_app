import 'dart:convert';
import 'dart:developer';

import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/services/cbc_service.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:universal_html/html.dart' as html;

class ExamSetupViewModel extends FutureViewModel {
  final _navigationService = locator<NavigationService>();
  final _trOnboardingService = locator<TeacherOnboardingService>();
  final _cbcService = locator<CbcService>();
  bool get isFromOnboarding => _trOnboardingService.isFromOnboarding;
  bool isLoading = false;
  String? examSetupError;
  List<GradeModel> currentClassCurriculum = [];
  int defaultGrade = allGradesList.first;
  late ClassroomModel currentClass;
  List<int> allStrandIds = [];
  List<int> selectedStrandsIds = [];
  String? strandSelectError;

  ExamSetupViewModel() {
    onExamSetupViewReady();
  }

  onExamSetupViewReady() {
    if (_trOnboardingService.currentClass == null) {
      _navigationService.clearStackAndShow(Routes.teacherClassesView);
      return;
    }

    currentClass = _trOnboardingService.currentClass!;
    currentClassCurriculum =
        _cbcService.getGradesUpTo(currentClass.grade ?? defaultGrade);

    allStrandIds = currentClassCurriculum
        .where((e) => (e.grade ?? defaultGrade) <= currentClass.grade!)
        .expand((e) => (e.strands ?? []))
        .map((s) => s.id ?? -1)
        .where((id) => id != -1)
        .toList()
        .cast<int>();
    selectedStrandsIds = [...allStrandIds];
  }

  @override
  Future<List<StrandScoreModel>> futureToRun() async {
    // var classStrandScApiRes = await onApiGetCall<StrandScoreModel>(
    //   getEndpoint: endPointGetClassStrandScores,
    //   queryParams: {"class_id": currentClass.id},
    // );

    // if (apiCallChecks(classStrandScApiRes, 'class strand scores')) {
    //   return classStrandScApiRes.$1?.listData ?? [];
    // }

    // return [];

    // DUMMY ===========================
    // =================================
    return dummyTrClass1StrandScores;
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
      "class_id": currentClass.id,
      "selected_strand_ids": selectedStrandsIds,
      "selected_times": selectedTimes
          .map((e) => getFormattedDate(e, apiDateTimeFormat))
          .toList(),
    };
    if (selectedFiles.isNotEmpty) {
      examBody["selected_files"] = selectedFiles;
    }

    log('Creating exam with ${jsonEncode(examBody)}');

    // isLoading = true;
    // rebuildUi();
    // var apiCallRes = await onApiPostCall(
    //   postEndpoint: endPointCreateExam,
    //   dataMap: examBody,
    // );
    // isLoading = false;
    // rebuildUi();

    // if (apiCallChecks(apiCallRes, "exam generation result",
    //         showSuccessMessage: true) ==
    //     true) {
    //   onGoToHome();
    // }

    // DUMMY ===========================
    // =================================
    onGoToHome();
  }

  onGoToHome() {
    _trOnboardingService.onFinishOnboarding();
  }
}
