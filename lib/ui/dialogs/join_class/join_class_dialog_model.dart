import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/ui/dialogs/join_class/join_class_dialog.form.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
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

    isLoading = true;
    rebuildUi();
    var apiCallRes = await onApiPostCall(
      postEndpoint: endPointJoinClass,
      skipTokenCheck: true,
      dataMap: {"student_code": studentCodeValue},
    );
    isLoading = false;
    rebuildUi();
    if (apiCallChecks(apiCallRes, "join classroom result",
            showSuccessMessage: true) ==
        true) {
      if (completer != null) {
        completer(DialogResponse(data: true));
      }
    }
  }
}
