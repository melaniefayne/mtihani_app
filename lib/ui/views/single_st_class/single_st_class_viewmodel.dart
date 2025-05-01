import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SingleStClassViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPrefsService>();
  ClassroomStudentModel? stClassroom;

  onSingleStClassViewReady() async {
    stClassroom = await _sharedPrefsService.getSingleStClassroomNavArg();
    if (stClassroom == null) {
      _navigationService.clearStackAndShow(Routes.startupView);
      return;
    }
    rebuildUi();
  }

  onDispose() async {
    await _sharedPrefsService.clearSingleStClassroomNavArg();
  }
}
