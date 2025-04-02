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
      _navigationService.replaceWithLoginView();
      return;
    }

    switch (userProfile.role) {
      case teacherRole:
        _navigationService.replaceWithTeacherHomeView();
        break;
      case studentRole:
        _navigationService.replaceWithStudentHomeView();
        break;
      default:
        _navigationService.replaceWithLoginView();
    }
  }
}
