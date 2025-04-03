import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';

import 'exam_setup_viewmodel.dart';

class ExamSetupView extends StackedView<ExamSetupViewModel> {
  const ExamSetupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ExamSetupViewModel viewModel,
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
              pageTitle: "Set an Exam",
              action: viewModel.onGoToHome,
            ),
            const SizedBox(height: 5),
            buildPriBtn(
              theme: theme,
              btnTxt: 'Set Exam',
              onAction: viewModel.onApiExamSetup,
            )
          ],
        ),
      ),
    );
  }

  @override
  ExamSetupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExamSetupViewModel();
}
