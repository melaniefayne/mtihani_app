import 'dart:async';

import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/ui/widgets/common/dash_page/dash_page_model.dart';
import 'package:mtihani_app/ui/widgets/common/exam_widgets.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked_services/stacked_services.dart';

class ExamListViewModel extends DashPageModel<List<ExamModel>> {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPrefsService>();
  bool isTeacher = false;
  bool isStudent = false;
  bool isLoadMore = false;
  String? nextPageUrl;
  List<ExamModel> examList = [];
  ClassroomModel? selectedClass;
  String? selectedExamStatus;
  String? selectedExamIsPublished;
  int? studentId;
  final Completer<void> _studentIdLoaded = Completer<void>();

  ExamListViewModel(super.userClassrooms, super.loggedInUser) {
    isTeacher = loggedInUser.role == appTeacherRoleKw;
    isStudent = loggedInUser.role == appStudentRoleKw;
    selectedClass = isSingleClassView ? userClassrooms.first : null;
  }

  onViewModelReady() async {
    studentId = await getStudentId();
    _studentIdLoaded.complete();
  }

  bool get isSingleClassView => userClassrooms.length == 1;

  @override
  Future<List<ExamModel>> futureToRun() async {
    await _studentIdLoaded.future; // wait until student is loaded

    Map<String, dynamic> queryParams = {};

    if (selectedClass != null) {
      queryParams["classroom_id"] = selectedClass!.id;
    }

    if (studentId != null) {
      queryParams["student_id"] = studentId;
    }

    if (selectedExamStatus != null) {
      queryParams["status"] = selectedExamStatus;
    }

    if (selectedExamIsPublished != null) {
      queryParams["is_published"] =
          selectedExamIsPublished == examIsPublishedKw;
    }

    var examApiRes = await onApiGetCall<ExamModel>(
      getEndpoint: isLoadMore
          ? nextPageUrl ?? endPointGetUserExams
          : endPointGetUserExams,
      queryParams: queryParams,
      listDataFromJson: ExamModel.fromJson,
    );

    if (apiCallChecks(examApiRes, 'exam listing')) {
      List<ExamModel> resExams = examApiRes.$1?.listData ?? [];
      examList = isLoadMore ? [...examList, ...resExams] : resExams;
      nextPageUrl = examApiRes.$1?.next;
      return examList;
    }

    return [];
  }

  onViewMoreExams() async {
    if (nextPageUrl != null) {
      isLoadMore = true;
      await initialise();
      isLoadMore = false;
    }
  }

  // ===== FILTERS

  onChangeClass(ClassroomModel classroom) {
    if (!isSingleClassView) {
      selectedClass = classroom;
      initialise();
    }
  }

  onChangeExamStatus(String examStatus) {
    selectedExamStatus = examStatus;
    initialise();
  }

  onChangeExamIsPublished(String isPublished) {
    selectedExamIsPublished = isPublished;
    initialise();
  }

  onGenerateExam() async {
    ClassroomModel? chosenClass = isSingleClassView
        ? userClassrooms.first
        : (await _dialogService.showCustomDialog(
            variant: DialogType.classSelector,
            data: {'userClassrooms': userClassrooms},
          ))
            ?.data as ClassroomModel?;

    if (chosenClass != null) {
      bool canNavigate =
          await _sharedPrefsService.setSingleTrClassroomNavArg(chosenClass);
      if (canNavigate) _navigationService.navigateToExamSetupView();
    }
  }

  onViewExam(ExamModel exam) async {
    if (isStudent && studentViewExamStatuses.contains(exam.status)) {
      bool canNavigate = await _sharedPrefsService.setSingleStExamNavArg(exam);

      if (canNavigate) {
        if (exam.status == ExamStatus.ongoing) {
          var dialogRes = await _dialogService.showCustomDialog(
            variant: DialogType.startExam,
            data: {"currentExam": exam, "isStartExamDialog": true},
          );
          bool? isConfirmed = dialogRes?.data;
          if (isConfirmed == true) {
            _navigationService.navigateToStExamSessionView();
          }
          return;
        }

        _navigationService.navigateToSingleStExamView();
        return;
      }
    }

    if (studentId != null) {
      bool canNavigate = await _sharedPrefsService.setSingleStExamNavArg(exam);
      if (canNavigate) _navigationService.navigateToSingleStExamView();
      return;
    }

    if (isTeacher) {
      bool canNavigate = await _sharedPrefsService.setSingleTrExamNavArg(exam);
      if (canNavigate) _navigationService.navigateToSingleTrExamView();
      return;
    }
  }

  onRetryExamGeneration(ExamModel exam) async {
    var apiCallRes = await onApiPostCall(
      postEndpoint: endPointRetryExamGeneration,
      queryParams: {"exam_id": exam.id},
    );
    if (apiCallChecks(apiCallRes, "retry exam generation result",
            showSuccessMessage: true) ==
        true) {
      await initialise();
    }
  }

  Future<int?> getStudentId() async {
    StudentModel? student =
        await _sharedPrefsService.getSingleStClassroomNavArg();
    return student?.id;
  }
}
