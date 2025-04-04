import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/ui/views/auth/student_signup/student_signup_view.form.dart';
import 'package:mtihani_app/ui/views/auth/student_signup/student_signup_viewmodel.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'firstName', validator: formStrValueValidator),
  FormTextField(name: 'lastName', validator: formStrValueValidator),
  FormTextField(name: 'studentEmail', validator: formEmailValidator),
  FormTextField(name: 'studentCode', validator: formAlphanumericValidator),
  FormTextField(name: 'studentPassword', validator: formPasswordValidator),
  FormTextField(name: 'studentConfirmPassword'),
])
class StudentSignupView extends StackedView<StudentSignupViewModel>
    with $StudentSignupView {
  const StudentSignupView({Key? key}) : super(key: key);

  @override
  void onDispose(StudentSignupViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  Widget builder(
    BuildContext context,
    StudentSignupViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    double rowFieldFactor = 0.215;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Container(
          width: pageSize.width * 0.5,
          padding: EdgeInsets.all(pageSize.height * 0.05),
          color: theme.cardColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                astImagesDarkLogo,
                height: 60,
              ),
              SizedBox(height: pageSize.height * 0.01),
              Text(
                "Karibu Mwanafunzi",
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
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
                controller: studentEmailController,
                errorText: viewModel.studentEmailValidationMessage,
              ),
              AppTextFormField(
                label: "Student Code",
                inputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: studentCodeController,
                errorText: viewModel.studentCodeValidationMessage,
                hintText: "The alphanumeric code your teacher sent you :)",
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
                      controller: studentPasswordController,
                      errorText: viewModel.studentPasswordValidationMessage,
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
                      controller: studentConfirmPasswordController,
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
              SizedBox(height: pageSize.height * 0.02),
              buildPriBtn(
                theme: theme,
                onAction: viewModel.onApiStudentSignup,
                iconPath: FontAwesomeIcons.usersRectangle,
                btnTxt: 'Join Class',
                isLoading: viewModel.isLoading,
              ),
              SizedBox(height: pageSize.height * 0.01),
              GestureDetector(
                onTap: viewModel.onBackToLogin,
                child: Text.rich(
                  TextSpan(
                    text: 'Have an Account? ',
                    children: [
                      TextSpan(
                        text: 'Back To Login',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  StudentSignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StudentSignupViewModel();

  @override
  void onViewModelReady(StudentSignupViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}
