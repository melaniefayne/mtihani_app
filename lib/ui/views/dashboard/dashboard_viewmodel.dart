import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends IndexTrackingViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  UserModel loggedInUser = UserModel();
  bool isLoading = false;

  onDashboardViewReady() async {
    isLoading = true;
    rebuildUi();

    await fetchUserProfile();

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
  }

  bool get isTeacherRole => loggedInUser.role == appTeacherRoleKw;
}
