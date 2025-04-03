import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';

import 'teacher_signup_viewmodel.dart';

class TeacherSignupView extends StackedView<TeacherSignupViewModel> {
  const TeacherSignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TeacherSignupViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(pageSize.width * 0.04),
        child: Column(
          children: [
            buildPageTitle(
              theme: theme,
              pageTitle: "Create An Account",
            ),
            const SizedBox(height: 5),
            buildPriBtn(
              theme: theme,
              btnTxt: 'Sign Up',
              onAction: viewModel.onApiTeacherSignUp,
            )
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
}
