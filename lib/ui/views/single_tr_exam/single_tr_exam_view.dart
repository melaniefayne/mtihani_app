import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'single_tr_exam_viewmodel.dart';

class SingleTrExamView extends StackedView<SingleTrExamViewModel> {
  const SingleTrExamView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SingleTrExamViewModel viewModel,
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
  SingleTrExamViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingleTrExamViewModel();
}
