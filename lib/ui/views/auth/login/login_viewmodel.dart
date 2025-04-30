import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/ui/views/auth/login/login_view.form.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel with FormStateHelper {
  final _dialogService = locator<DialogService>();
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  bool isPasswordVisible = false;
  bool isLoading = false;

  togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    rebuildUi();
  }

  onApiUserLogin() async {
    validateForm();
    if (!isFormValid) {
      rebuildUi();
      return;
    }

    isLoading = true;
    rebuildUi();
    var apiCallRes = await onApiPostCall(
      postEndpoint: endPointLoginUser,
      skipTokenCheck: true,
      dataMap: {"email": emailValue, "password": passwordValue},
    );
    isLoading = false;
    rebuildUi();
    if (apiCallChecks(apiCallRes, "login result", showSuccessMessage: true) ==
        true) {
      Map<String, dynamic> resData = apiCallRes.$5;
      UserModel newUser = UserModel.fromJson(resData["user"]);
      await _authService.saveUserProfile(newUser);
      await _authService.saveUserToken(resData["token"]);
      _navigationService.clearStackAndShow(Routes.dashboardView);
    }
  }

  void onCreateAccountTapped() async {
    var dialogRes = await _dialogService.showCustomDialog(
      variant: DialogType.roleSignup,
    );
    String? selectedRole = dialogRes?.data;
    if (selectedRole != null) {
      switch (selectedRole) {
        case appTeacherRoleKw:
          _navigationService.navigateToTeacherOnboardingView();
          break;
        case appStudentRoleKw:
          _navigationService.navigateToStudentSignupView();
          break;
        default:
          break;
      }
    }
  }
}
