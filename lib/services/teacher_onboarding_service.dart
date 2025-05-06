import 'package:flutter/material.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/class_form/class_form_view.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/teacher_signup/teacher_signup_view.dart';
import 'package:stacked_services/stacked_services.dart';

class TeacherOnboardingService {
  final _navigationService = locator<NavigationService>();
  PageController? _pageController;
  ClassroomModel? currentClass;
  bool isFromOnboarding = true;

  PageController get pageController {
    _pageController ??= PageController();
    return _pageController!;
  }

  void disposePageController() {
    _pageController?.dispose();
    _pageController = null;
  }

  onSetCurrentClass(ClassroomModel? classModel) {
    currentClass = classModel;
  }

  onSetIsFromOnboarding(bool isFromOnboarding) {
    isFromOnboarding = isFromOnboarding;
  }

  goToNextPage() {
    if (!pageController.hasClients) return;

    final nextPage = pageController.page!.toInt() + 1;

    if (nextPage == onboardingWidgets.length - 1 && currentClass == null) {
      onFinishOnboarding();
      return;
    }

    pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  onFinishOnboarding() {
    disposePageController();
    onSetCurrentClass(null);
    onSetIsFromOnboarding(true);
    _navigationService.clearStackAndShow(Routes.dashboardView);
  }
}

List<TeacherOnboardingModel> onboardingWidgets = [
  TeacherOnboardingModel(
    title: 'Create An Account',
    subtitle: "Tell us a little about yourself",
    mainWidget: const TeacherSignupView(),
  ),
  TeacherOnboardingModel(
    title: 'Add a class',
    subtitle: "Bring your students onboard",
    mainWidget: const ClassFormView(),
  ),
];

class TeacherOnboardingModel {
  final String title;
  final String subtitle;
  final Widget mainWidget;

  TeacherOnboardingModel({
    required this.title,
    required this.subtitle,
    required this.mainWidget,
  });
}
