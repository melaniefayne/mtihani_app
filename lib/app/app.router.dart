// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i19;
import 'package:flutter/material.dart';
import 'package:mtihani_app/models/classroom.dart' as _i21;
import 'package:mtihani_app/models/user.dart' as _i20;
import 'package:mtihani_app/ui/views/auth/login/login_view.dart' as _i3;
import 'package:mtihani_app/ui/views/auth/profile/change_password/change_password_view.dart'
    as _i15;
import 'package:mtihani_app/ui/views/auth/profile/edit_profile/edit_profile_view.dart'
    as _i14;
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
import 'package:mtihani_app/ui/views/cbc/cbc_view.dart' as _i18;
import 'package:mtihani_app/ui/views/dashboard/dashboard_view.dart' as _i11;
import 'package:mtihani_app/ui/views/exam_list/exam_list_view.dart' as _i17;
import 'package:mtihani_app/ui/views/single_st_class/single_st_class_view.dart'
    as _i16;
import 'package:mtihani_app/ui/views/single_tr_class/single_tr_class_view.dart'
    as _i13;
import 'package:mtihani_app/ui/views/student_classes/student_classes_view.dart'
    as _i4;
import 'package:mtihani_app/ui/views/teacher_classes/teacher_classes_view.dart'
    as _i5;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i22;

class Routes {
  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const studentClassesView = '/student-classes-view';

  static const teacherClassesView = '/teacher-classes-view';

  static const teacherSignupView = '/teacher-signup-view';

  static const studentSignupView = '/student-signup-view';

  static const teacherOnboardingView = '/teacher-onboarding-view';

  static const classFormView = '/class-form-view';

  static const examSetupView = '/exam-setup-view';

  static const dashboardView = '/dashboard-view';

  static const profileView = '/profile-view';

  static const singleTrClassView = '/single-tr-class-view';

  static const editProfileView = '/edit-profile-view';

  static const changePasswordView = '/change-password-view';

  static const singleStClassView = '/single-st-class-view';

  static const examListView = '/exam-list-view';

  static const cbcView = '/cbc-view';

