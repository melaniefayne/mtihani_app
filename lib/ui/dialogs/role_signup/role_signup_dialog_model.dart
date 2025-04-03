import 'package:mtihani_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RoleSignupDialogModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  getBack() {
    _navigationService.back();
  }

  onUserSelection(
      Function(DialogResponse<dynamic>)? completer, String roleName) {
    if (completer != null) {
      completer(DialogResponse(data: roleName));
    }
  }
}
