import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/dialogs/role_signup/role_signup_dialog_model.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RoleSignupDialog extends StackedView<RoleSignupDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const RoleSignupDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RoleSignupDialogModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return buildDialogScaffold(
      theme: theme,
      pageSize: pageSize,
      hideLogo: false,
      title: "Welcome to Mtihani",
      children: [
        const Text("What best describes you?"),
        SizedBox(height: pageSize.height * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pageSize.width * 0.1),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildProfileBtn(
                theme: theme,
                pageHeight: pageSize.height,
                imagePath: astImagesStudent,
                btnLabel: "I'm a Student",
                onAction: () {
                  viewModel.onUserSelection(completer, appStudentRoleKw);
                },
              ),
              Container(
                decoration: BoxDecoration(color: theme.primaryColor),
                height: pageSize.height * 0.2,
                width: 1.0,
                margin: EdgeInsets.symmetric(horizontal: pageSize.width * 0.04),
              ),
              buildProfileBtn(
                theme: theme,
                pageHeight: pageSize.height,
                imagePath: astImagesTeacher,
                btnLabel: "I'm a Teacher",
                onAction: () {
                  viewModel.onUserSelection(completer, appTeacherRoleKw);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildProfileBtn({
    required ThemeData theme,
    required double pageHeight,
    required String imagePath,
    required String btnLabel,
    required Function() onAction,
  }) {
    return GestureDetector(
      onTap: onAction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            height: pageHeight * 0.3,
          ),
          SizedBox(height: pageHeight * 0.01),
          buildPriBtn(
            theme: theme,
            btnTxt: btnLabel,
            onAction: onAction,
          )
        ],
      ),
    );
  }

  @override
  RoleSignupDialogModel viewModelBuilder(BuildContext context) =>
      RoleSignupDialogModel();
}
