import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/teacher_signup/teacher_signup_view.form.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';

class TeacherSignupViewModel extends BaseViewModel with FormStateHelper {
  final _trOnboardingService = locator<TeacherOnboardingService>();
  final _authService = locator<AuthService>();
  bool isPasswordVisible = false;
  bool isLoading = false;
  String? confirmPassValidationMessage;

  togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    rebuildUi();
  }

  validatePassword() {
    confirmPassValidationMessage = formConfirmPasswordValidator(
        teacherPasswordValue, teacherConfirmPasswordValue);
  }

  onApiTeacherSignup() async {
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

    Map<String, dynamic> teacherBody = {
      "first_name": firstNameValue,
      "last_name": lastNameValue,
      "email": teacherEmailValue,
      "phone_no": phoneNoValue,
      "password": teacherPasswordValue,
      "role": appTeacherRoleKw,
    };

    isLoading = true;
    rebuildUi();
    var apiCallRes = await onApiPostCall(
      postEndpoint: endPointTeacherRegister,
      skipTokenCheck: true,
      dataMap: teacherBody,
    );
    isLoading = false;
    rebuildUi();
    if (apiCallChecks(apiCallRes, "teacher register result",
            showSuccessMessage: true) ==
        true) {
      Map<String, dynamic> resData = apiCallRes.$5;
      UserModel newUser = UserModel.fromJson(resData["user"]);
      await _authService.saveUserProfile(newUser);
      await _authService.saveUserToken(resData["token"]);
      onGoToNext();
    }
  }

  onGoToNext() {
    _trOnboardingService.goToNextPage();
  }
}
