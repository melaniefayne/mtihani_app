// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i18;
import 'package:flutter/material.dart';
import 'package:mtihani_app/models/class.dart' as _i20;
import 'package:mtihani_app/models/exam.dart' as _i21;
import 'package:mtihani_app/models/user.dart' as _i19;
import 'package:mtihani_app/ui/views/auth/login/login_view.dart' as _i3;
import 'package:mtihani_app/ui/views/auth/profile/change_password/change_password_view.dart'
    as _i17;
import 'package:mtihani_app/ui/views/auth/profile/edit_profile/edit_profile_view.dart'
    as _i16;
import 'package:mtihani_app/ui/views/auth/profile/profile_view.dart' as _i12;
import 'package:mtihani_app/ui/views/auth/startup/startup_view.dart' as _i2;
import 'package:mtihani_app/ui/views/auth/student_signup/student_signup_view.dart'
    as _i7;
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/class_form/class_form_view.dart'
    as _i9;
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/exam_setup/exam_setup_view.dart'
    as _i10;
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/teacher_onboarding_view.dart'
    as _i8;
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/teacher_signup/teacher_signup_view.dart'
    as _i6;
import 'package:mtihani_app/ui/views/dashboard/dashboard_view.dart' as _i11;
import 'package:mtihani_app/ui/views/exam_list/exam_list_view.dart' as _i13;
import 'package:mtihani_app/ui/views/single_class/single_class_view.dart'
    as _i15;
import 'package:mtihani_app/ui/views/single_exam/single_exam_view.dart' as _i14;
import 'package:mtihani_app/ui/views/student_home/student_home_view.dart'
    as _i4;
import 'package:mtihani_app/ui/views/teacher_home/teacher_home_view.dart'
    as _i5;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i22;

class Routes {
  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const studentHomeView = '/student-home-view';

  static const teacherHomeView = '/teacher-home-view';

  static const teacherSignupView = '/teacher-signup-view';

  static const studentSignupView = '/student-signup-view';

  static const teacherOnboardingView = '/teacher-onboarding-view';

  static const classFormView = '/class-form-view';

  static const examSetupView = '/exam-setup-view';

  static const dashboardView = '/dashboard-view';

  static const profileView = '/profile-view';

  static const examListView = '/exam-list-view';

  static const singleExamView = '/single-exam-view';

  static const singleClassView = '/single-class-view';

  static const editProfileView = '/edit-profile-view';

  static const changePasswordView = '/change-password-view';

