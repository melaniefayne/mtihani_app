import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/teacher_signup/teacher_signup_view.form.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/utils.dart';
import 'package:mtihani_app/ui/widgets/app_choice_form_field.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'teacher_signup_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'firstName', validator: formStrValueValidator),
  FormTextField(name: 'lastName', validator: formStrValueValidator),
  FormTextField(name: 'teacherEmail', validator: formEmailValidator),
  FormTextField(name: 'phoneNo', validator: formPhoneNoValidator),
  FormTextField(name: 'teacherPassword', validator: formPasswordValidator),
  FormTextField(name: 'teacherConfirmPassword'),
])
class TeacherSignupView extends StackedView<TeacherSignupViewModel>
    with $TeacherSignupView {
  const TeacherSignupView({Key? key}) : super(key: key);

  @override
  void onDispose(TeacherSignupViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  Widget builder(
    BuildContext context,
    TeacherSignupViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    double rowFieldFactor = 0.33;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(pageSize.width * 0.04),
        child: Column(
          children: [
            buildPageTitle(
              theme: theme,
              pageTitle: "Karibu Mwalimu",
            ),
            SizedBox(height: pageSize.height * 0.02),
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
              controller: teacherEmailController,
              errorText: viewModel.teacherEmailValidationMessage,
            ),
            AppTextFormField(
              label: "Phone Number",
              inputType: TextInputType.number,
              textInputAction: TextInputAction.next,
              controller: phoneNoController,
              errorText: viewModel.phoneNoValidationMessage,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: pageSize.width * rowFieldFactor,
                  child: AppTextFormField(
                    label: "Password",
                    inputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    obscureText: !viewModel.isPasswordVisible,
                    controller: teacherPasswordController,
                    errorText: viewModel.teacherPasswordValidationMessage,
                    suffixIcon: formEyePassIcon(
                      onObscurePass: viewModel.togglePasswordVisibility,
                      isVisible: viewModel.isPasswordVisible,
                      theme: theme,
                    ),
                  ),
                ),
                SizedBox(
                  width: pageSize.width * rowFieldFactor,
                  child: AppTextFormField(
                    label: "Confirm Password",
                    inputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    obscureText: !viewModel.isPasswordVisible,
                    controller: teacherConfirmPasswordController,
                    errorText: viewModel.confirmPassValidationMessage,
                    suffixIcon: formEyePassIcon(
                      onObscurePass: viewModel.togglePasswordVisibility,
                      isVisible: viewModel.isPasswordVisible,
                      theme: theme,
                    ),
                  ),
                ),
              ],
            ),
            AppChoicesFormField(
              label: 'Subjects',
              items: appSubjectList,
              selectedValues: appSubjectList,
              onSelected: (val) {},
              onRemoved: (val) {},
            ),
            SizedBox(height: pageSize.height * 0.02),
            buildPriBtn(
              theme: theme,
              btnTxt: 'Create Account',
              iconPath: Icons.account_circle_outlined,
              isLoading: viewModel.isLoading,
              onAction: viewModel.onApiTeacherSignup,
              isFullWidth: true,
            ),
          ],
        ),
      ),
    );
  }

  @override
  TeacherSignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TeacherSignupViewModel();

  @override
  void onViewModelReady(TeacherSignupViewModel viewModel) {
    viewModel.onTeacherSignUpReady();
    syncFormWithViewModel(viewModel);
  }
}
