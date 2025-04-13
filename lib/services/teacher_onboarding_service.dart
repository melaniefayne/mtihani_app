import 'package:flutter/material.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/class_form/class_form_view.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/exam_setup/exam_setup_view.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/teacher_signup/teacher_signup_view.dart';
import 'package:stacked_services/stacked_services.dart';

class TeacherOnboardingService {
  final _navigationService = locator<NavigationService>();
  final PageController pageController = PageController();
  ClassModel? currentClass;

  onSetCurrentClass(ClassModel classModel) {
    currentClass = classModel;
  }

  goToNextPage() {
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
    pageController.dispose();
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
  TeacherOnboardingModel(
    title: 'Set your first exam',
    subtitle: "A step closer to better insights",
    mainWidget: const ExamSetupView(),
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
