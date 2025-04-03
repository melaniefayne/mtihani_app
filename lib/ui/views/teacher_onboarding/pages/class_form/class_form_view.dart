import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';

import 'class_form_viewmodel.dart';

class ClassFormView extends StackedView<ClassFormViewModel> {
  const ClassFormView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ClassFormViewModel viewModel,
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
              pageTitle: "Create A Class",
              action: viewModel.onGoToHome,
            ),
            const SizedBox(height: 5),
            buildPriBtn(
              theme: theme,
              btnTxt: 'Create a Class',
              onAction: viewModel.onApiClassCreate,
            )
          ],
        ),
      ),
    );
  }

  @override
  ClassFormViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ClassFormViewModel();
}
