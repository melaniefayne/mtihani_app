// APP INSTANCES
// -----------------------
const String appInstanceLIVE = "APP_LIVE";
const String appInstanceLOCAL = "APP_LOCAL";

const String appInstanceDef =
//
// appInstanceLIVE;
    appInstanceLOCAL;

String getAppDomainUrl() {
  switch (appInstanceDef) {
    case appInstanceLOCAL:
      return "http://127.0.0.1:8000";
    case appInstanceLIVE:
      return "https://melaniefayne.pythonanywhere.com";
    default:
      return "";
  }
}

String appBaseURL = "";
String baseURL = '${getAppDomainUrl()}/api';

// AUTH ENDPOINTS
// -----------------------
String endPointLogin = '$baseURL/login';
String endPointStudentRegister = '$baseURL/student-register';
String endPointTeacherRegister = '$baseURL/teacher-register';
String endPointEditProfile = '$baseURL/edit-profile';
String endPointChangePassword = '$baseURL/change-password';

// CBC ENDPOINTS
// -----------------------
String endPointGetClassCurriculum = '$baseURL/class-curriculum';

// EXAM ENDPOINTS
// -----------------------
String endPointGetUserExams = '$baseURL/user-exams';
String endPointSetExam = '$baseURL/set-exam';
String endPointGetEditExam = '$baseURL/edit-exam';

// CLASS ENDPOINTS
// -----------------------
String endPointCreateClass = '$baseURL/create-class';
String endPointGetUseClasses = '$baseURL/user-classes';
String endPointGetClassStrandScores = '$baseURL/class-strand-scores';
String endPointGetClassStudents = '$baseURL/class-students';
