import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/services/teacher_onboarding_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SingleTrClassViewModel extends BaseViewModel {
  final _trOnboardService = locator<TeacherOnboardingService>();
  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPrefsService>();
  ClassroomModel? trClassroom;

  onSingleClassViewReady() async {
    trClassroom = await _sharedPrefsService.getSingleTrClassroomNavArg();
    if (trClassroom == null) {
      _navigationService.clearStackAndShow(Routes.startupView);
      return;
    }
    _trOnboardService.onSetCurrentClass(trClassroom!);
    _trOnboardService.onSetIsFromOnboarding(false);
    rebuildUi();
  }

  onGenerateClassExam() async {
    _navigationService.navigateToExamSetupView();
  }

  onDispose() async {
    await _sharedPrefsService.clearSingleTrClassroomNavArg();
  }
}
