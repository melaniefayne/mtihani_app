import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RoleSignupDialogModel extends BaseViewModel {
  onUserSelection(
      Function(DialogResponse<dynamic>)? completer, String roleName) {
    if (completer != null) {
      completer(DialogResponse(data: roleName));
    }
  }
}
