import 'package:flutter/material.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:stacked/stacked.dart';

import 'single_st_class_viewmodel.dart';

class SingleStClassView extends StackedView<SingleStClassViewModel> {
  final ClassroomModel classroom;
  const SingleStClassView({Key? key, required this.classroom})
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
      SingleStClassViewModel(classroom);
}
