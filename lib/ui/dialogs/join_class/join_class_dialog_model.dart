import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/ui/dialogs/join_class/join_class_dialog.form.dart';
import 'package:mtihani_app/utils/api/api_calls.dart';
import 'package:mtihani_app/utils/api/api_config.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class JoinClassDialogModel extends BaseViewModel with FormStateHelper {
  final _navigationService = locator<NavigationService>();
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
      postEndpoint: endPointJoinClassroom,
      dataMap: {"student_code": studentCodeValue},
    );
    isLoading = false;
    rebuildUi();
    if (apiCallChecks(apiCallRes, "classroom result",
            showSuccessMessage: true) ==
        true) {
      _navigationService.clearStackAndShow(Routes.dashboardView);
    }
  }
}
