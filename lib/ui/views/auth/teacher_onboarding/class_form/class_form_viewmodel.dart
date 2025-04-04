import 'dart:convert';
import 'dart:developer';

import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/class_form/class_form_view.form.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/utils.dart';
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
    // validateForm();
    // if (!isFormValid) {
    //   rebuildUi();
    //   return;
    // }

    // if (selectedGrade == null) {
    //   gradeErrorMsg = 'Select a grade to continue';
    //   rebuildUi();
    //   return;
    // }
    // gradeErrorMsg = null;

    // if (selectedLessonTimes.isEmpty) {
    //   lessonTimesErrorMsg = 'Add lesson times to continue';
    //   rebuildUi();
    //   return;
    // }
    // lessonTimesErrorMsg = null;

    // if (uploadedStudents.isEmpty) {
    //   uploadStudentsErrorMsg = 'Add students to continue';
    //   rebuildUi();
    //   return;
    // }
    // uploadStudentsErrorMsg = null;

    // isLoading = true;
    // rebuildUi();

    // Map<String, dynamic> classBody = {
    //   "name": classNameValue,
    //   "school_name": schoolNameValue,
    //   "school_address": schoolAddressValue,
    //   "grade": selectedGrade,
    //   "lesson_times": getApiLessonTimes(selectedLessonTimes),
    //   "students": uploadedStudents.map((e) => e.toJson()).toList(),
    // };

    // log('Creating class with ${jsonEncode(classBody)}');
    // await Future.delayed(const Duration(seconds: 2));

    // isLoading = false;
    // rebuildUi();

    _trOnboardingService.onSetCurrentClass(
      ClassModel(
        id: 1,
        name: "8J",
        school_name: "Muthaiga Primary School",
        school_address: "Muthaiga, Thika Road",
        grade: 8,
        code: "FG67HG",
        teacher_id: 1,
      ),
    );
    // If class is null, skip to Home, else go on to set exam
    onGoToNext();
  }

  onGoToNext() {
    _trOnboardingService.goToNextPage();
  }

  onGoToHome() {
    _trOnboardingService.onFinishOnboarding();
  }
}
