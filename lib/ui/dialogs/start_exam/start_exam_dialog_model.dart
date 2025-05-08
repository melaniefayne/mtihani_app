import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartExamDialogModel extends BaseViewModel {
  onStartExam(Function(DialogResponse<dynamic>)? completer) {
    if (completer != null) {
      completer(DialogResponse(data: true));
    }
  }
}
