import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'exam_responses_list_model.dart';

class ExamResponsesList extends StackedView<ExamResponsesListModel> {
  const ExamResponsesList({super.key});

  @override
  Widget builder(
    BuildContext context,
    ExamResponsesListModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  ExamResponsesListModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExamResponsesListModel();
}
