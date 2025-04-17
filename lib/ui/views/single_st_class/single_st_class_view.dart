import 'package:flutter/material.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:stacked/stacked.dart';

import 'single_st_class_viewmodel.dart';

class SingleStClassView extends StackedView<SingleStClassViewModel> {
  final StudentClassModel studentClassroom;
  const SingleStClassView({Key? key, required this.studentClassroom})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SingleStClassViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return const Material(
      child: Text("SingleStClassView"),
    );
  }

  @override
  SingleStClassViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingleStClassViewModel(studentClassroom);
}
