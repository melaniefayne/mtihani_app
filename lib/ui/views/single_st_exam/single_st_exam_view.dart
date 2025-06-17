import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/app_side_bar.dart';
import 'package:mtihani_app/ui/widgets/app_tab_bar.dart';
import 'package:mtihani_app/ui/widgets/common/exam_widgets.dart';
import 'package:mtihani_app/ui/widgets/common/single_cluster_tab/single_cluster_tab.dart';
import 'package:mtihani_app/ui/widgets/common/st_exam_answers_list/st_exam_answers_list.dart';
import 'package:mtihani_app/ui/widgets/common/student_exam_perf_tab/student_exam_perf_tab.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';

import 'single_st_exam_viewmodel.dart';

class SingleStExamView extends StackedView<SingleStExamViewModel> {
  const SingleStExamView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SingleStExamViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    if (viewModel.exam == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return AppSideBarScaffold(
      pageTitle: viewModel.isStudent
          ? "Exam ${viewModel.exam?.code ?? '--'}"
          : "Exam ${viewModel.exam?.code ?? '--'}: ${viewModel.examSession?.session?.student_name ?? "--"}",
      trailingWidget: buildExamStatusDot(theme, viewModel.exam!.status!),
      tabItems: [
        TabViewItem(
          label: "Performance",
          icon: Icons.trending_up,
          widget: viewModel.isExamComplete
              ? viewModel.examSession?.session == null
                  ? const Center(child: Text(errorOopsie))
                  : StudentExamPerfTab(
                      examSession: viewModel.examSession!.session!,
                    )
              : buildBeforeExamComplete(
                  pageSize: pageSize,
                  title: 'Student Performance Cluster',
                ),
        ),
        TabViewItem(
          label: "Answer Sheet",
          icon: Icons.list_alt,
          widget: viewModel.isLoading
              ? buildLoadingWidget(theme, "Fetching answers ...")
              : StExamAnswersList(
                  answers: viewModel.sessionQAList,
                  onEditAnswerScore:
                      viewModel.isTeacher ? viewModel.onEditStudentScore : null,
                ),
        ),
        TabViewItem(
          label: "Follow Up",
          icon: Icons.reply,
          widget: viewModel.isExamComplete
              ? viewModel.isLoading
                  ? buildLoadingWidget(theme, "Fetching answers ...")
                  : viewModel.examSession?.session == null
                      ? const Center(child: Text(errorOopsie))
                      : SingleClusterTab(
                          examSession: viewModel.examSession!.session!,
                        )
              : buildBeforeExamComplete(
                  pageSize: pageSize,
                  title: 'Student Follow Up Quiz',
                ),
        ),
      ],
    );
  }

  Widget buildBeforeExamComplete({
    required Size pageSize,
    required String title,
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            astImagesWaiting,
            height: pageSize.height * 0.3,
          ),
          SizedBox(height: pageSize.height * 0.02),
          Text(
            "$title will be available after analysis :)",
          ),
        ],
      ),
    );
  }

  @override
  SingleStExamViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingleStExamViewModel();

  @override
  void onViewModelReady(SingleStExamViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.onSingleStExamViewReady();
  }

  @override
  void onDispose(SingleStExamViewModel viewModel) {
    viewModel.onDispose();
    super.onDispose(viewModel);
  }
}
