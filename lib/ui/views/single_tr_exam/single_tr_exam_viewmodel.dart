import 'package:mtihani_app/app/app.dialogs.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/services/shared_prefs_service.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SingleTrExamViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _sharedPrefsService = locator<SharedPrefsService>();
  ExamModel? trClassroomExam;
  bool isLoading = false;

  onSingleTrExamViewReady() async {
    trClassroomExam = await _sharedPrefsService.getSingleTrExamNavArg();
    if (trClassroomExam == null) {
      _navigationService.back();
      return;
    }
    rebuildUi();
  }

  bool get isExamPublished => trClassroomExam?.is_published == true;

  onPublishExam() async {
    await onApiUpdateExam({"is_published": !isExamPublished});
  }

  onEditExamSchedule() async {
    var dialogRes = await _dialogService.showCustomDialog(
      variant: DialogType.editExamTime,
      data: {'currentExam': trClassroomExam!},
    );
    List<DateTime>? selectedTimes = dialogRes?.data;

    if (selectedTimes != null && selectedTimes.isNotEmpty) {
      await onApiUpdateExam({
        "start_date_time": selectedTimes.first.toIso8601String(),
        "end_date_time": selectedTimes.last.toIso8601String(),
      });
    }
  }

  onApiUpdateExam(Map<String, dynamic> updateBody) async {
    isLoading = true;
    rebuildUi();
    var examApiRes = await onApiPostCall<ExamModel>(
      queryParams: {"exam_id": trClassroomExam!.id},
      postEndpoint: endPointEditClassroomExam,
      dataMap: updateBody,
      dataFromJson: ExamModel.fromJson,
      dataField: "new_exam",
    );
    isLoading = false;
    rebuildUi();

    if (apiCallChecks(examApiRes, "exam update result",
            showSuccessMessage: true) ==
        true) {
      ExamModel? resExam = examApiRes.$1?.data;
      if (resExam != null) {
        await updateCurrentExam(resExam);
      } else {
        await fetchCurrentExam();
      }
    }
  }

  fetchCurrentExam() async {
    var examApiRes = await onApiGetCall<ExamModel>(
      getEndpoint: endPointGetExam,
      queryParams: {"exam_id": trClassroomExam!.id},
      dataFromJson: ExamModel.fromJson,
      dataField: "new_exam",
    );

    if (apiCallChecks(examApiRes, 'current exam')) {
      await updateCurrentExam(examApiRes.$1?.data);
    }
  }

  updateCurrentExam(ExamModel? resExam) async {
    if (resExam == null) return;
    trClassroomExam = resExam;
    await _sharedPrefsService.setSingleTrExamNavArg(resExam);
    rebuildUi();
  }

  onDispose() async {
    await _sharedPrefsService.clearSingleTrExamNavArg();
  }
}
