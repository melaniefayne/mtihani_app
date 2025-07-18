// APP INSTANCES
// -----------------------
const String appInstanceLIVE = "APP_LIVE";
const String appInstanceLOCAL = "APP_LOCAL";

const String appInstanceDef =
//
    appInstanceLIVE;
// appInstanceLOCAL;

String getAppDomainUrl() {
  switch (appInstanceDef) {
    case appInstanceLOCAL:
      return "http://127.0.0.1:8000";
    case appInstanceLIVE:
      return "https://mtihani-api.loopy.co.ke";
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
String get endPointGetStudentModels =>
    "$baseURL/learner/get-classroom-students";
String get endPointEditClass => "$baseURL/learner/edit-classroom";
String get endPointEditStudent => "$baseURL/learner/edit-classroom-student";
String get endPointJoinClassroom => "$baseURL/learner/join-classroom";
String get endPointGetStudent => "$baseURL/learner/get-single-student";

// EXAMS =================================================
String get endPointGetUserExams => "$baseURL/exam/get-user-exams";
String get endPointCreateClassroomExam => "$baseURL/exam/create-classroom-exam";
String get endPointRetryExamGeneration => "$baseURL/exam/retry-exam-generation";
String get endPointEditClassroomExam => "$baseURL/exam/edit-classroom-exam";
String get endPointGetExam => "$baseURL/exam/get-single-exam";
String get endPointGetExamQuestions => "$baseURL/exam/get-exam-questions";
String get endPointEditExamQuestions => "$baseURL/exam/edit-exam-questions";
String get endPointStartExamSession => "$baseURL/exam/start-exam-session";
String get endPointGetExamSession => "$baseURL/exam/get-exam-session";
String get endPointUpdateExamAnswer => "$baseURL/exam/update-exam-answer";
String get endPointEndExamSession => "$baseURL/exam/end-exam-session";
String get endPointGetStudentExamSessions =>
    "$baseURL/exam/get-student-exam-sessions";
String get endPointUpdateExamScore => "$baseURL/exam/edit-answer-score";

// PERFORMANCE =================================================
String get endPointGetClassExamPerformance =>
    "$baseURL/exam/get-class-exam-performance";
String get endPointGetClassExamClusters =>
    "$baseURL/exam/get-class-exam-clusters";
String get endPointGetClusterQuiz => "$baseURL/exam/get-cluster-quiz";
String get endPointDownloadClusterQuizPdf =>
    "$baseURL/exam/download-cluster-quiz-pdf";
String get endPointGetPercentilePerformances =>
    "$baseURL/exam/get-percentile-performances";
String get endPointDownloadClusterPdf =>
    "$baseURL/exam/download-cluster-quiz-pdf";
String get endPointGetStudentExamAnswers =>
    "$baseURL/exam/get-student-exam-answers";
String get endPointGetExamQuestionPerformance =>
    "$baseURL/exam/get-question-performance";
String get endPointGetStudentExamCluster =>
    "$baseURL/exam/get-student-exam-cluster";
String get endPointGetStudentExamPerformance =>
    "$baseURL/exam/get-student-exam-performance";
String get endPointGetAvgClassPerformance =>
    "$baseURL/exam/get-class-performance-aggregate";
String get endPointGetAvgStudentPerformance =>
    "$baseURL/exam/get-student-performance-aggregate";

// TEACHER DOCUMENTS =================================================
String get endPointGetUploadDoc => "$baseURL/rag/upload-teacher-document";
String get endPointGetDocs => "$baseURL/rag/get-teacher-documents";
String get endPointGetDeletedDoc => "$baseURL/rag/delete-teacher-document";
