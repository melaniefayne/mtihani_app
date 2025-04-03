import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:stacked/stacked.dart';

class TeacherSignupViewModel extends BaseViewModel {
  final _trOnboardingService = locator<TeacherOnboardingService>();

  onApiTeacherSignUp() async {
    onGoToNext();
  }

  onGoToNext() {
    _trOnboardingService.goToNextPage();
  }
}
