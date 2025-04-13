import 'package:mtihani_app/models/class.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ClassSelectorDialogModel extends BaseViewModel {
  onClassSelection(
      Function(DialogResponse<dynamic>)? completer, ClassModel classItem) {
    if (completer != null) {
      completer(DialogResponse(data: classItem));
    }
  }
}
