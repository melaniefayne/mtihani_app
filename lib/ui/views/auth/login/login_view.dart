import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/views/auth/login/login_view.form.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: formEmailValidator),
  FormTextField(name: 'password', validator: formPasswordValidator),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Container(
          width: pageSize.width * 0.4,
          padding: EdgeInsets.all(pageSize.height * 0.05),
          color: theme.cardColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildAppLogo(),
              SizedBox(height: pageSize.height * 0.02),
              AppTextFormField(
                label: "Email",
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: emailController,
                errorText: viewModel.emailValidationMessage,
              ),
              AppTextFormField(
                label: "Password",
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                obscureText: !viewModel.isPasswordVisible,
                controller: passwordController,
                errorText: viewModel.passwordValidationMessage,
                suffixIcon: formEyePassIcon(
                  onObscurePass: viewModel.togglePasswordVisibility,
                  isVisible: viewModel.isPasswordVisible,
                  theme: theme,
                ),
              ),

              //
              SizedBox(height: pageSize.height * 0.02),
              buildPriBtn(
                theme: theme,
                btnTxt: 'Log In',
                iconPath: Icons.login,
                onAction: viewModel.onApiUserLogin,
                isLoading: viewModel.isLoading,
                isFullWidth: true,
              ),

              //
              SizedBox(height: pageSize.height * 0.01),
              GestureDetector(
                onTap: viewModel.onCreateAccountTapped,
                child: Text.rich(
                  TextSpan(
                    text: 'New Member? ',
                    children: [
                      TextSpan(
                        text: 'Create Account',
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
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}
