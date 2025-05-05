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

// AUTH =================================================
String get endPointLoginUser => "$baseURL/accounts/login-user";
String get endPointRegisterUser => "$baseURL/accounts/register-user";
String get endPointChangePassword => "$baseURL/accounts/change-password";
String get endPointUpdateUser => "$baseURL/accounts/update-user";

// CLASSROOMS ============================================
String get endPointCreateClass => "$baseURL/learner/create-class";
String get endPointGetUserClassrooms => "$baseURL/learner/get-user-classrooms";
String get endPointGetClassroomTermScores =>
    "$baseURL/learner/get-classroom-term-scores";
String get endPointGetClassroomStudentModels =>
    "$baseURL/learner/get-classroom-students";
String get endPointEditClass => "$baseURL/learner/edit-classroom";
String get endPointEditStudent => "$baseURL/learner/edit-classroom-student";

// EXAMS =================================================
String get endPointCreateExam => "$baseURL/create-classroom-exam";

// TODO ==================================================
String get endPointGetClassStrandScores =>
    "$baseURL/get-class-strand-scores"; // return List<StrandScoreModel> given class_id
String get endPointGetExamListing =>
    "$baseURL/get-exam-listing"; // return list of exams based on token and parameters passed