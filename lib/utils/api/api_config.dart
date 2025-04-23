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
String get baseURL => '${getAppDomainUrl()}/api';

String get endPointGetUserClassrooms => "";
String get endPointGetStudentClassrooms => "";
String get endPointJoinClass => "";
String get endPointGetExamListing => "";

// =======================================================
// =======================================================

// AUTH ENDPOINTS
// -----------------------
String endPointLogin = '$baseURL/login';
String endPointStudentRegister = '$baseURL/student-register';
String endPointTeacherRegister = '$baseURL/teacher-register';
String endPointEditProfile = '$baseURL/edit-profile';
String endPointChangePassword = '$baseURL/change-password';
