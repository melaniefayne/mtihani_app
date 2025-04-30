// SHARED PREFS
// -----------------------
import 'package:intl/intl.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/user.dart';

const int appSnackbarDuration = 4;

const String strDefSharedPrefKey = "05cca623-58ad-47";
const String strDefToken = "access_token";
const String strDefLoggedInUserData = "loggedInUserData";
const String strLoggedInUserClassrooms = "strLoggedInUserClassrooms";

// ROLES
//
const String appTeacherRoleKw = "teacher";
const String appStudentRoleKw = "student";
const String appDefaultSubject = "Integrated Science";

// ASSETS
// -----------------------
const String astImagesLightLogo = "assets/images/mtihani_light.png";
const String astImagesDarkLogo = "assets/images/mtihani_dark.png";
const String astImagesTeacher = "assets/images/teacher.png";
const String astImagesStudent = "assets/images/student.png";
const String astImagesWaiting = "assets/images/waiting.png";
const String astLottieAppLoader = "assets/lottie/app_loader.json";
const String astLottieLoading = "assets/lottie/loading.json";
const String astLottieNoItems = "assets/lottie/no_items.json";

// API CALL HEADERS
// -----------------------
String apiHeaderContentType = "Content-type";
String apiHeaderAuthorization = "Authorization";
String tokenTypeBearerWithSpace = "Bearer ";
String apiContentTypeFormData = "multipart/form-data";

// API MESSAGES
// -----------------------
const String errorMsgNoInternet =
    "No internet. Check your connectio and try again";

// DATETIME
// -----------------------
final DateTime today = DateTime.now();
final DateTime tomorrow = today.add(const Duration(days: 1));
final DateFormat appTimeFormat = DateFormat("hh:mm a");
final DateFormat appDayDateFormat = DateFormat('EEE, dd/MM/yyyy');
final DateFormat appShortDayDateFormat = DateFormat('EEE, dd/MM');
const List<int> allGradesList = [7, 8, 9];

// DUMMY DATA
// -----------------------
const String dummyToken =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0Mzc2MTg0NiwiaWF0IjoxNzQzNTg5MDQ2LCJqdGkiOiI3OGE3NmNhYjdmODc0MDYyYmNlZGE1MjNmZjE0ODQ3MyIsInVzZXJfaWQiOjF9.d5jwA8XifngMbY98pAadRLKw2GINgn_XCqfGCqgL0rU";

final UserModel dummyTrUser = UserModel(
  user_id: -1,
  email: "teacher@gmail.com",
  name: "John Wekesa",
  role: "teacher",
  teacher_id: -1,
  phone_no: "0712345678",
);

final UserModel dummyStUser = UserModel(
  user_id: -2,
  email: "student@gmail.com",
  name: "Aisha Juma",
  role: "student",
  student_id: -1,
);

final ClassroomModel dummyTrClass1 = ClassroomModel(
  id: 1,
  name: "7 North",
  school_name: "Sunshine Junior School",
  school_address: "123 Education Lane, Nairobi",
  subject: appDefaultSubject,
  grade: 7,
  teacher_id: -1,
  lesson_times: [
    DateTime.now().add(const Duration(hours: 1)),
    DateTime.now().add(const Duration(days: 2)),
  ],
  student_count: 30,
  avg_term_score: 72.5,
  avg_term_expectation_level: "Meeting",
  avg_mtihani_score: 68.0,
  avg_mtihani_expectation_level: "Meeting",
  term_scores: [
    TermScore(
      id: 1,
      grade: 7,
      term: 1,
      score: 70.0,
      expectation_level: "Meeting",
    ),
    TermScore(
      id: 2,
      grade: 7,
      term: 2,
      score: 75.0,
      expectation_level: "Meeting",
    ),
  ],
);

