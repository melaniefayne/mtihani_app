import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/widgets/app_side_bar.dart';
import 'package:mtihani_app/ui/widgets/app_tab_bar.dart';
import 'package:mtihani_app/ui/widgets/common/exam_widgets.dart';
import 'package:mtihani_app/ui/widgets/common/st_exam_answers_list/st_exam_answers_list.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
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
          widget: const Center(child: Text("Coming Soon ...")),
        ),
        TabViewItem(
          label: "Answer Sheet",
          icon: Icons.list_alt,
          widget: viewModel.isFetchingExamSession || viewModel.isLoading
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
          widget: const Center(child: Text("Coming Soon ...")),
        ),
      ],
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
