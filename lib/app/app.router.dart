// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i18;
import 'package:flutter/material.dart';
import 'package:mtihani_app/models/classroom.dart' as _i19;
import 'package:mtihani_app/models/user.dart' as _i20;
import 'package:mtihani_app/ui/views/auth/login/login_view.dart' as _i3;
import 'package:mtihani_app/ui/views/auth/profile/change_password/change_password_view.dart'
    as _i14;
import 'package:mtihani_app/ui/views/auth/profile/edit_profile/edit_profile_view.dart'
    as _i13;
import 'package:mtihani_app/ui/views/auth/profile/profile_view.dart' as _i11;
import 'package:mtihani_app/ui/views/auth/startup/startup_view.dart' as _i2;
import 'package:mtihani_app/ui/views/auth/student_signup/student_signup_view.dart'
    as _i6;
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/class_form/class_form_view.dart'
    as _i8;
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/exam_setup/exam_setup_view.dart'
    as _i9;
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/teacher_onboarding_view.dart'
    as _i7;
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/teacher_signup/teacher_signup_view.dart'
    as _i5;
import 'package:mtihani_app/ui/views/cbc/cbc_view.dart' as _i17;
import 'package:mtihani_app/ui/views/classroom_list/classroom_list_view.dart'
    as _i4;
import 'package:mtihani_app/ui/views/dashboard/dashboard_view.dart' as _i10;
import 'package:mtihani_app/ui/views/exam_list/exam_list_view.dart' as _i16;
import 'package:mtihani_app/ui/views/single_st_class/single_st_class_view.dart'
    as _i15;
import 'package:mtihani_app/ui/views/single_tr_class/single_tr_class_view.dart'
    as _i12;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i21;

