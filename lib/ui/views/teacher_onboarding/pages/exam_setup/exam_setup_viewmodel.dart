import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:stacked/stacked.dart';

class ExamSetupViewModel extends BaseViewModel {
  final _trOnboardingService = locator<TeacherOnboardingService>();

  onApiExamSetup() async {
    onGoToHome();
  }

  onGoToHome() {
    _trOnboardingService.onFinishOnboarding();
  }
}