  static const all = <String>{
    startupView,
    loginView,
    studentClassesView,
    teacherClassesView,
    teacherSignupView,
    studentSignupView,
    teacherOnboardingView,
    classFormView,
    examSetupView,
    dashboardView,
    profileView,
    singleTrClassView,
    editProfileView,
    changePasswordView,
    singleStClassView,
    examListView,
    cbcView,
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
      Routes.studentClassesView,
      page: _i4.StudentClassesView,
    ),
    _i1.RouteDef(
      Routes.teacherClassesView,
      page: _i5.TeacherClassesView,
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
      Routes.singleTrClassView,
      page: _i13.SingleTrClassView,
    ),
    _i1.RouteDef(
      Routes.editProfileView,
      page: _i14.EditProfileView,
    ),
    _i1.RouteDef(
      Routes.changePasswordView,
      page: _i15.ChangePasswordView,
    ),
    _i1.RouteDef(
      Routes.singleStClassView,
      page: _i16.SingleStClassView,
    ),
    _i1.RouteDef(
      Routes.examListView,
      page: _i17.ExamListView,
    ),
    _i1.RouteDef(
      Routes.cbcView,
      page: _i18.CbcView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginView(),
        settings: data,
      );
    },
    _i4.StudentClassesView: (data) {
      final args = data.getArgs<StudentClassesViewArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.StudentClassesView(
            key: args.key,
            loggedInUser: args.loggedInUser,
            onSwitchToExamTab: args.onSwitchToExamTab),
        settings: data,
      );
    },
    _i5.TeacherClassesView: (data) {
      final args = data.getArgs<TeacherClassesViewArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.TeacherClassesView(
            key: args.key,
            loggedInUser: args.loggedInUser,
            onSwitchToExamTab: args.onSwitchToExamTab),
        settings: data,
      );
    },
    _i6.TeacherSignupView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.TeacherSignupView(),
        settings: data,
      );
    },
    _i7.StudentSignupView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.StudentSignupView(),
        settings: data,
      );
    },
    _i8.TeacherOnboardingView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.TeacherOnboardingView(),
        settings: data,
      );
    },
    _i9.ClassFormView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ClassFormView(),
        settings: data,
      );
    },
    _i10.ExamSetupView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ExamSetupView(),
        settings: data,
      );
    },
    _i11.DashboardView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.DashboardView(),
        settings: data,
      );
    },
    _i12.ProfileView: (data) {
      final args = data.getArgs<ProfileViewArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i12.ProfileView(key: args.key, loggedInUser: args.loggedInUser),
        settings: data,
      );
    },
    _i13.SingleTrClassView: (data) {
      final args = data.getArgs<SingleTrClassViewArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i13.SingleTrClassView(key: args.key, classroom: args.classroom),
        settings: data,
      );
    },
    _i14.EditProfileView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.EditProfileView(),
        settings: data,
      );
    },
    _i15.ChangePasswordView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.ChangePasswordView(),
        settings: data,
      );
    },
    _i16.SingleStClassView: (data) {
      final args = data.getArgs<SingleStClassViewArguments>(nullOk: false);
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i16.SingleStClassView(key: args.key, classroom: args.classroom),
        settings: data,
      );
    },
    _i17.ExamListView: (data) {
      final args = data.getArgs<ExamListViewArguments>(
        orElse: () => const ExamListViewArguments(),
      );
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => _i17.ExamListView(
            key: args.key,
            classroom: args.classroom,
            classStudent: args.classStudent),
        settings: data,
      );
    },
    _i18.CbcView: (data) {
      return _i19.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.CbcView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class StudentClassesViewArguments {
  const StudentClassesViewArguments({
    this.key,
    required this.loggedInUser,
    required this.onSwitchToExamTab,
  });

  final _i19.Key? key;

  final _i20.UserModel loggedInUser;

  final Function onSwitchToExamTab;

  @override
  String toString() {
    return '{"key": "$key", "loggedInUser": "$loggedInUser", "onSwitchToExamTab": "$onSwitchToExamTab"}';
  }

  @override
  bool operator ==(covariant StudentClassesViewArguments other) {
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

class TeacherClassesViewArguments {
  const TeacherClassesViewArguments({
    this.key,
    required this.loggedInUser,
    required this.onSwitchToExamTab,
  });

  final _i19.Key? key;

  final _i20.UserModel loggedInUser;

  final Function onSwitchToExamTab;

  @override
  String toString() {
    return '{"key": "$key", "loggedInUser": "$loggedInUser", "onSwitchToExamTab": "$onSwitchToExamTab"}';
  }

  @override
  bool operator ==(covariant TeacherClassesViewArguments other) {
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

  final _i19.Key? key;

  final _i20.UserModel loggedInUser;

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

class SingleTrClassViewArguments {
  const SingleTrClassViewArguments({
    this.key,
    required this.classroom,
  });

  final _i19.Key? key;

  final _i21.ClassroomModel classroom;

  @override
  String toString() {
    return '{"key": "$key", "classroom": "$classroom"}';
  }

  @override
  bool operator ==(covariant SingleTrClassViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.classroom == classroom;
  }

  @override
  int get hashCode {
    return key.hashCode ^ classroom.hashCode;
  }
}

class SingleStClassViewArguments {
  const SingleStClassViewArguments({
    this.key,
    required this.classroom,
  });

  final _i19.Key? key;

  final _i21.ClassroomModel classroom;

  @override
  String toString() {
    return '{"key": "$key", "classroom": "$classroom"}';
  }

  @override
  bool operator ==(covariant SingleStClassViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.classroom == classroom;
  }

  @override
  int get hashCode {
    return key.hashCode ^ classroom.hashCode;
  }
}

class ExamListViewArguments {
  const ExamListViewArguments({
    this.key,
    this.classroom,
    this.classStudent,
  });

  final _i19.Key? key;

  final _i21.ClassroomModel? classroom;

  final _i21.ClassroomStudent? classStudent;

  @override
  String toString() {
    return '{"key": "$key", "classroom": "$classroom", "classStudent": "$classStudent"}';
  }

  @override
  bool operator ==(covariant ExamListViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.classroom == classroom &&
        other.classStudent == classStudent;
  }

  @override
  int get hashCode {
    return key.hashCode ^ classroom.hashCode ^ classStudent.hashCode;
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

  Future<dynamic> navigateToStudentClassesView({
    _i19.Key? key,
    required _i20.UserModel loggedInUser,
    required Function onSwitchToExamTab,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.studentClassesView,
        arguments: StudentClassesViewArguments(
            key: key,
            loggedInUser: loggedInUser,
            onSwitchToExamTab: onSwitchToExamTab),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTeacherClassesView({
    _i19.Key? key,
    required _i20.UserModel loggedInUser,
    required Function onSwitchToExamTab,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.teacherClassesView,
        arguments: TeacherClassesViewArguments(
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
    _i19.Key? key,
    required _i20.UserModel loggedInUser,
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

  Future<dynamic> navigateToSingleTrClassView({
    _i19.Key? key,
    required _i21.ClassroomModel classroom,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.singleTrClassView,
        arguments: SingleTrClassViewArguments(key: key, classroom: classroom),
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

  Future<dynamic> navigateToSingleStClassView({
    _i19.Key? key,
    required _i21.ClassroomModel classroom,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.singleStClassView,
        arguments: SingleStClassViewArguments(key: key, classroom: classroom),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToExamListView({
    _i19.Key? key,
    _i21.ClassroomModel? classroom,
    _i21.ClassroomStudent? classStudent,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.examListView,
        arguments: ExamListViewArguments(
            key: key, classroom: classroom, classStudent: classStudent),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCbcView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cbcView,
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

  Future<dynamic> replaceWithStudentClassesView({
    _i19.Key? key,
    required _i20.UserModel loggedInUser,
    required Function onSwitchToExamTab,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.studentClassesView,
        arguments: StudentClassesViewArguments(
            key: key,
            loggedInUser: loggedInUser,
            onSwitchToExamTab: onSwitchToExamTab),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTeacherClassesView({
    _i19.Key? key,
    required _i20.UserModel loggedInUser,
    required Function onSwitchToExamTab,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.teacherClassesView,
        arguments: TeacherClassesViewArguments(
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
    _i19.Key? key,
    required _i20.UserModel loggedInUser,
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

  Future<dynamic> replaceWithSingleTrClassView({
    _i19.Key? key,
    required _i21.ClassroomModel classroom,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.singleTrClassView,
        arguments: SingleTrClassViewArguments(key: key, classroom: classroom),
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

  Future<dynamic> replaceWithSingleStClassView({
    _i19.Key? key,
    required _i21.ClassroomModel classroom,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.singleStClassView,
        arguments: SingleStClassViewArguments(key: key, classroom: classroom),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithExamListView({
    _i19.Key? key,
    _i21.ClassroomModel? classroom,
    _i21.ClassroomStudent? classStudent,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.examListView,
        arguments: ExamListViewArguments(
            key: key, classroom: classroom, classStudent: classStudent),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCbcView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cbcView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
