import 'dart:async';

import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SingleStExamViewModel
    extends FutureViewModel<StudentExamSessionDataModel?> {
  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPrefsService>();
  ExamModel? exam;
  final Completer<void> _examLoaded = Completer<void>();

  onSingleStExamViewReady() async {
    exam = await _sharedPrefsService.getSingleStExamNavArg();
    if (exam?.id == null) {
      _navigationService.back();
      return;
    }
    _examLoaded.complete();
    rebuildUi();
  }

  @override
  Future<StudentExamSessionDataModel?> futureToRun() async {
    await _examLoaded.future; // wait until exam is loaded

    var stExamSessionRes = await onApiGetCall<StudentExamSessionDataModel>(
      getEndpoint: endPointGetExamSession,
      queryParams: {
        "exam_id": exam!.id,
        "student_id": exam!.student_session_id
      },
      dataFromJson: StudentExamSessionDataModel.fromJson,
    );

    if (apiCallChecks(stExamSessionRes, 'student exam session')) {
      return stExamSessionRes.$1?.data;
    }
    return null;
  }

  onDispose() async {
    await _sharedPrefsService.clearSingleStExamNavArg();
  }
}