class Routes {
  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const classroomListView = '/classroom-list-view';

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
    classroomListView,
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
      Routes.classroomListView,
      page: _i4.ClassroomListView,
    ),
    _i1.RouteDef(
      Routes.teacherSignupView,
      page: _i5.TeacherSignupView,
    ),
    _i1.RouteDef(
      Routes.studentSignupView,
      page: _i6.StudentSignupView,
    ),
    _i1.RouteDef(
      Routes.teacherOnboardingView,
      page: _i7.TeacherOnboardingView,
    ),
    _i1.RouteDef(
      Routes.classFormView,
      page: _i8.ClassFormView,
    ),
    _i1.RouteDef(
      Routes.examSetupView,
      page: _i9.ExamSetupView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i10.DashboardView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i11.ProfileView,
    ),
    _i1.RouteDef(
      Routes.singleTrClassView,
      page: _i12.SingleTrClassView,
    ),
    _i1.RouteDef(
      Routes.editProfileView,
      page: _i13.EditProfileView,
    ),
    _i1.RouteDef(
      Routes.changePasswordView,
      page: _i14.ChangePasswordView,
    ),
    _i1.RouteDef(
      Routes.singleStClassView,
      page: _i15.SingleStClassView,
    ),
    _i1.RouteDef(
      Routes.examListView,
      page: _i16.ExamListView,
    ),
    _i1.RouteDef(
      Routes.cbcView,
      page: _i17.CbcView,
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
    _i4.ClassroomListView: (data) {
      final args = data.getArgs<ClassroomListViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.ClassroomListView(
            key: args.key,
            userClassrooms: args.userClassrooms,
            loggedInUser: args.loggedInUser),
        settings: data,
      );
    },
    _i5.TeacherSignupView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.TeacherSignupView(),
        settings: data,
      );
    },
    _i6.StudentSignupView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.StudentSignupView(),
        settings: data,
      );
    },
    _i7.TeacherOnboardingView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.TeacherOnboardingView(),
        settings: data,
      );
    },
    _i8.ClassFormView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.ClassFormView(),
        settings: data,
      );
    },
    _i9.ExamSetupView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ExamSetupView(),
        settings: data,
      );
    },
    _i10.DashboardView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.DashboardView(),
        settings: data,
      );
    },
    _i11.ProfileView: (data) {
      final args = data.getArgs<ProfileViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i11.ProfileView(key: args.key, loggedInUser: args.loggedInUser),
        settings: data,
      );
    },
    _i12.SingleTrClassView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.SingleTrClassView(),
        settings: data,
      );
    },
    _i13.EditProfileView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.EditProfileView(),
        settings: data,
      );
    },
    _i14.ChangePasswordView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.ChangePasswordView(),
        settings: data,
      );
    },
    _i15.SingleStClassView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.SingleStClassView(),
        settings: data,
      );
    },
    _i16.ExamListView: (data) {
      final args = data.getArgs<ExamListViewArguments>(nullOk: false);
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => _i16.ExamListView(
            key: args.key,
            userClassrooms: args.userClassrooms,
            loggedInUser: args.loggedInUser,
            currentClassroom: args.currentClassroom),
        settings: data,
      );
    },
    _i17.CbcView: (data) {
      return _i18.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.CbcView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ClassroomListViewArguments {
  const ClassroomListViewArguments({
    this.key,
    required this.userClassrooms,
    required this.loggedInUser,
  });

  final _i18.Key? key;

  final List<_i19.ClassroomModel> userClassrooms;

  final _i20.UserModel loggedInUser;

  @override
  String toString() {
    return '{"key": "$key", "userClassrooms": "$userClassrooms", "loggedInUser": "$loggedInUser"}';
  }

  @override
  bool operator ==(covariant ClassroomListViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.userClassrooms == userClassrooms &&
        other.loggedInUser == loggedInUser;
  }

  @override
  int get hashCode {
    return key.hashCode ^ userClassrooms.hashCode ^ loggedInUser.hashCode;
  }
}

class ProfileViewArguments {
  const ProfileViewArguments({
    this.key,
    required this.loggedInUser,
  });

  final _i18.Key? key;

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

class ExamListViewArguments {
  const ExamListViewArguments({
    this.key,
    required this.userClassrooms,
    required this.loggedInUser,
    this.currentClassroom,
  });

  final _i18.Key? key;

  final List<_i19.ClassroomModel> userClassrooms;

  final _i20.UserModel loggedInUser;

  final _i19.ClassroomModel? currentClassroom;

  @override
  String toString() {
    return '{"key": "$key", "userClassrooms": "$userClassrooms", "loggedInUser": "$loggedInUser", "currentClassroom": "$currentClassroom"}';
  }

  @override
  bool operator ==(covariant ExamListViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.userClassrooms == userClassrooms &&
        other.loggedInUser == loggedInUser &&
        other.currentClassroom == currentClassroom;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        userClassrooms.hashCode ^
        loggedInUser.hashCode ^
        currentClassroom.hashCode;
  }
}

extension NavigatorStateExtension on _i21.NavigationService {
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

  Future<dynamic> navigateToClassroomListView({
    _i18.Key? key,
    required List<_i19.ClassroomModel> userClassrooms,
    required _i20.UserModel loggedInUser,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.classroomListView,
        arguments: ClassroomListViewArguments(
            key: key,
            userClassrooms: userClassrooms,
            loggedInUser: loggedInUser),
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

  Future<dynamic> navigateToSingleTrClassView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.singleTrClassView,
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

  Future<dynamic> navigateToSingleStClassView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.singleStClassView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToExamListView({
    _i18.Key? key,
    required List<_i19.ClassroomModel> userClassrooms,
    required _i20.UserModel loggedInUser,
    _i19.ClassroomModel? currentClassroom,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.examListView,
        arguments: ExamListViewArguments(
            key: key,
            userClassrooms: userClassrooms,
            loggedInUser: loggedInUser,
            currentClassroom: currentClassroom),
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

  Future<dynamic> replaceWithClassroomListView({
    _i18.Key? key,
    required List<_i19.ClassroomModel> userClassrooms,
    required _i20.UserModel loggedInUser,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.classroomListView,
        arguments: ClassroomListViewArguments(
            key: key,
            userClassrooms: userClassrooms,
            loggedInUser: loggedInUser),
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

  Future<dynamic> replaceWithSingleTrClassView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.singleTrClassView,
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

  Future<dynamic> replaceWithSingleStClassView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.singleStClassView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithExamListView({
    _i18.Key? key,
    required List<_i19.ClassroomModel> userClassrooms,
    required _i20.UserModel loggedInUser,
    _i19.ClassroomModel? currentClassroom,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.examListView,
        arguments: ExamListViewArguments(
            key: key,
            userClassrooms: userClassrooms,
            loggedInUser: loggedInUser,
            currentClassroom: currentClassroom),
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