  static const all = <String>{
    startupView,
    loginView,
    studentHomeView,
    teacherHomeView,
    teacherSignupView,
    studentSignupView,
    teacherOnboardingView,
    classFormView,
    examSetupView,
    dashboardView,
    profileView,
    examListView,
    singleExamView,
    singleClassView,
    editProfileView,
    changePasswordView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i3.LoginView,
    ),
    _i1.RouteDef(
      Routes.studentHomeView,
      page: _i4.StudentHomeView,
    ),
    _i1.RouteDef(
      Routes.teacherHomeView,
      page: _i5.TeacherHomeView,
    ),
    _i1.RouteDef(
      Routes.teacherSignupView,
      page: _i6.TeacherSignupView,
    ),
    _i1.RouteDef(
      Routes.studentSignupView,
      page: _i7.StudentSignupView,
    ),
    _i1.RouteDef(
      Routes.teacherOnboardingView,
      page: _i8.TeacherOnboardingView,
    ),
    _i1.RouteDef(
      Routes.classFormView,
      page: _i9.ClassFormView,
    ),
    _i1.RouteDef(
      Routes.examSetupView,
      page: _i10.ExamSetupView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i11.DashboardView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i12.ProfileView,
    ),
    _i1.RouteDef(
      Routes.examListView,
      page: _i13.ExamListWidget,
    ),
    _i1.RouteDef(
      Routes.singleExamView,
      page: _i14.SingleExamView,
    ),
    _i1.RouteDef(
      Routes.singleClassView,
      page: _i15.SingleClassView,
    ),
    _i1.RouteDef(
      Routes.editProfileView,
      page: _i16.EditProfileView,
    ),
    _i1.RouteDef(
      Routes.changePasswordView,
      page: _i17.ChangePasswordView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginView(),
        settings: data,
      );
    },
    _i4.StudentHomeView: (data) {
      final args = data.getArgs<StudentHomeViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.StudentHomeView(key: args.key, loggedInUser: args.loggedInUser),
        settings: data,
      );
    },
    _i5.TeacherHomeView: (data) {
      final args = data.getArgs<TeacherHomeViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.TeacherHomeView(
            key: args.key,
            loggedInUser: args.loggedInUser,
            onSwitchToExamTab: args.onSwitchToExamTab),
        settings: data,
      );
    },
    _i6.TeacherSignupView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.TeacherSignupView(),
        settings: data,
      );
    },
    _i7.StudentSignupView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.StudentSignupView(),
        settings: data,
      );
    },
    _i8.TeacherOnboardingView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.TeacherOnboardingView(),
        settings: data,
      );
    },
    _i9.ClassFormView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ClassFormView(),
        settings: data,
      );
    },
    _i10.ExamSetupView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ExamSetupView(),
        settings: data,
      );
    },
    _i11.DashboardView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.DashboardView(),
        settings: data,
      );
    },
    _i12.ProfileView: (data) {
      final args = data.getArgs<ProfileViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i12.ProfileView(key: args.key, loggedInUser: args.loggedInUser),
        settings: data,
      );
    },
    _i13.ExamListWidget: (data) {
      final args = data.getArgs<ExamListWidgetArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i13.ExamListWidget(key: args.key, userClasses: args.userClasses),
        settings: data,
      );
    },
    _i14.SingleExamView: (data) {
      final args = data.getArgs<SingleExamViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i14.SingleExamView(key: args.key, examItem: args.examItem),
        settings: data,
      );
    },
    _i15.SingleClassView: (data) {
      final args = data.getArgs<SingleClassViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i15.SingleClassView(key: args.key, classItem: args.classItem),
        settings: data,
      );
    },
    _i16.EditProfileView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.EditProfileView(),
        settings: data,
      );
    },
    _i17.ChangePasswordView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.ChangePasswordView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class StudentHomeViewArguments {
  const StudentHomeViewArguments({
    this.key,
    required this.loggedInUser,
  });

  final _i18.Key? key;

  final _i19.UserModel loggedInUser;

  @override
  String toString() {
    return '{"key": "$key", "loggedInUser": "$loggedInUser"}';
  }

  @override
  bool operator ==(covariant StudentHomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.loggedInUser == loggedInUser;
  }

  @override
  int get hashCode {
    return key.hashCode ^ loggedInUser.hashCode;
  }
}

class TeacherHomeViewArguments {
  const TeacherHomeViewArguments({
    this.key,
    required this.loggedInUser,
    required this.onSwitchToExamTab,
  });

  final _i18.Key? key;

  final _i19.UserModel loggedInUser;

  final Function onSwitchToExamTab;

  @override
  String toString() {
    return '{"key": "$key", "loggedInUser": "$loggedInUser", "onSwitchToExamTab": "$onSwitchToExamTab"}';
  }

  @override
  bool operator ==(covariant TeacherHomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.loggedInUser == loggedInUser &&
        other.onSwitchToExamTab == onSwitchToExamTab;
  }

  @override
  int get hashCode {
    return key.hashCode ^ loggedInUser.hashCode ^ onSwitchToExamTab.hashCode;
  }
}

class ProfileViewArguments {
  const ProfileViewArguments({
    this.key,
    required this.loggedInUser,
  });

  final _i18.Key? key;

  final _i19.UserModel loggedInUser;

  @override
  String toString() {
    return '{"key": "$key", "loggedInUser": "$loggedInUser"}';
  }

  @override
  bool operator ==(covariant ProfileViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.loggedInUser == loggedInUser;
  }

  @override
  int get hashCode {
    return key.hashCode ^ loggedInUser.hashCode;
  }
}

class ExamListWidgetArguments {
  const ExamListWidgetArguments({
    this.key,
    required this.userClasses,
  });

  final _i18.Key? key;

  final List<_i20.ClassModel> userClasses;

