import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends IndexTrackingViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  UserModel loggedInUser = UserModel();
  bool isLoading = false;
  List<ClassroomModel> userClassrooms = [];
  final _dialogService = locator<DialogService>();
  final trOnboardService = locator<TeacherOnboardingService>();
  bool isTeacher = false;
  bool isStudent = false;
  String classActionTxt = "Add Class";

  onDashboardViewReady() async {
    isLoading = true;
    rebuildUi();

    await fetchUserProfile();
    await fetchUserClassrooms();

    isLoading = false;
    rebuildUi();
  }

  fetchUserProfile() async {
    UserModel? user = await _authService.getUserProfile();
    if (user == null) {
      _navigationService.clearStackAndShow(Routes.loginView);
      return;
    }
    loggedInUser = user;
    isTeacher = user.role == appTeacherRoleKw;
    isStudent = user.role == appStudentRoleKw;
    classActionTxt = isTeacher ? "Add Class" : "Join Class";
  }

  fetchUserClassrooms() async {
    isLoading = true;
    rebuildUi();

    var classroomListRes = await onApiGetCall<ClassroomModel>(
      getEndpoint: endPointGetUserClassrooms,
      listDataFromJson: ClassroomModel.fromJson,
    );
    if (apiCallChecks(classroomListRes, 'classroom listing')) {
      userClassrooms = classroomListRes.$1?.listData ?? [];
      await _authService.saveUserClassrooms(userClassrooms);
    }

    isLoading = false;
    rebuildUi();
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
    await _dialogService.showCustomDialog(
      variant: DialogType.joinClass,
    );
  }
}
