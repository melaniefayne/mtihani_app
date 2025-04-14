import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/views/single_exam/exam_details.dart';
import 'package:mtihani_app/ui/views/single_exam/exam_performance/exam_performance.dart';
import 'package:mtihani_app/ui/views/single_exam/exam_responses.dart';
import 'package:mtihani_app/ui/widgets/app_tab_bar.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/ui/widgets/model_widgets/exam_widgets.dart';
import 'package:stacked/stacked.dart';

import 'single_exam_viewmodel.dart';

class SingleExamView extends StackedView<SingleExamViewModel> {
  final ExamModel examItem;
  const SingleExamView({Key? key, required this.examItem}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SingleExamViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return buildAppPageScaffold(
      theme: theme,
      pageSize: pageSize,
      pageTitle: "Exam ${examItem.code ?? '--'}",
      trailing: buildExamStatus(
        theme,
        examItem.status ?? "--",
        iconSize: 24,
        txtStyle: theme.textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        AppTabBar(
          tabs: [
            TabViewItem(
              label: "Performance",
              icon: Icons.trending_up,
              widget: ExamPerformanceWidget(examItem: examItem),
            ),
            TabViewItem(
              label: "Responses",
              icon: Icons.group,
              widget: ExamResponsesWidget(examItem: examItem),
            ),
            TabViewItem(
              label: "Details",
              icon: FontAwesomeIcons.scroll,
              widget: ExamDetailsWidget(
                examItem: examItem,
                onEditExamTime: viewModel.onEditExamTime,
                onDateTimesSelected: viewModel.onDateTimesSelected,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  SingleExamViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingleExamViewModel(examItem);
}
