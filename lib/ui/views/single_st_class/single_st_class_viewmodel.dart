import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SingleStClassViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _sharedPrefsService = locator<SharedPrefsService>();
  StudentModel? stClassroom;
  bool isStudent = false;
  bool isTeacher = false;
  bool isLoading = false;

  onSingleStClassViewReady() async {
    stClassroom = await _sharedPrefsService.getSingleStClassroomNavArg();
    if (stClassroom == null) {
      _navigationService.clearStackAndShow(Routes.startupView);
      return;
    }

    isStudent = await _authService.isLoggedInStudent;
    isTeacher = await _authService.isLoggedInTeacher;

    rebuildUi();
  }

  onApiUpdateStudent(Map<String, dynamic> updateBody) async {
    isLoading = true;
    rebuildUi();
    var studentApiRes = await onApiPostCall(
      postEndpoint: endPointEditStudent,
      queryParams: {"student_id": stClassroom!.id!},
      dataMap: updateBody,
    );
    isLoading = false;
    rebuildUi();

    if (apiCallChecks(studentApiRes, "student update result",
            showSuccessMessage: true) ==
        true) {
      StudentModel? resStudent = studentApiRes.$1?.data;
      if (resStudent != null) {
        await updateCurrentStudent(resStudent);
      } else {
        await fetchCurrentStudent();
      }
    }
  }

  fetchCurrentStudent() async {
    var studentApiRes = await onApiGetCall<StudentModel>(
      getEndpoint: endPointGetStudent,
      queryParams: {"student_id": stClassroom!.id},
      dataFromJson: StudentModel.fromJson,
      dataField: "student",
    );

    if (apiCallChecks(studentApiRes, 'current student')) {
      await updateCurrentStudent(studentApiRes.$1?.data);
    }
  }

  updateCurrentStudent(StudentModel? resStudent) async {
    if (resStudent == null) return;
    stClassroom = resStudent;
    await _sharedPrefsService.setSingleStClassroomNavArg(resStudent);
    rebuildUi();
  }

  onDispose() async {
    await _sharedPrefsService.clearSingleStClassroomNavArg();
  }
}
