import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  Future runStartupLogic() async {
    final authCheckRes = await _authService.checkIsAuthenticated();
    UserModel? userProfile = authCheckRes.$2;

    if (!authCheckRes.$1 || userProfile == null) {
      _navigationService.clearStackAndShow(Routes.loginView);
      return;
    }

    switch (userProfile.role) {
      case appTeacherRoleKw:
        _navigationService.clearStackAndShow(Routes.teacherHomeView);
        break;
      case appStudentRoleKw:
        _navigationService.clearStackAndShow(Routes.studentHomeView);
        break;
      default:
        _navigationService.clearStackAndShow(Routes.loginView);
    }
  }
}
