import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/ui/widgets/common/classroom_widgets.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ClassroomListModel extends FutureViewModel<List<ClassroomModel>> {
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final trOnboardService = locator<TeacherOnboardingService>();
  final _navigationService = locator<NavigationService>();
  bool isTeacher = false;
  bool isStudent = false;
  String classActionTxt = "Add Class";

  onClassroomListViewReady() async {
    isTeacher = await _authService.isLoggedInTeacher;
    isStudent = await _authService.isLoggedInStudent;
    if (isTeacher) {
      classActionTxt = "Add Class";
    }
    if (isStudent) {
      classActionTxt = "Join Class";
    }
    rebuildUi();
  }

  @override
  Future<List<ClassroomModel>> futureToRun() async {
    var classroomListRes = await onApiGetCall<ClassroomModel>(
      getEndpoint: endPointGetUserClassrooms,
      listDataFromJson: ClassroomModel.fromJson,
    );
    if (apiCallChecks(classroomListRes, 'classroom listing')) {
      List<ClassroomModel> classrooms = classroomListRes.$1?.listData ?? [];
      await _authService.saveUserClassrooms(classrooms);
      return classrooms;
    }

    return [];
  }

  List<ClassLessonTime> get classLessonTimes {
    return ((data ?? []))
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
    return (data ?? []).map((e) => e.name ?? "--").toList();
  }

  List<double> get classTermScores {
    return (data ?? []).map((e) => e.avg_term_score ?? 0.0).toList();
  }

  List<double> get classMtihaniScores {
    return (data ?? []).map((e) => e.avg_mtihani_score ?? 0.0).toList();
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

  _onViewTrClass(ClassroomModel classroom) {
    _navigationService.navigateToSingleTrClassView(classroom: classroom);
  }

  _onViewStClass(ClassroomModel classroom) {
    _navigationService.navigateToSingleStClassView(classroom: classroom);
  }
}
