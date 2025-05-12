import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ExamResponsesListModel
    extends FutureViewModel<List<StudentExamSessionModel>> {
  final ExamModel exam;
  ExamResponsesListModel(this.exam);

  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPrefsService>();
  List<StudentExamSessionModel> sessionsList = [];
  bool isLoadMore = false;
  String? nextPageUrl;
  String? selectedStudentExpectation;
  TextEditingController searchTxtCtrl = TextEditingController();
  bool isSearchActive = false;
  String? searchTerm;

  @override
  Future<List<StudentExamSessionModel>> futureToRun() async {
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
    selectedStudentExpectation = expectation;
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
