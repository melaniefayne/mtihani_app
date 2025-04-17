import 'package:mtihani_app/services/auth_service.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:mtihani_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:mtihani_app/ui/views/auth/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:mtihani_app/ui/views/auth/login/login_view.dart';
import 'package:mtihani_app/ui/views/student_classes/student_classes_view.dart';
import 'package:mtihani_app/ui/views/teacher_classes/teacher_classes_view.dart';
import 'package:mtihani_app/ui/dialogs/role_signup/role_signup_dialog.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/teacher_signup/teacher_signup_view.dart';
import 'package:mtihani_app/ui/views/auth/student_signup/student_signup_view.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/teacher_onboarding_view.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/class_form/class_form_view.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/exam_setup/exam_setup_view.dart';
import 'package:mtihani_app/ui/views/dashboard/dashboard_view.dart';
import 'package:mtihani_app/ui/views/auth/profile/profile_view.dart';
import 'package:mtihani_app/ui/views/single_exam/single_exam_view.dart';
import 'package:mtihani_app/ui/views/single_tr_class/single_tr_class_view.dart';
import 'package:mtihani_app/ui/dialogs/app_action/app_action_dialog.dart';
import 'package:mtihani_app/ui/dialogs/class_selector/class_selector_dialog.dart';
import 'package:mtihani_app/ui/views/auth/profile/edit_profile/edit_profile_view.dart';
import 'package:mtihani_app/ui/views/auth/profile/change_password/change_password_view.dart';
import 'package:mtihani_app/ui/views/single_student/single_student_view.dart';
import 'package:mtihani_app/ui/views/single_st_class/single_st_class_view.dart';
import 'package:mtihani_app/ui/dialogs/join_class/join_class_dialog.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: StudentClassesView),
    MaterialRoute(page: TeacherClassesView),
    MaterialRoute(page: TeacherSignupView),
    MaterialRoute(page: StudentSignupView),
    MaterialRoute(page: TeacherOnboardingView),
    MaterialRoute(page: ClassFormView),
    MaterialRoute(page: ExamSetupView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: SingleExamView),
    MaterialRoute(page: SingleTrClassView),
    MaterialRoute(page: EditProfileView),
    MaterialRoute(page: ChangePasswordView),
    MaterialRoute(page: SingleStudentView),
    MaterialRoute(page: SingleStClassView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SharedPrefsService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: TeacherOnboardingService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: RoleSignupDialog),
    StackedDialog(classType: AppActionDialog),
    StackedDialog(classType: ClassSelectorDialog),
    StackedDialog(classType: JoinClassDialog),
// @stacked-dialog
  ],
)
class App {}
