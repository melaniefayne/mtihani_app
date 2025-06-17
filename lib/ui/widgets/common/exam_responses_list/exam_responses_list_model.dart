import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ExamResponsesListModel extends MultipleFutureViewModel {
  final ExamModel exam;
  ExamResponsesListModel(this.exam);
  static const String percentilesFetch = 'percentilesFetch';
  static const String responsesFetch = 'responsesFetch';
  @override
  Map<String, Future Function()> get futuresMap => {
        percentilesFetch: fetchExamPerfPercentiles,
        responsesFetch: fetchExamResponses,
      };

  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPrefsService>();

  // Percentiles
  StrandPerformanceModel? get examPercentiles => dataMap?[percentilesFetch];
  bool get isFetchingExamPercentiles => busy(percentilesFetch);
  Future<StrandPerformanceModel?> fetchExamPerfPercentiles() async {
    if (!isExamComplete) return null;
    var percentilesApiRes = await onApiGetCall<StrandPerformanceModel>(
      getEndpoint: endPointGetPercentilePerformances,
      queryParams: {"exam_id": exam.id},
      dataFromJson: StrandPerformanceModel.fromJson,
    );
    if (apiCallChecks(percentilesApiRes, 'exam percentiles listing')) {
      return percentilesApiRes.$1?.data;
    }

    return null;
  }

  onPercentileViewExamSession(Map<String, String> item) async {
    ExamModel studentExam =
        allStudentExams.firstWhere((e) => e.student_name == item['name']);
    studentExam = studentExam.copyWith(
        id: studentExam.exam_id, status: exam.status, code: exam.code);

    bool canNavigate =
        await _sharedPrefsService.setSingleStExamNavArg(studentExam);
    if (canNavigate) {
      _navigationService.navigateToSingleStExamView();
    }
  }

  List<ExamModel> get allStudentExams {
    return [
      ...(examPercentiles?.top_students ?? <ExamModel>[]),
      ...(examPercentiles?.bottom_students ?? <ExamModel>[]),
    ].cast<ExamModel>().toList();
  }

  // Responses
  List<StudentExamSessionModel> sessionsList = [];
  bool isLoadMore = false;
  String? nextPageUrl;
  String? selectedStudentExpectation;
  TextEditingController searchTxtCtrl = TextEditingController();
  bool isSearchActive = false;
  String? searchTerm;

  List<StudentExamSessionModel>? get examResponses => dataMap?[responsesFetch];
  bool get isFetchingExamResponses => busy(responsesFetch);
  Future<List<StudentExamSessionModel>> fetchExamResponses() async {
    Map<String, dynamic> queryParams = {"exam_id": exam.id};

    if (!isStringEmptyOrNull(searchTerm)) {
      queryParams["search"] = searchTerm;
    }

    if (selectedStudentExpectation != null) {
      queryParams["expectation_level"] = selectedStudentExpectation;
    }

    var sessionsApiRes = await onApiGetCall<StudentExamSessionModel>(
      getEndpoint: isLoadMore
          ? nextPageUrl ?? endPointGetStudentExamSessions
          : endPointGetStudentExamSessions,
      queryParams: queryParams,
      listDataFromJson: StudentExamSessionModel.fromJson,
    );

    if (apiCallChecks(sessionsApiRes, 'exam sessions listing')) {
      List<StudentExamSessionModel> resStudents =
          sessionsApiRes.$1?.listData ?? [];
      sessionsList =
          isLoadMore ? [...sessionsList, ...resStudents] : resStudents;
      nextPageUrl = sessionsApiRes.$1?.next;
      return sessionsList;
    }

    return [];
  }

  onViewMore() async {
    if (nextPageUrl != null) {
      isLoadMore = true;
      await initialise();
      isLoadMore = false;
    }
  }

  Timer? _searchDebounce;
  onSearchTermChanged(String? val) async {
    if (_searchDebounce?.isActive ?? false) _searchDebounce!.cancel();
    _searchDebounce = Timer(const Duration(seconds: 1), () async {
      searchTerm = val;

      if (isStringEmptyOrNull(val)) {
        await onSearchCanceled();
        return;
      }

      isSearchActive = true;
      await initialise();
    });
  }

  onSearchCanceled() async {
    isSearchActive = false;
    searchTerm = null;
    searchTxtCtrl.clear();
    await initialise();
  }

  onChangeStudentExpectation(String expectation) {
    if (expectation == 'All') {
      selectedStudentExpectation = null;
    } else {
      selectedStudentExpectation = expectation;
    }
    initialise();
  }

  onViewExamSession(StudentExamSessionModel session) async {
    ExamModel studentExam = getExamFromSession(session);
    bool canNavigate =
        await _sharedPrefsService.setSingleStExamNavArg(studentExam);
    if (canNavigate) {
      _navigationService.navigateToSingleStExamView();
    }
  }

  bool get isExamComplete => exam.status == ExamStatus.complete;

  ExamModel getExamFromSession(StudentExamSessionModel session) {
    return exam.copyWith(student_id: session.student_id);
  }
}
