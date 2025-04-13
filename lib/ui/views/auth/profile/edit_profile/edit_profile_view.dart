import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/ui/views/auth/profile/edit_profile/edit_profile_view.form.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'edit_profile_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'firstName', validator: formStrValueValidator),
  FormTextField(name: 'lastName', validator: formStrValueValidator),
  FormTextField(name: 'email', validator: formEmailValidator),
  FormTextField(name: 'phoneNo', validator: formPhoneNoValidator)
])
class EditProfileView extends StackedView<EditProfileViewModel>
    with $EditProfileView {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  void onDispose(EditProfileViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  Widget builder(
    BuildContext context,
    EditProfileViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    const double rowFieldFactor = 0.4;

    return buildAppPageScaffold(
      theme: theme,
      pageSize: pageSize,
      pageTitle: "Edit Profile",
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: pageSize.width * rowFieldFactor,
              child: AppTextFormField(
                label: "First Name",
                inputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: firstNameController,
                errorText: viewModel.firstNameValidationMessage,
              ),
            ),
            SizedBox(
              width: pageSize.width * rowFieldFactor,
              child: AppTextFormField(
                label: "Last Name",
                inputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: lastNameController,
                errorText: viewModel.lastNameValidationMessage,
              ),
            ),
          ],
        ),
        AppTextFormField(
          label: "Email",
          inputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          controller: emailController,
          errorText: viewModel.emailValidationMessage,
        ),
        Visibility(
          visible: viewModel.isTeacherProfile,
          child: AppTextFormField(
            label: "Phone Number",
            inputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: phoneNoController,
            errorText: viewModel.phoneNoValidationMessage,
          ),
        ),
        buildPriBtn(
          theme: theme,
          onAction: viewModel.onApiEditProfile,
          iconPath: FontAwesomeIcons.userPen,
          btnTxt: 'Update Profile',
          isLoading: viewModel.isLoading,
        ),
      ],
    );
  }

  @override
  EditProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditProfileViewModel();

  @override
  void onViewModelReady(EditProfileViewModel viewModel) {
    viewModel.onProfileViewReady();
    syncFormWithViewModel(viewModel);
  }
}
