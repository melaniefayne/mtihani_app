import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/widgets/app_side_bar.dart';
import 'package:mtihani_app/ui/widgets/app_tab_bar.dart';
import 'package:mtihani_app/ui/widgets/common/class_exam_perf_tab/class_exam_perf_tab.dart';
import 'package:mtihani_app/ui/widgets/common/exam_question_list/exam_question_list.dart';
import 'package:mtihani_app/ui/widgets/common/exam_responses_list/exam_responses_list.dart';
import 'package:mtihani_app/ui/widgets/common/exam_widgets.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
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
    final theme = Theme.of(context);

    if (viewModel.trClassroomExam == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return AppSideBarScaffold(
      pageTitle:
          "Exam ${viewModel.trClassroomExam?.code ?? '--'} (Grade ${viewModel.trClassroomExam?.classroom_name ?? "--"})",
      trailingWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildExamStatusDot(theme, viewModel.trClassroomExam!.status!),
          if (viewModel.trClassroomExam!.status == ExamStatus.upcoming)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: buildPriBtn(
                theme: theme,
                btnTxt: viewModel.isExamPublished
                    ? "Unpublish Exam"
                    : "Publish Exam",
                iconPath: Icons.publish,
                onAction: viewModel.onPublishExam,
              ),
            ),
        ],
      ),
      tabItems: [
        TabViewItem(
          label: "Overall Performance",
          icon: Icons.trending_up,
          widget: ClassExamPerfTab(exam: viewModel.trClassroomExam!),
        ),
        TabViewItem(
          label: "Responses",
          icon: Icons.group,
          widget: ExamResponsesList(exam: viewModel.trClassroomExam!),
        ),
        TabViewItem(
          label: "Questions",
          icon: Icons.list_alt,
          widget: ExamQuestionList(exam: viewModel.trClassroomExam!),
        ),
        TabViewItem(
          label: "Settings",
          icon: Icons.settings,
          widget: ExamConfigTab(
            exam: viewModel.trClassroomExam!,
            onEditExamSchedule: viewModel.onEditExamSchedule,
          ),
        ),
      ],
    );
  }

  @override
  SingleTrExamViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingleTrExamViewModel();

  @override
  void onViewModelReady(SingleTrExamViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.onSingleTrExamViewReady();
  }

  @override
  void onDispose(SingleTrExamViewModel viewModel) {
    viewModel.onDispose();
    super.onDispose(viewModel);
  }
}

class ExamConfigTab extends StatelessWidget {
  final ExamModel exam;
  final Function onEditExamSchedule;
  const ExamConfigTab({
    super.key,
    required this.exam,
    required this.onEditExamSchedule,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localStart = exam.start_date_time!.toLocal();
    final localEnd = exam.end_date_time!.toLocal();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeaderWidget(
          theme: theme,
          title: "Schedule",
          leadingWidget: const Icon(Icons.calendar_today),
        ),
        ListTile(
          onTap: exam.status == ExamStatus.upcoming
              ? () => onEditExamSchedule()
              : null,
          tileColor: theme.cardColor,
          leading: const Icon(Icons.av_timer),
          title: Text.rich(
            TextSpan(
              style: theme.textTheme.bodySmall,
              children: [
                const TextSpan(text: "Day: "),
                TextSpan(
                  text: fullDayDateFormat.format(localStart),
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ),
          subtitle: Text.rich(
            TextSpan(
              style: theme.textTheme.bodySmall,
              children: [
                const TextSpan(text: "Time: "),
                TextSpan(
                  text: timeDateFormat.format(localStart),
                  style: theme.textTheme.titleMedium,
                ),
                const TextSpan(text: " to "),
                TextSpan(
                  text: timeDateFormat.format(localEnd),
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ),
          trailing: buildIconBtn(
            theme: theme,
            iconPath:
                exam.status == ExamStatus.upcoming ? Icons.edit : Icons.check,
          ),
        ),
      ],
    );
  }
}
