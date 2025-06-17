import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/widgets/common/exam_question_list/exam_question_list.dart';
import 'package:mtihani_app/ui/widgets/common/exam_widgets.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';

import 'single_cluster_tab_model.dart';

class SingleClusterTab extends StackedView<SingleClusterTabModel> {
  final StudentExamSessionModel examSession;
  const SingleClusterTab({super.key, required this.examSession});

  @override
  Widget builder(
    BuildContext context,
    SingleClusterTabModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    if ((examSession.status) != getExamStatusStr(ExamStatus.complete)) {
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
              "Performance Clusters will be available after analysis :)",
            ),
          ],
        ),
      );
    }

    if (viewModel.isBusy) {
      return buildLoadingWidget(
          theme, "Fetching student's performance cluster");
    }

    if (viewModel.data == null) {
      return const Center(child: Text(errorOopsie));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeaderWidget(
            theme: theme,
            title: "Student Cluster",
            leadingWidget: const Icon(Icons.group),
          ),
          buildClusterCard(cluster: viewModel.data!),

          //
          SizedBox(height: pageSize.height * 0.02),
          if (viewModel.data?.follow_up_exam_id != null)
            ExamQuestionList(
              key: ValueKey(viewModel.data?.follow_up_exam_id),
              exam: ExamModel(
                id: viewModel.data!.follow_up_exam_id,
              ),
              title: "Follow Up Quiz",
              downloadAction: viewModel.onDownloadClusterQuiz,
            ),
        ],
      ),
    );
  }

  @override
  SingleClusterTabModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingleClusterTabModel(examSession);
}
