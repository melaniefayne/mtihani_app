import 'dart:developer';

import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/ui/views/auth/login/login_view.form.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel with FormStateHelper {
  final _dialogService = locator<DialogService>();
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

    log('Logging in with $emailValue and $passwordValue');
    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    rebuildUi();
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
