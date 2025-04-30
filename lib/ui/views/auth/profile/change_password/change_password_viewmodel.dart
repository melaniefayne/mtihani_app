import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/ui/views/auth/profile/change_password/change_password_view.form.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';

class ChangePasswordViewModel extends BaseViewModel with FormStateHelper {
  final _authService = locator<AuthService>();
  bool isPasswordVisible = false;
  bool isLoading = false;
  String? confirmPassValidationMessage;

  togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    rebuildUi();
  }

  validatePassword() {
    confirmPassValidationMessage =
        formConfirmPasswordValidator(newPasswordValue, confirmPasswordValue);
  }

  onApiChangePassword() async {
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
    var apiCallRes = await onApiPostCall(
      postEndpoint: endPointChangePassword,
      dataMap: {
        "current_password": currentPasswordValue,
        "new_password": newPasswordValue,
      },
    );
    isLoading = false;
    rebuildUi();

    if (apiCallChecks(apiCallRes, "change password result",
            showSuccessMessage: true) ==
        true) {
      await _authService.onLogoutUser();
    }
  }
}
