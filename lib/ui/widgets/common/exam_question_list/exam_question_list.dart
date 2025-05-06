import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:stacked/stacked.dart';

import 'exam_question_list_model.dart';

class ExamQuestionList extends StackedView<ExamQuestionListModel> {
  final ExamModel exam;
  const ExamQuestionList({super.key, required this.exam});

  @override
  Widget builder(
    BuildContext context,
    ExamQuestionListModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  ExamQuestionListModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExamQuestionListModel(exam);
}
