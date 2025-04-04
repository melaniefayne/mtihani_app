import 'dart:convert';
import 'dart:developer';

import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/ui/views/teacher_onboarding/pages/class_form/class_form_view.form.dart';
import 'package:mtihani_app/ui/views/teacher_onboarding/utils.dart';
import 'package:stacked/stacked.dart';

class ClassFormViewModel extends BaseViewModel with FormStateHelper {
  final _trOnboardingService = locator<TeacherOnboardingService>();
  int? selectedGrade;
  String? gradeErrorMsg;
  List<DateTime> selectedLessonTimes = [];
  String? lessonTimesErrorMsg;
  List<StudentScores> uploadedStudents = [];
  String? uploadStudentsErrorMsg;
  bool isLoading = false;

  onGradeChanged(int value) {
    selectedGrade = value;
    rebuildUi();
  }

  onSelectedLessonTime(DateTime value) {
    selectedLessonTimes.add(value);
    rebuildUi();
  }

  onRemovedLessonTime(DateTime value) {
    selectedLessonTimes.remove(value);
    rebuildUi();
  }

  onClassCsvUploaded(List<StudentScores> students) {
    uploadedStudents = [...students];
  }

  onApiClassCreate() async {
    validateForm();
    if (!isFormValid) {
      rebuildUi();
      return;
    }

    if (selectedGrade == null) {
      gradeErrorMsg = 'Select a grade to continue';
      rebuildUi();
      return;
    }
    gradeErrorMsg = null;

    if (selectedLessonTimes.isEmpty) {
      lessonTimesErrorMsg = 'Add lesson times to continue';
      rebuildUi();
      return;
    }
    lessonTimesErrorMsg = null;

    if (uploadedStudents.isEmpty) {
      uploadStudentsErrorMsg = 'Add students to continue';
      rebuildUi();
      return;
    }
    uploadStudentsErrorMsg = null;

    isLoading = true;
    rebuildUi();

    Map<String, dynamic> classBody = {
      "name": classNameValue,
      "school_name": schoolNameValue,
      "school_address": schoolAddressValue,
      "grade": selectedGrade,
      "lesson_times": getApiLessonTimes(selectedLessonTimes),
      "students": uploadedStudents.map((e) => e.toJson()).toList(),
    };

    log('Creating class with ${jsonEncode(classBody)}');
    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    rebuildUi();

    onGoToNext();
  }

  onGoToNext() {
    _trOnboardingService.goToNextPage();
  }

  onGoToHome() {
    _trOnboardingService.onFinishOnboarding();
  }
}