final ClassroomModel dummyTrClass2 = ClassroomModel(
  id: 2,
  name: "8 East",
  school_name: "Sunshine Junior School",
  school_address: "123 Education Lane, Nairobi",
  subject: appDefaultSubject,
  grade: 8,
  teacher_id: -1,
  lesson_times: [
    DateTime.now().add(const Duration(days: 1)),
    DateTime.now().add(const Duration(days: 3)),
  ],
  student_count: 25,
  avg_term_score: 81.2,
  avg_term_expectation_level: "Exceeding",
  avg_mtihani_score: 84.7,
  avg_mtihani_expectation_level: "Exceeding",
  student_code: "BIO-9-2025",
  term_scores: [
    TermScore(
      id: 3,
      grade: 7,
      term: 1,
      score: 76.0,
      expectation_level: "Meeting",
    ),
    TermScore(
      id: 4,
      grade: 7,
      term: 2,
      score: 82.5,
      expectation_level: "Exceeding",
    ),
    TermScore(
      id: 5,
      grade: 7,
      term: 3,
      score: 80.0,
      expectation_level: "Exceeding",
    ),
    TermScore(
      id: 6,
      grade: 8,
      term: 1,
      score: 78.5,
      expectation_level: "Meeting",
    ),
    TermScore(
      id: 7,
      grade: 8,
      term: 2,
      score: 82.5,
      expectation_level: "Exceeding",
    ),
  ],
);

final ClassroomModel dummyStClass1 = ClassroomModel(
  id: 1,
  name: "7 North",
  school_name: "Sunshine Junior School",
  school_address: "123 Education Lane, Nairobi",
  subject: appDefaultSubject,
  grade: 7,
  teacher_id: -1,
  student_code: "GH6RT4",
  lesson_times: [
    DateTime.now().add(const Duration(hours: 1)),
    DateTime.now().add(const Duration(days: 2)),
  ],
  avg_term_score: 65,
  avg_term_expectation_level: "Meeting",
  avg_mtihani_score: 68.0,
  avg_mtihani_expectation_level: "Meeting",
  term_scores: [
    TermScore(
      id: 1,
      grade: 7,
      term: 1,
      score: 63.0,
      expectation_level: "Meeting",
    ),
    TermScore(
      id: 2,
      grade: 7,
      term: 2,
      score: 68.0,
      expectation_level: "Meeting",
    ),
  ],
);

final List<StrandScoreModel> dummyTrClass1StrandScores = [
  StrandScoreModel(
    strand: ScoreModel(
      id: 1,
      name: "Scientific Investigation",
      score: 84.2,
      expectation_level: "Exceeding",
    ),
  )
];

final List<ExamModel> dummyTrExams = [
  ExamModel(
    id: -1,
    teacher_id: -1,
    classroom: dummyTrClass1,
    grade: dummyTrClass1.grade,
    code: "OO8FG5",
    status: ExamStatus.generating,
    start_time: DateTime.now().add(const Duration(days: 2)),
    end_time: DateTime.now().add(const Duration(days: 2)),
    duration_min: 75,
    isPublished: false,
  ),
  ExamModel(
    id: -2,
    teacher_id: -1,
    classroom: dummyTrClass1,
    grade: dummyTrClass1.grade,
    code: "HJ8FH6",
    status: ExamStatus.upcoming,
    start_time: DateTime.now().add(const Duration(days: 2)),
    end_time: DateTime.now().add(const Duration(days: 2)),
    duration_min: 75,
    isPublished: true,
  ),
  ExamModel(
    id: -3,
    teacher_id: -1,
    classroom: dummyTrClass2,
    grade: dummyTrClass2.grade,
    code: "AS5GK3",
    status: ExamStatus.ongoing,
    start_time: DateTime.now(),
    end_time: DateTime.now(),
    duration_min: 75,
    isPublished: true,
  ),
  ExamModel(
    id: -3,
    teacher_id: -1,
    classroom: dummyTrClass1,
    grade: dummyTrClass1.grade,
    code: "BN45FH",
    status: ExamStatus.grading,
    start_time: DateTime.now(),
    end_time: DateTime.now(),
    duration_min: 75,
    isPublished: true,
  ),
  ExamModel(
    id: -3,
    teacher_id: -1,
    classroom: dummyTrClass1,
    grade: dummyTrClass1.grade,
    code: "KL2JK4",
    status: ExamStatus.complete,
    start_time: DateTime.now(),
    end_time: DateTime.now(),
    duration_min: 75,
    isPublished: true,
  ),
];
