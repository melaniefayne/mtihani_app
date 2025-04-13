// SHARED PREFS
// -----------------------
import 'package:intl/intl.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/user.dart';

const String strDefSharedPrefKey = "05cca623-58ad-47";
const String strDefToken = "access_token";
const String strDefLoggedInUserData = "loggedInUserData";

// ROLES
//
const String appTeacherRoleKw = "teacher";
const String appStudentRoleKw = "student";

// ASSETS
// -----------------------
const String astImagesLightLogo = "assets/images/mtihani_light.png";
const String astImagesDarkLogo = "assets/images/mtihani_dark.png";
const String astImagesTeacher = "assets/images/teacher.png";
const String astImagesStudent = "assets/images/student.png";
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

// VIEW_MODELS
// -----------------------
ClassModel dummyClass = ClassModel(
  id: -1,
  name: "8J",
  school_name: "Muthaiga Primary School",
  school_address: "Muthaiga, Thika Road",
  grade: 8,
  code: "FG67HG",
  teacher_id: 1,
  student_count: 25,
  avg_term_score: 68.2,
  lessons_today: [
    DateTime(today.year, today.month, today.day, 15, 30),
  ],
);

ClassModel dummyClassTwo = ClassModel(
  id: -1,
  name: "9S",
  school_name: "Muthaiga Primary School",
  school_address: "Muthaiga, Thika Road",
  grade: 8,
  code: "UH8F6G",
  teacher_id: 1,
  student_count: 32,
  avg_term_score: 72,
  lessons_today: [
    DateTime(today.year, today.month, today.day, 08, 00),
  ],
);

ExamModel dummyExam = ExamModel(
  id: -1,
  grade: 8,
  code: "FG6H7E",
  class_name: "8J",
  status: "Processing",
  duration_min: 75,
  start_time: tomorrow,
  end_time: tomorrow,
);

UserModel dummyUser = UserModel(
  user_id: 1,
  teacher_id: 1,
  user_classes: [dummyClass, dummyClassTwo],
  name: "Jane Doe",
  email: "janeDoe@gmail.com",
  role: appTeacherRoleKw,
  phone_no: "0712345678",
);
