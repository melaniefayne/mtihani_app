import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/ui/views/auth/student_signup/student_signup_view.form.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StudentSignupViewModel extends BaseViewModel with FormStateHelper {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  bool isPasswordVisible = false;
  bool isLoading = false;
  String? confirmPassValidationMessage;

  togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    rebuildUi();
  }

  validatePassword() {
    confirmPassValidationMessage = formConfirmPasswordValidator(
        studentPasswordValue, studentConfirmPasswordValue);
  }

  onApiStudentSignup() async {
    validateForm();
    if (!isFormValid) {
      rebuildUi();
      return;
    }

    validatePassword();
    if (confirmPassValidationMessage != null) {
      rebuildUi();
      return;
    }

    Map<String, dynamic> studentBody = {
      "first_name": firstNameValue,
      "last_name": lastNameValue,
      "email": studentEmailValue,
      "student_code": studentCodeValue,
      "password": studentPasswordValue,
      "role": appStudentRoleKw,
    };

    // isLoading = true;
    // rebuildUi();
    // var apiCallRes = await onApiPostCall(
    //   postEndpoint: endPointStudentRegister,
    //   skipTokenCheck: true,
    //   dataMap: studentBody,
    // );
    // isLoading = false;
    // rebuildUi();
    // if (apiCallChecks(apiCallRes, "student register result",
    //         showSuccessMessage: true) ==
    //     true) {
    //   Map<String, dynamic> resData = apiCallRes.$5;
    //   UserModel newUser = UserModel.fromJson(resData["user"]);
    //   await _authService.saveUserProfile(newUser);
    //   await _authService.saveUserToken(resData["token"]);
    //   _navigationService.clearStackAndShow(Routes.dashboardView);
    // }

    // DUMMY ===========================
    // =================================
    await _authService.saveUserProfile(dummyStUser);
    await _authService.saveUserToken(dummyToken);
    _navigationService.clearStackAndShow(Routes.dashboardView);
  }

  onBackToLogin() {
    _navigationService.back();
  }
}
