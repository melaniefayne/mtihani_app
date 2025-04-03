import 'package:flutter/material.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class TeacherOnboardingService {
  final _navigationService = locator<NavigationService>();
  final PageController pageController = PageController();

  goToNextPage() {
    final nextPage = pageController.page!.toInt() + 1;
    pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  onFinishOnboarding() {
    pageController.dispose();
    _navigationService.clearStackAndShow(Routes.teacherHomeView);
  }
}
