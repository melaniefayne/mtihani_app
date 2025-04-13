import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/app/app.router.dart';
import 'package:mtihani_app/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  onEditProfile() => _navigationService.navigateToEditProfileView();

  onChangePassword() => _navigationService.navigateToChangePasswordView();

  onLogOut() async => _authService.onLogoutUser();
}
