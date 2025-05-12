import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StudentListingModel extends FutureViewModel<List<StudentModel>> {
  final ClassroomModel classroom;
  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPrefsService>();

  StudentListingModel(this.classroom);

  String? nextPageUrl;
  bool isLoadMore = false;
  List<StudentModel> studentList = [];
  String? selectedStudentStatus;
  String? selectedStudentExpectation;
  TextEditingController searchTxtCtrl = TextEditingController();
  bool isSearchActive = false;
  String? searchTerm;

  @override
  Future<List<StudentModel>> futureToRun() async {
    Map<String, dynamic> queryParams = {"classroom_id": classroom.id};

    if (!isStringEmptyOrNull(searchTerm)) {
      queryParams["search"] = searchTerm;
    }

    if (selectedStudentStatus != null) {
      queryParams["status"] = selectedStudentStatus;
    }
    if (selectedStudentExpectation != null) {
      queryParams["expectation_level"] = selectedStudentExpectation;
    }

    var studentApiRes = await onApiGetCall<StudentModel>(
      getEndpoint: isLoadMore
          ? nextPageUrl ?? endPointGetStudentModels
          : endPointGetStudentModels,
      queryParams: queryParams,
      listDataFromJson: StudentModel.fromJson,
    );

    if (apiCallChecks(studentApiRes, 'student listing')) {
      List<StudentModel> resStudents = studentApiRes.$1?.listData ?? [];
      studentList = isLoadMore ? [...studentList, ...resStudents] : resStudents;
      nextPageUrl = studentApiRes.$1?.next;

      List<Map<String, dynamic>> res = studentList
          .map((e) => {"id": e.id, "avg_score": e.avg_score})
          .toList();
      log(jsonEncode(res));

      return studentList;
    }
    return [];
  }

  onViewMoreStudents() async {
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

  onChangeStudentStatus(String examStatus) {
    selectedStudentStatus = examStatus;
    initialise();
  }

  onChangeStudentExpectation(String expectation) {
    selectedStudentExpectation = expectation;
    initialise();
  }

  onViewStudent(StudentModel student) async {
    bool canNavigate =
        await _sharedPrefsService.setSingleStClassroomNavArg(student);
    if (canNavigate) {
      _navigationService.navigateToSingleStClassView();
    }
  }
}

const List<String> allStudentStatuses = ["Active", "Inactive", "Archived"];
const List<String> allExpectationLevels = [
  "Exceeding",
  "Meeting",
  "Approaching",
  "Below",
];
