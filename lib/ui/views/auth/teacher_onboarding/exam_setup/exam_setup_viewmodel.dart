import 'dart:convert';
import 'dart:developer';

import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/exam_setup/cbc_data.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_html/html.dart' as html;

const String cbcFetchKey = 'cbcFetchKey';
const String classScoresKey = 'classScoresKey';

class ExamSetupViewModel extends MultipleFutureViewModel {
  final _trOnboardingService = locator<TeacherOnboardingService>();
  ClassModel? get currentClass => _trOnboardingService.currentClass;
  bool isLoading = false;
  String? examSetupError;

  // ==== STRANDS
  List<GradeModel> get fetchedCbc => _fetchedCbc;
  List<double> get fetchedClassScores => dataMap?[classScoresKey] ?? [];
  bool get fetchingCbc => busy(cbcFetchKey);
  bool get fetchingClassScores => busy(classScoresKey);
  @override
  Map<String, Future Function()> get futuresMap => {
        cbcFetchKey: fetchCbcCurriculum,
        classScoresKey: fetchClassScores,
      };
  List<GradeModel> _fetchedCbc = [];
  List<int> allStrandIds = [];
  List<int> selectedStrandsIds = [];
  String? strandSelectError;
  Future<List<GradeModel>> fetchCbcCurriculum() async {
    List<GradeModel> gradeContent =
        cbcDummyData.map((e) => GradeModel.fromJson(e)).toList();
    allStrandIds = gradeContent
        .where((e) => int.parse(e.grade ?? '') <= currentClass!.grade!)
        .expand((e) => (e.strands ?? []))
        .map((s) => s.id ?? -1)
        .where((id) => id != -1)
        .toList()
        .cast<int>();
    selectedStrandsIds = [...allStrandIds];
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
    isLoading = true;
    rebuildUi();

    Map<String, dynamic> examBody = {
      "class_id": currentClass!.id,
      "selected_strand_ids": selectedStrandsIds,
      "selected_times": selectedTimes.map((e) => getApiDateTime(e)).toList(),
    };
    if (selectedFiles.isNotEmpty) {
      examBody["selected_files"] = selectedFiles;
    }

    log('Creating exam with ${jsonEncode(examBody)}');
    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    rebuildUi();

    onGoToHome();
  }

  onGoToHome() {
    _trOnboardingService.onFinishOnboarding();
  }
}
