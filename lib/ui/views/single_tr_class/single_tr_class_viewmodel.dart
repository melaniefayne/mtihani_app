import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SingleTrClassViewModel extends BaseViewModel {
  final _trOnboardService = locator<TeacherOnboardingService>();
  final _navigationService = locator<NavigationService>();

  final ClassroomModel classroom;

  SingleTrClassViewModel(this.classroom);

  onGenerateClassExam(ClassroomModel classItem) async {
    _trOnboardService.onSetCurrentClass(classItem);
    _trOnboardService.onSetIsFromOnboarding(false);
    _navigationService.navigateToExamSetupView();
  }

  // TODO
  // When you edit a class return the updated list of classrooms for caching
}
