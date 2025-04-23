// SHARED PREFS
// -----------------------
import 'package:intl/intl.dart';

const String strDefSharedPrefKey = "05cca623-58ad-47";
const String strDefToken = "access_token";
const String strDefLoggedInUserData = "loggedInUserData";
const String strLoggedInUserClassrooms = "strLoggedInUserClassrooms";

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
const List<int> allGradesList = [7, 8, 9];
