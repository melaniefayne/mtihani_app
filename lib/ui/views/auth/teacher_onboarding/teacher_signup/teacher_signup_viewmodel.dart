import 'dart:developer';

import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/teacher_signup/teacher_signup_view.form.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';

class TeacherSignupViewModel extends BaseViewModel with FormStateHelper {
  final _trOnboardingService = locator<TeacherOnboardingService>();
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
    // validateForm();
    // if (!isFormValid) {
    //   rebuildUi();
    //   return;
    // }

    // validatePassword();
    // if (confirmPassValidationMessage != null) {
    //   rebuildUi();
    //   return;
    // }

    // isLoading = true;
    // rebuildUi();
    // Map<String, dynamic> teacherBody = {
    //   "first_name": firstNameValue,
    //   "last_name": lastNameValue,
    //   "email": teacherEmailValue,
    //   "phone_no": phoneNoValue,
    //   "password": teacherPasswordValue,
    //   "role": appTeacherRoleKw,
    // };

    // log('Signing up with $teacherBody');
    // await Future.delayed(const Duration(seconds: 2));

    // isLoading = false;
    // rebuildUi();

    onGoToNext();
  }

  onGoToNext() {
    _trOnboardingService.goToNextPage();
  }
}
