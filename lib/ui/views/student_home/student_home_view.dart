import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'student_home_viewmodel.dart';

class StudentHomeView extends StackedView<StudentHomeViewModel> {
  const StudentHomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StudentHomeViewModel viewModel,
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
  StudentHomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StudentHomeViewModel();
}
