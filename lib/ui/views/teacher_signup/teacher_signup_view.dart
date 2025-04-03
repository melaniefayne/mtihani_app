import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  TeacherSignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TeacherSignupViewModel();
}
