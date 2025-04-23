import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthService {
  final _sharedPrefsService = locator<SharedPrefsService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  bool isLoggingOut = false;

  // LOGOUT
  Future<void>? _logoutInProgress;

  Future<void> onLogoutUser({bool isShowConfirmation = false}) async {
    if (_logoutInProgress != null) {
      log("Logout already in progress.");
      return;
    }

    final logoutCompleter = Completer<void>();
    _logoutInProgress = logoutCompleter.future;

    try {
      if (isShowConfirmation) {
        DialogResponse? isConfirmed = await _dialogService.showCustomDialog(
          variant: DialogType.appAction,
          title: "Log Out",
          description: "Are you sure you want to log out?",
          barrierDismissible: true,
        );

        if (isConfirmed?.confirmed == null) {
          return;
        }
      }

      await _sharedPrefsService.cleanCachedSession();
      await _navigationService.clearStackAndShow(Routes.startupView);
    } finally {
      logoutCompleter.complete();
      _logoutInProgress = null;
    }
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

  Future<bool> saveUserClassrooms(List<ClassroomModel>? userClassrooms) async {
    if (userClassrooms == null) return false;
    return await _sharedPrefsService.sharedPrefsDoSetValue<String>(
      prefsKey: strLoggedInUserClassrooms,
      value: jsonEncode(userClassrooms),
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

  Future<bool> get isLoggedInTeacher async {
    UserModel? loggedInUser = await getUserProfile();
    if (loggedInUser != null) {
      return loggedInUser.role == appTeacherRoleKw;
    }
    return false;
  }

  Future<bool> get isLoggedInStudent async {
    UserModel? loggedInUser = await getUserProfile();
    if (loggedInUser != null) {
      return loggedInUser.role == appStudentRoleKw;
    }
    return false;
  }

  Future<List<ClassroomModel>?> getUserClassrooms() async {
    String? classListStr =
        await _sharedPrefsService.sharedPrefsDoGetValue<String>(
      prefsKey: strLoggedInUserClassrooms,
    );
    if (classListStr != null) {
      try {
        final List<dynamic> decodedList = jsonDecode(classListStr);
        return decodedList
            .map(
                (item) => ClassroomModel.fromJson(item as Map<String, dynamic>))
            .toList();
      } catch (e) {
        log("Error parsing user classrooms: $e");
      }
    }
    return null;
  }

  Future<List<ClassroomModel>> get loggedInUserClassrooms async {
    List<ClassroomModel>? savedClassrooms = await getUserClassrooms();

    if (savedClassrooms != null && savedClassrooms.isNotEmpty) {
      return savedClassrooms;
    }

    // var classroomListRes = await onApiGetCall<ClassroomModel>(
    //   getEndpoint: endPointGetUserClassrooms,
    // );
    // if (apiCallChecks(classroomListRes, 'classroom listing')) {
    //   List<ClassroomModel> classrooms = classroomListRes.$1?.listData ?? [];
    //   await saveUserClassrooms(classrooms);
    //   return classrooms;
    // }

    // return [];

    // DUMMY ============================================
    // ==================================================
    List<ClassroomModel> classrooms = [dummyTrClass1, dummyTrClass2];
    await saveUserClassrooms(classrooms);
    return classrooms;
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
