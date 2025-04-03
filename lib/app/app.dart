import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:mtihani_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:mtihani_app/ui/views/home/home_view.dart';
import 'package:mtihani_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:mtihani_app/ui/views/login/login_view.dart';
import 'package:mtihani_app/ui/views/student_home/student_home_view.dart';
import 'package:mtihani_app/ui/views/teacher_home/teacher_home_view.dart';
import 'package:mtihani_app/ui/dialogs/role_signup/role_signup_dialog.dart';
import 'package:mtihani_app/ui/views/teacher_signup/teacher_signup_view.dart';
import 'package:mtihani_app/ui/views/student_signup/student_signup_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: StudentHomeView),
    MaterialRoute(page: TeacherHomeView),
    MaterialRoute(page: TeacherSignupView),
    MaterialRoute(page: StudentSignupView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SharedPrefsService),
    LazySingleton(classType: AuthService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: RoleSignupDialog),
// @stacked-dialog
  ],
)
class App {}
