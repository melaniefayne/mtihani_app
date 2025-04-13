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
      return "local.example.com";
    case appInstanceLIVE:
      return "pythonanywhere.com";
    default:
      return "";
  }
}

String appBaseURL = "";
String baseURLScheme = 'https://';
String baseURL = '$baseURLScheme${getAppDomainUrl()}/api';

// CBC ENDPOINTS
// -----------------------
String endPointGetClassCurriculum = '$baseURL/class-curriculum';

// EXAM ENDPOINTS
// -----------------------
String endPointGetUserExams = '$baseURL/user-exams';

// CLASS ENDPOINTS
// -----------------------
String endPointGetClassStrandScores = '$baseURL/class-strand-scores';
String endPointSetExam = '$baseURL/set-exam';
