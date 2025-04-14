import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/models/student.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StudentListSectionModel extends FutureViewModel {
  final ClassModel classItem;
  final _navigationService = locator<NavigationService>();
  List<StudentModel> classStudents = [];
  bool isLoadMore = false;
  String? nextPageUrl;

  StudentListSectionModel(this.classItem);

  @override
  Future<List<StudentModel>> futureToRun() async {
    Map<String, dynamic> queryParams = {"class_id": classItem.id};

    if (selectedExpectationLevel != null) {
      queryParams["expectation_level"] = selectedExpectationLevel;
    }

    var studentsApiRes = await onApiGetCall<StudentModel>(
      getEndpoint: isLoadMore
          ? nextPageUrl ?? endPointGetClassStudents
          : endPointGetClassStudents,
      queryParams: queryParams,
    );

    if (apiCallChecks(studentsApiRes, 'student listing')) {
      List<StudentModel> resStudents = studentsApiRes.$1?.listData ?? [];
      classStudents = [...classStudents, ...resStudents];
      nextPageUrl = studentsApiRes.$1?.next;
      return classStudents;
    }
    return [dummyStudentOne, dummyStudentOne];
  }

  onViewStudent(StudentModel studentItem) async {
    await _navigationService.navigateToSingleStudentView(
        studentItem: studentItem);
    initialise();
  }

  onViewMoreStudents() async {
    if (nextPageUrl != null) {
      isLoadMore = true;
      await initialise();
      isLoadMore = false;
    }
  }

  // ===== FILTERS
  String? selectedExpectationLevel;
  onChangeExpectationLevel(String expectationLevel) {
    selectedExpectationLevel = expectationLevel;
    initialise();
  }
}
