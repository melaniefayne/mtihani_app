import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditExamTimeDialogModel extends BaseViewModel {
  List<DateTime> selectedTimes = [];
  bool isLoading = false;
  String? examSetupError;

  onDateTimesSelected(DateTime startTime, DateTime endTime) {
    selectedTimes.clear();
    selectedTimes.addAll([startTime, endTime]);
    examSetupError = null;
    rebuildUi();
  }

  onEditExamSchedule(Function(DialogResponse<dynamic>)? completer) {
    if (selectedTimes.isEmpty) {
      examSetupError = "Confirm exam schedule to continue";
      rebuildUi();
      return;
    }

    examSetupError = null;
    rebuildUi();

    if (completer != null) {
      completer(DialogResponse(data: selectedTimes));
    }
  }
}
