import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/ui/widgets/common/dash_page/dash_page_model.dart';
import 'package:mtihani_app/ui/widgets/common/exam_widgets.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked_services/stacked_services.dart';

class ExamListViewModel extends DashPageModel<List<ExamModel>> {
  final _dialogService = locator<DialogService>();
  final _trOnboardService = locator<TeacherOnboardingService>();
  final _navigationService = locator<NavigationService>();

  List<ClassroomModel> examClassrooms = [];
  ClassroomModel? currentClassroom;
  bool isSingleClassView = false;

  bool isTeacher = false;
  bool isStudent = false;
  bool isLoadMore = false;
  String? nextPageUrl;
  List<ExamModel> examList = [];
  ClassroomModel? selectedClass;
  String? selectedExamStatus;
  String? selectedExamIsPublished;

  ExamListViewModel(
      super.userClassrooms, super.loggedInUser, this.currentClassroom);

  onExamListViewReady() async {
    isTeacher = loggedInUser.role == appTeacherRoleKw;
    isStudent = loggedInUser.role == appStudentRoleKw;
    isSingleClassView = currentClassroom != null;
    examClassrooms =
        isSingleClassView ? [currentClassroom!] : [...userClassrooms];
    selectedClass = isSingleClassView ? currentClassroom : null;
    rebuildUi();
  }

  @override
  Future<List<ExamModel>> futureToRun() async {
    Map<String, dynamic> queryParams = {};

    if (selectedClass != null) {
      queryParams["classroom_id"] = selectedClass!.id;
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

  onGenerateExam() async {
    final hasMultipleClasses = userClassrooms.length > 1;

    final selectedClass = hasMultipleClasses
        ? (await _dialogService.showCustomDialog(
            variant: DialogType.classSelector,
            data: {'loggedInUserClassrooms': userClassrooms},
          ))
            ?.data as ClassroomModel?
        : userClassrooms.first;

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

  onChangeExamIsPublished(String isPublished) {
    selectedExamIsPublished = isPublished;
    initialise();
  }
}
