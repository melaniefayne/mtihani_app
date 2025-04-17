import 'package:mtihani_app/models/classroom.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ClassSelectorDialogModel extends BaseViewModel {
  onClassSelection(
      Function(DialogResponse<dynamic>)? completer, ClassroomModel classroom) {
    if (completer != null) {
      completer(DialogResponse(data: classroom));
    }
  }
}
