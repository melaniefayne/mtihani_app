import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';

class StudentListingModel extends FutureViewModel<List<ClassroomStudent>> {
  final ClassroomModel classroom;

  StudentListingModel(this.classroom);

  String? nextPageUrl;
  bool isLoadMore = false;
  List<ClassroomStudent> studentList = [];
  String? selectedStudentStatus;
  String? selectedStudentExpectation;
  TextEditingController searchTxtCtrl = TextEditingController();
  bool isSearchActive = false;
  String? searchTerm;

  @override
  Future<List<ClassroomStudent>> futureToRun() async {
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

    var studentApiRes = await onApiGetCall<ClassroomStudent>(
      getEndpoint: isLoadMore
          ? nextPageUrl ?? endPointGetClassroomStudents
          : endPointGetClassroomStudents,
      queryParams: queryParams,
      listDataFromJson: ClassroomStudent.fromJson,
    );

    if (apiCallChecks(studentApiRes, 'student listing')) {
      List<ClassroomStudent> resStudents = studentApiRes.$1?.listData ?? [];
      studentList = isLoadMore ? [...studentList, ...resStudents] : resStudents;
      nextPageUrl = studentApiRes.$1?.next;
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

  onViewStudent(ClassroomStudent student) {}
}

const List<String> allStudentStatuses = ["Active", "Inactive", "Archived"];
const List<String> allExpectationLevels = [
  "Exceeding",
  "Meeting",
  "Approaching",
  "Below",
];
