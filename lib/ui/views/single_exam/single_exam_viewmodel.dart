import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
import 'package:stacked/stacked.dart';

class SingleExamViewModel extends BaseViewModel {
  ExamModel examItem;
  bool isLoading = false;
  String? examSetupError;
  List<DateTime> editedDateTimes = [];

  SingleExamViewModel(this.examItem);

  onDateTimesSelected(DateTime startTime, DateTime endTime) {
    editedDateTimes.clear();
    editedDateTimes.addAll([startTime, endTime]);
    examSetupError = null;
    rebuildUi();
  }

  onEditExamTime() async {
    if (editedDateTimes.isEmpty) {
      examSetupError = "Confirm exam schedule to continue";
      rebuildUi();
      return;
    }

    isLoading = true;
    rebuildUi();
    var apiCallRes = await onApiPostCall<ExamModel>(
      postEndpoint: endPointGetEditExam,
      dataMap: {
        "selected_times": editedDateTimes
            .map((e) => getFormattedDate(e, apiDateTimeFormat))
            .toList(),
      },
    );
    isLoading = false;
    rebuildUi();

    if (apiCallChecks(apiCallRes, "exam edit result",
            showSuccessMessage: true) ==
        true) {
      ExamModel? newExam = apiCallRes.$1?.data;
      if (newExam != null) {
        examItem = newExam;
        rebuildUi();
      }
    }
  }
}
