import 'package:flutter/material.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:stacked/stacked.dart';

class TeacherOnboardingViewModel extends BaseViewModel {
  final _trOnboardingService = locator<TeacherOnboardingService>();

  int _currentStep = 0;
  int get currentStep => _currentStep;

  PageController get pageCtrl => _trOnboardingService.pageController;

  TeacherOnboardingViewModel() {
    _trOnboardingService.pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final newStep = _trOnboardingService.pageController.page?.round() ?? 0;
    if (newStep != _currentStep) {
      _currentStep = newStep;
      rebuildUi();
    }
  }

  @override
  void dispose() {
    _trOnboardingService.pageController.removeListener(_onPageChanged);
    super.dispose();
  }
}
