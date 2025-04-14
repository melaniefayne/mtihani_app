import 'dart:convert';
import 'dart:developer';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthService {
  final _sharedPrefsService = locator<SharedPrefsService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  bool isLoggingOut = false;

  // LOGOUT
  Future<void> onLogoutUser({bool isShowConfirmation = false}) async {
    if (isLoggingOut) return;

    isLoggingOut = true;

    if (isShowConfirmation) {
      DialogResponse? isConfirmed = await _dialogService.showCustomDialog(
        variant: DialogType.appAction,
        title: "Log Out",
        description: "Are you sure you want to log out?",
        barrierDismissible: true,
      );

      if (isConfirmed?.confirmed == null) {
        isLoggingOut = false;
        return;
      }
    }
    await _sharedPrefsService.cleanCachedSession();
    isLoggingOut = false;
    _navigationService.clearStackAndShow(Routes.startupView);
  }

  // USER PROFILE
  // -----------------------

  Future<bool> saveUserProfile(UserModel? user) async {
    if (user == null) return false;
    return await _sharedPrefsService.sharedPrefsDoSetValue<String>(
      prefsKey: strDefLoggedInUserData,
      value: jsonEncode(user.toJson()),
    );
  }

  Future<bool> saveUserToken(String? tokenStr) async {
    if (tokenStr == null) return false;
    return await _sharedPrefsService.sharedPrefsDoSetValue<String>(
      prefsKey: strDefToken,
      value: tokenStr,
    );
  }

  Future<UserModel?> getUserProfile() async {
    String? userProfileStr =
        await _sharedPrefsService.sharedPrefsDoGetValue<String>(
      prefsKey: strDefLoggedInUserData,
    );
    if (userProfileStr != null) {
      try {
        return UserModel.fromJson(jsonDecode(userProfileStr));
      } catch (e) {
        log("Error parsing user profile: $e");
      }
    }
    return null;
  }

  // TOKEN
  // -----------------------
  Future<(bool, UserModel?)> checkIsAuthenticated() async {
    var checkTokenRes = await checkValidToken();
    bool isTokenValid = checkTokenRes.$2;

    if (!isTokenValid) {
      await _sharedPrefsService.cleanCachedSession();
      return (false, null);
    }

    UserModel? userProfile = await getUserProfile();
    return (true, userProfile);
  }

  Future<(String?, bool)> checkValidToken() async {
    String? tokenStr = await _sharedPrefsService.sharedPrefsDoGetValue<String>(
      prefsKey: strDefToken,
    );
    if (tokenStr != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(tokenStr);
      var nowEpoch = DateTime.now().millisecondsSinceEpoch;
      if ((decodedToken['exp'] * 1000) > nowEpoch) {
        return (tokenStr, true);
      }
    }
    return (tokenStr, false);
  }
}
