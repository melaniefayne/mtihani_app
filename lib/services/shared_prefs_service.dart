import 'dart:convert';
import 'package:encrypt_shared_preferences/provider.dart';
import 'dart:developer' as dev;

import 'package:mtihani_app/utils/constants/app_variables.dart';

class SharedPrefsService {
  final _prefs = EncryptedSharedPreferences.getInstance();

  ///[sharedPrefsDoSet] pass value as String or Map<String, dynamic>
  Future<bool> sharedPrefsDoSetValue<T>({
    required String prefsKey,
    dynamic value,
    bool isBoolValue = false,
  }) async {
    if (isBoolValue) return _prefs.setBool(prefsKey, value);

    try {
      String data = value is String ? value : json.encode(value);

      return _prefs.setString(prefsKey, data);
    } catch (error) {
      dev.log(
          "Error saving to SharedPreferences ($prefsKey): ${error.toString()}");
    }
    return false;
  }

  ///[sharedPrefsDoGetValue] pass value and fromJson() if decoding an Object Model
  Future<dynamic> sharedPrefsDoGetValue<T>({
    required String prefsKey,
    Function(Map<String, dynamic>)? fromJson,
    bool isBoolValue = false,
  }) async {
    if (isBoolValue) {
      return _prefs.getBool(prefsKey);
    } else {
      String? valueString = _prefs.getString(prefsKey);
      if (valueString == null) return null;
      try {
        return fromJson == null
            ? valueString
            : fromJson(jsonDecode(valueString));
      } catch (error) {
        dev.log(
            "Error getting from SharedPreferences ($prefsKey): ${error.toString()}");
      }
    }
    return null;
  }

  Future<bool> sharedPrefsDoDeleteValue(String prefsKey) async {
    return _prefs.remove(prefsKey);
  }

  Future<bool> cleanCachedSession() async {
    try {
      await sharedPrefsDoDeleteValue(strDefToken);
      await sharedPrefsDoDeleteValue(strDefLoggedInUserData);
      return true;
    } catch (e) {
      dev.log("cleanCachedSession: call  error ==${e.toString()}");
    }
    return false;
  }
}
