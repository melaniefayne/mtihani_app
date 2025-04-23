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
// ======================================================
String get endPointLogin => "$baseURL/login-user"; // return token and user
String get endPointStudentRegister =>
    "$baseURL/register-student"; // return token and user
String get endPointTeacherRegister =>
    "$baseURL/register-teacher"; // return token and user
String get endPointEditProfile =>
    "$baseURL/edit-profile"; // return updated user
String get endPointChangePassword =>
    "$baseURL/change-password"; // return success message

// CLASSROOMS ============================================
// =======================================================
String get endPointCreateClass =>
    "$baseURL/create-class"; // return new list of user's classrooms sorted by updated_at in DESC
String get endPointGetUserClassrooms =>
    "$baseURL/get-user-classrooms"; // return logged in user's classrooms with user specific data
String get endPointJoinClass => "$baseURL/join-classroom";
String get endPointGetClassStrandScores =>
    "$baseURL/get-class-strand-scores"; // return List<StrandScoreModel> given class_id

// EXAMS =================================================
// =======================================================
String get endPointCreateExam => "$baseURL/create-classroom-exam";
String get endPointGetExamListing =>
    "$baseURL/get-exam-listing"; // return list of exams based on token and parameters passed

// =======================================================
// =======================================================
