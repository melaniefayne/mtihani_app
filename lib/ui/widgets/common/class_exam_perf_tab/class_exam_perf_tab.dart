import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/widgets/common/performance_widgets.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';

import 'class_exam_perf_tab_model.dart';

class ClassExamPerfTab extends StackedView<ClassExamPerfTabModel> {
  final ExamModel exam;
  const ClassExamPerfTab({super.key, required this.exam});

  @override
  Widget builder(
    BuildContext context,
    ClassExamPerfTabModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    if (exam.status != ExamStatus.complete) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              astImagesWaiting,
              height: pageSize.height * 0.3,
            ),
            SizedBox(height: pageSize.height * 0.02),
            const Text(
              "Exam Analysis will be available after analysis :)",
            ),
          ],
        ),
      );
    }

    if (viewModel.isBusy) {
      return buildLoadingWidget(theme, "Fetching class exam performance");
    }

    if (viewModel.data == null) {
      return const Center(child: Text(errorOopsie));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: ClassExamPerformanceWidget(
        classPerf: viewModel.data!,
        onStrandStudentItemTap: viewModel.onStrandStudentItemTap,
      ),
    );
  }

  @override
  ClassExamPerfTabModel viewModelBuilder(
    BuildContext context,
  ) =>
      ClassExamPerfTabModel(exam);
}
