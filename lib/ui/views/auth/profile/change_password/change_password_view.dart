import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/views/auth/profile/change_password/change_password_view.form.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'change_password_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'currentPassword', validator: formPasswordValidator),
  FormTextField(name: 'newPassword', validator: formPasswordValidator),
  FormTextField(name: 'confirmPassword'),
])
class ChangePasswordView extends StackedView<ChangePasswordViewModel>
    with $ChangePasswordView {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  void onDispose(ChangePasswordViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  Widget builder(
    BuildContext context,
    ChangePasswordViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    return buildAppPageScaffold(
      theme: theme,
      pageSize: pageSize,
      pageTitle: "Change Password",
      children: [
        AppTextFormField(
          label: "Current Password",
          inputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          obscureText: !viewModel.isPasswordVisible,
          controller: currentPasswordController,
          errorText: viewModel.currentPasswordValidationMessage,
          suffixIcon: formEyePassIcon(
            onObscurePass: viewModel.togglePasswordVisibility,
            isVisible: viewModel.isPasswordVisible,
            theme: theme,
          ),
        ),
        AppTextFormField(
          label: "New Password",
          inputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          obscureText: !viewModel.isPasswordVisible,
          controller: newPasswordController,
          errorText: viewModel.newPasswordValidationMessage,
          suffixIcon: formEyePassIcon(
            onObscurePass: viewModel.togglePasswordVisibility,
            isVisible: viewModel.isPasswordVisible,
            theme: theme,
          ),
        ),
        AppTextFormField(
          label: "Confirm New Password",
          inputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          obscureText: !viewModel.isPasswordVisible,
          controller: confirmPasswordController,
          errorText: viewModel.confirmPassValidationMessage,
          suffixIcon: formEyePassIcon(
            onObscurePass: viewModel.togglePasswordVisibility,
            isVisible: viewModel.isPasswordVisible,
            theme: theme,
          ),
        ),
        buildPriBtn(
          theme: theme,
          onAction: viewModel.onApiChangePassword,
          iconPath: Icons.lock,
          btnTxt: 'Change Password',
          isLoading: viewModel.isLoading,
          isFullWidth: true,
        ),
      ],
    );
  }

  @override
  ChangePasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChangePasswordViewModel();

  @override
  void onViewModelReady(ChangePasswordViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}
