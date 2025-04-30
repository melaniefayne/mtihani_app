import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/class_form/class_form_view.form.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/utils.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ClassFormViewModel extends BaseViewModel with FormStateHelper {
  final _trOnboardingService = locator<TeacherOnboardingService>();
  final _navigationService = locator<NavigationService>();
  bool get isFromOnboarding => _trOnboardingService.isFromOnboarding;
  int? selectedGrade;
  String? gradeErrorMsg;
  List<DateTime> selectedLessonTimes = [];
  String? lessonTimesErrorMsg;
  List<StudentScores> uploadedStudents = [];
  String? uploadStudentsErrorMsg;
  bool isLoading = false;
  ClassroomModel? get classToEdit => _trOnboardingService.currentClass;
  bool isClassEdit = false;
  String pageTitle = "Create A Class";

  onClassFormViewReady() {
    if (classToEdit != null) {
      isClassEdit = true;
      pageTitle = "Edit Class";
      classNameValue = classToEdit!.name ?? "";
      schoolNameValue = classToEdit!.school_name ?? "";
      schoolAddressValue = classToEdit!.school_address ?? "";
      selectedGrade = classToEdit!.grade;
      selectedLessonTimes = classToEdit!.lesson_times ?? [];
    } else {
      pageTitle = "Create A Class";
    }
  }

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

    if (classToEdit == null && uploadedStudents.isEmpty) {
      uploadStudentsErrorMsg = 'Add students to continue';
      rebuildUi();
      return;
    }
    uploadStudentsErrorMsg = null;

    Map<String, dynamic> classBody = {
      "name": classNameValue,
      "school_name": schoolNameValue,
      "school_address": schoolAddressValue,
      "grade": selectedGrade,
      "subject": appDefaultSubject,
      "lesson_times": getApiLessonTimes(selectedLessonTimes),
    };

    if (uploadedStudents.isNotEmpty) {
      classBody["uploaded_students"] =
          uploadedStudents.map((e) => e.toJson()).toList();
    }

    isLoading = true;
    rebuildUi();
    var apiCallRes = await onApiPostCall<ClassroomModel>(
      postEndpoint: classToEdit != null
          ? "$endPointCreateClass/${classToEdit!.id}" // TODO
          : endPointCreateClass,
      dataMap: classBody,
      dataFromJson: ClassroomModel.fromJson,
      dataField: "new_classroom",
    );
    isLoading = false;
    rebuildUi();
    if (apiCallChecks(apiCallRes, "create class result",
            showSuccessMessage: true) ==
        true) {
      ClassroomModel? newClassroom = apiCallRes.$1?.data;
      if (newClassroom != null) {
        if (isFromOnboarding) {
          _trOnboardingService.onSetCurrentClass(newClassroom);
          onGoToNext();
        } else {
          _trOnboardingService.onSetCurrentClass(newClassroom);
          _trOnboardingService.onSetIsFromOnboarding(false);
          _navigationService.back();
        }
      }
    }
  }

  onGoToNext() {
    _trOnboardingService.goToNextPage();
  }

  onGoToHome() {
    _trOnboardingService.onFinishOnboarding();
  }
}
