import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/ui/widgets/common/classroom_widgets.dart';
import 'package:mtihani_app/ui/widgets/common/dash_page/dash_page_model.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked_services/stacked_services.dart';

class ClassroomListViewModel extends DashPageModel {
  final _dialogService = locator<DialogService>();
  final trOnboardService = locator<TeacherOnboardingService>();
  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPrefsService>();
  bool isTeacher = false;
  bool isStudent = false;
  String classActionTxt = "Add Class";

  ClassroomListViewModel(super.userClassrooms, super.loggedInUser);

  onClassroomListViewViewReady() async {
    isTeacher = loggedInUser.role == appTeacherRoleKw;
    isStudent = loggedInUser.role == appStudentRoleKw;
    classActionTxt = isTeacher ? "Add Class" : "Join Class";
    rebuildUi();
  }

  @override
  Future<List<ClassroomModel>> futureToRun() async => [];

  List<ClassLessonTime> get classLessonTimes {
    return ((userClassrooms))
        .expand((classroom) => (classroom.lesson_times ?? []).map(
              (lesson) => ClassLessonTime(
                className: classroom.name ?? "--",
                lessonTime: lesson,
              ),
            ))
        .toList()
      ..sort((a, b) => a.lessonTime.compareTo(b.lessonTime));
  }

  List<String> get classNames {
    return (userClassrooms).map((e) => e.name ?? "--").toList();
  }

  List<double> get classTermScores {
    return (userClassrooms).map((e) => e.avg_term_score ?? 0.0).toList();
  }

  List<double> get classMtihaniScores {
    return (userClassrooms).map((e) => e.avg_mtihani_score ?? 0.0).toList();
  }

  onOnboardClassroom() {
    if (isTeacher) {
      _onAddClass();
      return;
    }

    if (isStudent) {
      _onJoinClass();
      return;
    }
  }

  _onAddClass() {
    trOnboardService.onSetIsFromOnboarding(false);
    _navigationService.navigateToClassFormView();
  }

  _onJoinClass() async {
    var dialogRes = await _dialogService.showCustomDialog(
      variant: DialogType.joinClass,
    );
    bool? isSuccessfulJoin = dialogRes?.data;
    if (isSuccessfulJoin == true) {
      initialise();
    }
  }

  onViewClassItem(ClassroomModel classroom) {
    if (isTeacher) {
      _onViewTrClass(classroom);
      return;
    }

    if (isStudent) {
      _onViewStClass(classroom);
      return;
    }
  }

  _onViewTrClass(ClassroomModel classroom) async {
    bool canNavigate =
        await _sharedPrefsService.setSingleTrClassroomNavArg(classroom);
    if (canNavigate) _navigationService.navigateToSingleTrClassView();
  }

  _onViewStClass(ClassroomModel classroom) async {
    ClassroomStudentModel student = await getStudentFromClassroom(classroom);
    bool canNavigate =
        await _sharedPrefsService.setSingleStClassroomNavArg(student);
    if (canNavigate) _navigationService.navigateToSingleStClassView();
  }

  Future<ClassroomStudentModel> getStudentFromClassroom(
      ClassroomModel classroom) async {
    return ClassroomStudentModel(
      id: loggedInUser.student_id,
      code: classroom.student_code,
      avg_score: classroom.avg_term_score,
      avg_expectation_level: classroom.avg_term_expectation_level,
      avg_mtihani_score: classroom.avg_mtihani_score,
      avg_mtihani_expectation_level: classroom.avg_mtihani_expectation_level,
      term_scores: [...classroom.term_scores ?? []],
      classroom_id: classroom.id,
      classroom_name: classroom.name,
    );
  }
}
