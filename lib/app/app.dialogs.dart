// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/app_action/app_action_dialog.dart';
import '../ui/dialogs/class_selector/class_selector_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/join_class/join_class_dialog.dart';
import '../ui/dialogs/role_signup/role_signup_dialog.dart';

enum DialogType {
  infoAlert,
  roleSignup,
  appAction,
  classSelector,
  joinClass,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.roleSignup: (context, request, completer) =>
        RoleSignupDialog(request: request, completer: completer),
    DialogType.appAction: (context, request, completer) =>
        AppActionDialog(request: request, completer: completer),
    DialogType.classSelector: (context, request, completer) =>
        ClassSelectorDialog(request: request, completer: completer),
    DialogType.joinClass: (context, request, completer) =>
        JoinClassDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
