import 'dart:convert';
import 'dart:developer';

import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/class_strand_score.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/data/cbc_data.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:universal_html/html.dart' as html;

const String cbcFetchKey = 'cbcFetchKey';
const String classStrandScoresFetchKey = 'classStrandScoresFetchKey';

class ExamSetupViewModel extends MultipleFutureViewModel {
  final _navigationService = locator<NavigationService>();
  final _trOnboardingService = locator<TeacherOnboardingService>();
  bool get isFromOnboarding => _trOnboardingService.isFromOnboarding;
  bool isLoading = false;
  String? examSetupError;
  late ClassroomModel currentClass;

  ExamSetupViewModel() {
    onExamSetupViewReady();
  }

  onExamSetupViewReady() async {
    if (_trOnboardingService.currentClass == null) {
      _navigationService.clearStackAndShow(Routes.teacherHomeView);
      return;
    }
    await refreshView();
    currentClass = _trOnboardingService.currentClass!;
  }

  // ==== STRANDS
  List<GradeModel> _fetchedCbc = [];
  List<GradeModel> get fetchedCbc => _fetchedCbc;
  List<ClassStrandScore> get fetchedClassScores =>
      dataMap?[classStrandScoresFetchKey] ?? [];
  bool get isFetchingCbc => busy(cbcFetchKey);
  bool get isFetchingClassStrandScores => busy(classStrandScoresFetchKey);
  @override
  Map<String, Future Function()> get futuresMap => {
        cbcFetchKey: fetchCbcCurriculum,
        classStrandScoresFetchKey: fetchStrandClassScores,
      };

  List<int> allStrandIds = [];
  List<int> selectedStrandsIds = [];
  String? strandSelectError;

  Future<List<GradeModel>> fetchCbcCurriculum() async {
    var cbcApiRes = await onApiGetCall<GradeModel>(
      getEndpoint: endPointGetClassCurriculum,
      queryParams: {"class_id": currentClass.id},
    );

    if (apiCallChecks(cbcApiRes, 'class curriculum')) {
      return cbcApiRes.$1?.listData ?? [];
    }

    List<GradeModel> gradeContent =
        cbcDummyData.map((e) => GradeModel.fromJson(e)).toList();
    allStrandIds = gradeContent
        .where((e) => int.parse(e.grade ?? '') <= currentClass.grade!)
        .expand((e) => (e.strands ?? []))
        .map((s) => s.id ?? -1)
        .where((id) => id != -1)
        .toList()
        .cast<int>();
    selectedStrandsIds = [...allStrandIds];
    return gradeContent;
  }

  Future<List<ClassStrandScore>> fetchStrandClassScores() async {
    var classStrandScApiRes = await onApiGetCall<ClassStrandScore>(
      getEndpoint: endPointGetClassStrandScores,
      queryParams: {"class_id": currentClass.id},
    );

    if (apiCallChecks(classStrandScApiRes, 'class strand scores')) {
      return classStrandScApiRes.$1?.listData ?? [];
    }

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
      selectedStrandsIds.clear();
      selectedStrandsIds.addAll(allStrandIds);
      rebuildUi();
    }
  }

  bool get hasSelectedAllStrands =>
      selectedStrandsIds.length == allStrandIds.length;

  List<StrandModel> get selectedStrands {
    return fetchedCbc
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

    isLoading = true;
    rebuildUi();
    var apiCallRes = await onApiPostCall(
      postEndpoint: endPointCreateExam,
      dataMap: examBody,
    );
    isLoading = false;
    rebuildUi();

    if (apiCallChecks(apiCallRes, "exam generation result",
            showSuccessMessage: true) ==
        true) {
      onGoToHome();
    }
  }

  onGoToHome() {
    _trOnboardingService.onFinishOnboarding();
  }
}