  @override
  String toString() {
    return '{"key": "$key", "userClasses": "$userClasses"}';
  }

  @override
  bool operator ==(covariant ExamListWidgetArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.userClasses == userClasses;
  }

  @override
  int get hashCode {
    return key.hashCode ^ userClasses.hashCode;
  }
}

class SingleExamViewArguments {
  const SingleExamViewArguments({
    this.key,
    required this.examItem,
  });

  final _i18.Key? key;

  final _i21.ExamModel examItem;

  @override
  String toString() {
    return '{"key": "$key", "examItem": "$examItem"}';
  }

  @override
  bool operator ==(covariant SingleExamViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.examItem == examItem;
  }

  @override
  int get hashCode {
    return key.hashCode ^ examItem.hashCode;
  }
}

class SingleClassViewArguments {
  const SingleClassViewArguments({
    this.key,
    required this.classItem,
  });

  final _i18.Key? key;

  final _i20.ClassModel classItem;

  @override
  String toString() {
    return '{"key": "$key", "classItem": "$classItem"}';
  }

  @override
  bool operator ==(covariant SingleClassViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.classItem == classItem;
  }

  @override
  int get hashCode {
    return key.hashCode ^ classItem.hashCode;
  }
}

extension NavigatorStateExtension on _i22.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentHomeView({
    _i18.Key? key,
    required _i19.UserModel loggedInUser,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentHomeView,
        arguments:
            StudentHomeViewArguments(key: key, loggedInUser: loggedInUser),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTeacherHomeView({
    _i18.Key? key,
    required _i19.UserModel loggedInUser,
    required Function onSwitchToExamTab,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.teacherHomeView,
        arguments: TeacherHomeViewArguments(
            key: key,
            loggedInUser: loggedInUser,
            onSwitchToExamTab: onSwitchToExamTab),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTeacherSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.teacherSignupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.studentSignupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTeacherOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.teacherOnboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToClassFormView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.classFormView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToExamSetupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.examSetupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView({
    _i18.Key? key,
    required _i19.UserModel loggedInUser,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.profileView,
        arguments: ProfileViewArguments(key: key, loggedInUser: loggedInUser),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToExamListWidget({
    _i18.Key? key,
    required List<_i20.ClassModel> userClasses,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.examListView,
        arguments: ExamListWidgetArguments(key: key, userClasses: userClasses),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSingleExamView({
    _i18.Key? key,
    required _i21.ExamModel examItem,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.singleExamView,
        arguments: SingleExamViewArguments(key: key, examItem: examItem),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSingleClassView({
    _i18.Key? key,
    required _i20.ClassModel classItem,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.singleClassView,
        arguments: SingleClassViewArguments(key: key, classItem: classItem),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentHomeView({
    _i18.Key? key,
    required _i19.UserModel loggedInUser,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentHomeView,
        arguments:
            StudentHomeViewArguments(key: key, loggedInUser: loggedInUser),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTeacherHomeView({
    _i18.Key? key,
    required _i19.UserModel loggedInUser,
    required Function onSwitchToExamTab,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.teacherHomeView,
        arguments: TeacherHomeViewArguments(
            key: key,
            loggedInUser: loggedInUser,
            onSwitchToExamTab: onSwitchToExamTab),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTeacherSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.teacherSignupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.studentSignupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTeacherOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.teacherOnboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithClassFormView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.classFormView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithExamSetupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.examSetupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView({
    _i18.Key? key,
    required _i19.UserModel loggedInUser,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.profileView,
        arguments: ProfileViewArguments(key: key, loggedInUser: loggedInUser),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithExamListWidget({
    _i18.Key? key,
    required List<_i20.ClassModel> userClasses,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.examListView,
        arguments: ExamListWidgetArguments(key: key, userClasses: userClasses),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSingleExamView({
    _i18.Key? key,
    required _i21.ExamModel examItem,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.singleExamView,
        arguments: SingleExamViewArguments(key: key, examItem: examItem),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSingleClassView({
    _i18.Key? key,
    required _i20.ClassModel classItem,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.singleClassView,
        arguments: SingleClassViewArguments(key: key, classItem: classItem),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
