import 'package:flutter/material.dart';
import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ExamListViewModel extends FutureViewModel<List<ExamModel>> {
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final _trOnboardService = locator<TeacherOnboardingService>();
  final _navigationService = locator<NavigationService>();

  final ClassroomModel? classroom;
  final ClassroomStudentModel? classStudent;
  bool get isClassExamList => classroom != null;
  bool get isClassStudentExamList => classStudent != null;
  bool isTeacher = false;
  bool isStudent = false;
  bool isLoadMore = false;
  String? nextPageUrl = "4d5f67ty8u9i0";
  List<ExamModel> examList = [];
  List<ClassroomModel> allFilterClasses = [];
  ClassroomModel? selectedClass;
  String? selectedExamStatus;

  ExamListViewModel(this.classroom, this.classStudent);

  onExamListViewReady() async {
    isTeacher = await _authService.isLoggedInTeacher;
    isStudent = await _authService.isLoggedInStudent;
    if (!isClassExamList && !isClassStudentExamList) {
      allFilterClasses = await _authService.loggedInUserClassrooms;
      selectedClass = null;
    } else {
      allFilterClasses = [];
      selectedClass = isClassExamList ? classroom! : null;
    }
    rebuildUi();
  }

  @override
  Future<List<ExamModel>> futureToRun() async {
    // Map<String, dynamic> queryParams = {};

    // if (selectedClass != null) {
    //   queryParams["class_id"] = selectedClass!.id;
    // }

    // if (classStudent != null) {
    //   queryParams["student_id"] = classStudent!.student_id;
    // }

    // if (selectedExamStatus != null) {
    //   queryParams["status"] = [selectedExamStatus];
    // }

    // var examsApiRes = await onApiGetCall<ExamModel>(
    //   getEndpoint: isLoadMore
    //       ? nextPageUrl ?? endPointGetExamListing
    //       : endPointGetExamListing,
    //   queryParams: queryParams,
    // );

    // if (apiCallChecks(examsApiRes, 'exam listing')) {
    //   List<ExamModel> resExams = examsApiRes.$1?.listData ?? [];
    //   examList = [...examList, ...resExams];
    //   nextPageUrl = examsApiRes.$1?.next;
    //   return examList;
    // }

    // DUMMY ==========================================
    // ================================================
    examList = [...dummyTrExams];
    //

    return examList;
  }

  onViewMoreExams() async {
    if (nextPageUrl != null) {
      isLoadMore = true;
      await initialise();
      isLoadMore = false;
    }
  }

  String get listTitle {
    return isClassExamList
        ? "Grade ${classroom!.name} Exams"
        : isClassStudentExamList
            ? "${classStudent!.name} Exams"
            : "My Exams";
  }

  onGenerateExam() async {
    List<ClassroomModel> loggedInUserClassrooms =
        await _authService.loggedInUserClassrooms;
    final hasMultipleClasses = loggedInUserClassrooms.length > 1;

    final selectedClass = hasMultipleClasses
        ? (await _dialogService.showCustomDialog(
            variant: DialogType.classSelector,
            data: {'loggedInUserClassrooms': loggedInUserClassrooms},
          ))
            ?.data as ClassroomModel?
        : loggedInUserClassrooms.first;

    if (selectedClass != null) {
      _trOnboardService.onSetCurrentClass(selectedClass);
      _trOnboardService.onSetIsFromOnboarding(false);
      _navigationService.navigateToExamSetupView();
    }
  }

  onViewExam(ExamModel exam) {}

  // ===== FILTERS

  onChangeClass(ClassroomModel classroom) {
    selectedClass = classroom;
    initialise();
  }

  onChangeExamStatus(String examStatus) {
    selectedExamStatus = examStatus;
    initialise();
  }
}
