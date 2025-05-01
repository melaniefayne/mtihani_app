import 'package:mtihani_app/ui/dialogs/join_class/join_class_dialog.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class JoinClassDialogModel extends BaseViewModel with FormStateHelper {
  bool isLoading = false;

  onApiJoinClass(Function(DialogResponse<dynamic>)? completer) async {
    validateForm();
    if (!isFormValid) {
      rebuildUi();
      return;
    }
  }
}
