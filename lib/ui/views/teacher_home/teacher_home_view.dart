import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'teacher_home_viewmodel.dart';

class TeacherHomeView extends StackedView<TeacherHomeViewModel> {
  const TeacherHomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TeacherHomeViewModel viewModel,
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
  TeacherHomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TeacherHomeViewModel();
}
