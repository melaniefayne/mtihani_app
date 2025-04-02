import 'dart:convert';
import 'dart:developer';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';

class AuthService {
  final _sharedPrefsService = locator<SharedPrefsService>();
  bool isLoggingOut = false;

  // USER PROFILE
  // -----------------------
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

  // TOKEN CHECKING
  // -----------------------

  /// Check if the user is authenticated by verifying the token and fetching the user profile.
  /// If the token is invalid, it cleans the cached session and returns false.
  /// If the token is valid, it fetches the user profile and returns true along with the profile.
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
