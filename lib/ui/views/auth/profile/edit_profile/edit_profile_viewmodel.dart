import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/ui/views/auth/profile/edit_profile/edit_profile_view.form.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';

class EditProfileViewModel extends BaseViewModel with FormStateHelper {
  final _authService = locator<AuthService>();
  bool isLoading = false;
  bool isTeacherProfile = false;

  onProfileViewReady() async {
    UserModel? user = await _authService.getUserProfile();
    if (user != null) {
      final nameParts = user.name?.split(" ") ?? [];
      firstNameValue = nameParts.isNotEmpty ? nameParts[0] : '';
      lastNameValue =
          nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

      emailValue = user.email ?? '';
      phoneNoValue = user.phone_no ?? '';
      isTeacherProfile = user.role == appTeacherRoleKw;
      rebuildUi();
    }
  }

  bool checkFormValid() {
    bool isValid = getValidationMessage(FirstNameValueKey) == null &&
        getValidationMessage(LastNameValueKey) == null &&
        getValidationMessage(EmailValueKey) == null;
    if (isTeacherProfile) {
      return isValid && getValidationMessage(PhoneNoValueKey) == null;
    } else {
      return isValid;
    }
  }

  onApiEditProfile() async {
    validateForm();
    rebuildUi();

    if (!checkFormValid()) return;

    final editBody = {
      "first_name": firstNameValue,
      "last_name": lastNameValue,
      "email": emailValue,
    };

    if (isTeacherProfile) {
      editBody["phone_no"] = phoneNoValue;
    }

    isLoading = true;
    rebuildUi();
    var apiCallRes = await onApiPostCall<UserModel>(
      postEndpoint: endPointUpdateUser,
      dataMap: editBody,
      dataField: "new_user",
      dataFromJson: UserModel.fromJson,
    );
    isLoading = false;
    rebuildUi();

    if (apiCallChecks(apiCallRes, "edit profile result",
            showSuccessMessage: true) ==
        true) {
      UserModel? newUser = apiCallRes.$1?.data;
      await _authService.saveUserProfile(newUser);
    }
  }
}
