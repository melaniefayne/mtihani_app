import 'dart:convert';
import 'dart:developer';
import 'package:encrypt_shared_preferences/provider.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/exam.dart';
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

  // ========== Teacher Classroom

  Future<bool> setSingleTrClassroomNavArg(ClassroomModel classroom) async {
    return await sharedPrefsDoSetValue<String>(
      prefsKey: strCurrentTrClass,
      value: jsonEncode(classroom.toJson()),
    );
  }

  Future<ClassroomModel?> getSingleTrClassroomNavArg() async {
    String? classroomStr =
        await sharedPrefsDoGetValue<String>(prefsKey: strCurrentTrClass);
    if (classroomStr != null) {
      try {
        return ClassroomModel.fromJson(jsonDecode(classroomStr));
      } catch (e) {
        log("Error parsing classroom: $e");
      }
    }
    return null;
  }

  Future<bool> clearSingleTrClassroomNavArg() async {
    return await sharedPrefsDoDeleteValue(strCurrentTrClass);
  }

  // ========== Student Classroom

  Future<bool> setSingleStClassroomNavArg(StudentModel classroom) async {
    return await sharedPrefsDoSetValue<String>(
      prefsKey: strCurrentStClass,
      value: jsonEncode(classroom.toJson()),
    );
  }

  Future<StudentModel?> getSingleStClassroomNavArg() async {
    String? classroomStr =
        await sharedPrefsDoGetValue<String>(prefsKey: strCurrentStClass);
    if (classroomStr != null) {
      try {
        return StudentModel.fromJson(jsonDecode(classroomStr));
      } catch (e) {
        log("Error parsing classroom: $e");
      }
    }
    return null;
  }

  Future<bool> clearSingleStClassroomNavArg() async {
    return await sharedPrefsDoDeleteValue(strCurrentStClass);
  }

  // ========== Teacher Exam

  Future<bool> setSingleTrExamNavArg(ExamModel trExam) async {
    return await sharedPrefsDoSetValue<String>(
      prefsKey: strCurrentTrExam,
      value: jsonEncode(trExam.toJson()),
    );
  }

  Future<ExamModel?> getSingleTrExamNavArg() async {
    String? trExamStr =
        await sharedPrefsDoGetValue<String>(prefsKey: strCurrentTrExam);
    if (trExamStr != null) {
      try {
        return ExamModel.fromJson(jsonDecode(trExamStr));
      } catch (e) {
        log("Error parsing trExam: $e");
      }
    }
    return null;
  }

  Future<bool> clearSingleTrExamNavArg() async {
    return await sharedPrefsDoDeleteValue(strCurrentTrExam);
  }

  // ========== Student Exam

  Future<bool> setSingleStExamNavArg(ExamModel stExam) async {
    return await sharedPrefsDoSetValue<String>(
      prefsKey: strCurrentStExam,
      value: jsonEncode(stExam.toJson()),
    );
  }

  Future<ExamModel?> getSingleStExamNavArg() async {
    String? stExamStr =
        await sharedPrefsDoGetValue<String>(prefsKey: strCurrentStExam);
    if (stExamStr != null) {
      try {
        return ExamModel.fromJson(jsonDecode(stExamStr));
      } catch (e) {
        log("Error parsing stExam: $e");
      }
    }
    return null;
  }

  Future<bool> clearSingleStExamNavArg() async {
    return await sharedPrefsDoDeleteValue(strCurrentStExam);
  }

  // ========== Exam Question

  Future<bool> setSingleExamQuestionNavArg(ExamQuestionModel examQue) async {
    return await sharedPrefsDoSetValue<String>(
      prefsKey: strCurrentExamQuestion,
      value: jsonEncode(examQue.toJson()),
    );
  }

  Future<ExamQuestionModel?> getSingleExamQuestionNavArg() async {
    String? examQueStr =
        await sharedPrefsDoGetValue<String>(prefsKey: strCurrentExamQuestion);
    if (examQueStr != null) {
      try {
        return ExamQuestionModel.fromJson(jsonDecode(examQueStr));
      } catch (e) {
        log("Error parsing examQue: $e");
      }
    }
    return null;
  }

  Future<bool> clearSingleExamQuestionNavArg() async {
    return await sharedPrefsDoDeleteValue(strCurrentExamQuestion);
  }
}
