// SHARED PREFS
// -----------------------

const int appSnackbarDuration = 4;

const String strDefSharedPrefKey = "05cca623-58ad-47";
const String strDefToken = "access_token";
const String strDefLoggedInUserData = "loggedInUserData";
const String strLoggedInUserClassrooms = "strLoggedInUserClassrooms";
const String strCurrentTrClass = "strCurrentTrClass";
const String strCurrentStClass = "strCurrentStClass";
const String strCurrentTrExam = "strCurrentTrExam";
const String strCurrentStExam = "strCurrentStExam";
const String strCurrentExamQuestion = "strCurrentExamQuestion";

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
const String astImagesReady = "assets/images/ready.png";
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
const String errorOopsie =
    "Oops, something went wrong on our side! Please try again later";
// DATETIME
// -----------------------
final DateTime today = DateTime.now();
final DateTime tomorrow = today.add(const Duration(days: 1));
const List<int> allGradesList = [7, 8, 9];
const int minExamDurationInMin = 75;
const List<String> allBloomSkills = [
  "Remembering",
  "Understanding",
  "Applying",
  "Analysing",
  "Evaluating",
  "Creating",
];

const claudeSonnet4 = "claude-sonnet-4-20250514";
