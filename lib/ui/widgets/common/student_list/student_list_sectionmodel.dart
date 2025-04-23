import 'package:mtihani_app/models/classroom.dart';
import 'package:stacked/stacked.dart';

class StudentListSectionModel extends FutureViewModel {
  final ClassroomModel classroom;
  // final _navigationService = locator<NavigationService>();
  // List<StudentClassModel> classStudents = [];
  // bool isLoadMore = false;
  // String? nextPageUrl;

  StudentListSectionModel(this.classroom);

  @override
  Future<List<ClassroomStudent>> futureToRun() async {
    // Map<String, dynamic> queryParams = {"class_id": classroom.id};

    // if (selectedExpectationLevel != null) {
    //   queryParams["expectation_level"] = selectedExpectationLevel;
    // }

    // var studentsApiRes = await onApiGetCall<StudentClassModel>(
    //   getEndpoint: isLoadMore
    //       ? nextPageUrl ?? endPointGetClassStudents
    //       : endPointGetClassStudents,
    //   queryParams: queryParams,
    // );

    // if (apiCallChecks(studentsApiRes, 'student listing')) {
    //   List<StudentClassModel> resStudents = studentsApiRes.$1?.listData ?? [];
    //   classStudents = [...classStudents, ...resStudents];
    //   nextPageUrl = studentsApiRes.$1?.next;
    //   return classStudents;
    // }
    // return [dummyStudentOne, dummyStudentOne];
    return [];
  }

  // onViewStudent(StudentClassModel studentItem) async {
  //   await _navigationService.navigateToSingleStudentView(
  //       studentItem: studentItem);
  //   initialise();
  // }

  // onViewMoreStudents() async {
  //   if (nextPageUrl != null) {
  //     isLoadMore = true;
  //     await initialise();
  //     isLoadMore = false;
  //   }
  // }

  // ===== FILTERS
  String? selectedExpectationLevel;
  onChangeExpectationLevel(String expectationLevel) {
    selectedExpectationLevel = expectationLevel;
    initialise();
  }
}
