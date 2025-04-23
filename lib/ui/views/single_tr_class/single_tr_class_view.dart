import 'package:flutter/material.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';

import 'single_tr_class_viewmodel.dart';

class SingleTrClassView extends StackedView<SingleTrClassViewModel> {
  final ClassroomModel classroom;
  const SingleTrClassView({Key? key, required this.classroom})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SingleTrClassViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return buildAppPageScaffold(
      theme: theme,
      pageTitle: "Grade ${classroom.name ?? '--'}",
      pageSize: pageSize,
      children: [],
    );
  }

  @override
  SingleTrClassViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingleTrClassViewModel(classroom);
}
