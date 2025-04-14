import 'package:flutter/material.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ExamListWidgetModel extends FutureViewModel {
  final _navigationService = locator<NavigationService>();
  List<ExamModel> userExams = [];
  bool isLoadMore = false;
  String? nextPageUrl;

  @override
  Future<List<ExamModel>> futureToRun() async {
    Map<String, dynamic> queryParams = {};

    if (startDate != null && endDate != null) {
      queryParams["start_date"] = startDate;
      queryParams["end_date"] = endDate;
    }

    if (selectedClass != null) {
      queryParams["class_id"] = selectedClass!.id;
    }

    if (selectedExamStatus != null) {
      queryParams["exam_status"] = selectedExamStatus;
    }

    var examsApiRes = await onApiGetCall<ExamModel>(
      getEndpoint: isLoadMore
          ? nextPageUrl ?? endPointGetUserExams
          : endPointGetUserExams,
      queryParams: queryParams,
    );

    if (apiCallChecks(examsApiRes, 'exam listing', showSuccessMessage: false)) {
      List<ExamModel> resExams = examsApiRes.$1?.listData ?? [];
      userExams = [...userExams, ...resExams];
      nextPageUrl = examsApiRes.$1?.next;
      return userExams;
    }
    return [dummyExam];
  }

  onViewExam(ExamModel exam) async {
    await _navigationService.navigateToSingleExamView(examItem: exam);
    initialise();
  }

  onViewMoreExams() async {
    if (nextPageUrl != null) {
      isLoadMore = true;
      await initialise();
      isLoadMore = false;
    }
  }

  // ===== FILTERS
  ClassModel? selectedClass;
  onChangeClass(ClassModel classItem) {
    selectedClass = classItem;
    initialise();
  }

  String? selectedExamStatus;
  onChangeExamStatus(String examStatus) {
    selectedExamStatus = examStatus;
    initialise();
  }

  TextEditingController startDateTxtCtrl = TextEditingController();
  TextEditingController endDateTxtCtrl = TextEditingController();
  String? startDate;
  String? endDate;
  DateTime firstEndPickerDate = today;

  onDateChanged(DateTime? date, bool? isStartDate) async {
    if (isStartDate == true) {
      startDate = getFormattedDate(date, shortDateFormat);
      startDateTxtCtrl.text = startDate ?? '';
      if (date != null) firstEndPickerDate = date;
    } else {
      endDate = getFormattedDate(date, shortDateFormat);
      endDateTxtCtrl.text = endDate ?? '';
    }
    rebuildUi();
    bool hasStartDate = !isStringEmptyOrNull(startDate);
    bool hasEndDate = !isStringEmptyOrNull(endDate);
    if ((hasStartDate && hasEndDate) || (!hasStartDate && !hasEndDate)) {
      initialise();
    }
  }
}
