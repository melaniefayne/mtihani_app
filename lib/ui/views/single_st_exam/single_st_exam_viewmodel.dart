import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SingleStExamViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPrefsService>();
  ExamModel? stExam;

  onSingleStExamViewReady() async {
    stExam = await _sharedPrefsService.getSingleTrExamNavArg();
    if (stExam == null) {
      _navigationService.back();
      return;
    }
    rebuildUi();
  }

  onDispose() async {
    await _sharedPrefsService.clearSingleStExamNavArg();
  }
}
