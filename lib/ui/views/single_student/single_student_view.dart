import 'package:flutter/material.dart';
import 'package:mtihani_app/models/student.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';

import 'single_student_viewmodel.dart';

class SingleStudentView extends StackedView<SingleStudentViewModel> {
  final StudentModel studentItem;
  const SingleStudentView({Key? key, required this.studentItem})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SingleStudentViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return buildAppPageScaffold(
      theme: theme,
      pageSize: pageSize,
      pageTitle: "Student ${studentItem.code ?? '--'}",
      trailing: buildPriBtn(
        theme: theme,
        btnTxt: "Edit Student",
        onAction: () {},
      ),
      children: [],
    );
  }

  @override
  SingleStudentViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingleStudentViewModel(studentItem);
}
