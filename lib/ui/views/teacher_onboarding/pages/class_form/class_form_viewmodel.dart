import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:stacked/stacked.dart';

class ClassFormViewModel extends BaseViewModel {
  final _trOnboardingService = locator<TeacherOnboardingService>();

  onApiClassCreate() async {
    onGoToNext();
  }

  onGoToNext() {
    _trOnboardingService.goToNextPage();
  }

  onGoToHome() {
    _trOnboardingService.onFinishOnboarding();
  }
}
