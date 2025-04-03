import 'dart:developer';

import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/ui/views/student_signup/student_signup_view.form.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StudentSignupViewModel extends BaseViewModel with FormStateHelper {
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

  onStudentSignup() async {
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

    isLoading = true;
    rebuildUi();
    Map<String, dynamic> studentBody = {
      "first_name": firstNameValue,
      "last_name": lastNameValue,
      "email": studentEmailValue,
      "student_code": studentCodeValue,
      "password": studentPasswordValue,
      "role": appStudentRoleKw,
    };

    log('Signing up with $studentBody');
    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    rebuildUi();
  }

  onBackToLogin() {
    _navigationService.back();
  }
}
