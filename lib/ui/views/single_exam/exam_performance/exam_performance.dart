import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/views/exam_list/exam_list_view.dart';
import 'package:mtihani_app/ui/widgets/app_collapsible_bar.dart';
import 'package:mtihani_app/ui/widgets/app_tab_bar.dart';
import 'package:stacked/stacked.dart';

import 'exam_performance_model.dart';

class ExamPerformanceWidget extends StackedView<ExamPerformanceWidgetModel> {
  final ExamModel? examItem;
  final ClassModel? classItem;
  const ExamPerformanceWidget({
    super.key,
    this.examItem,
    this.classItem,
  });

  @override
  Widget builder(
    BuildContext context,
    ExamPerformanceWidgetModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    return (viewModel.isExamView || viewModel.isClassView)
        ? viewModel.showWaitingWidget
            ? buildWaitingWidget(pageSize.height)
            : AppCollapsibleScaffold(
                tabs: [
                  TabViewItem(
                    label: "Student Analysis",
                    icon: Icons.group,
                    widget: Center(
                      child: Text(
                        "Student Analysis coming soon ...",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ),
                  TabViewItem(
                    label: "Strand Analysis",
                    icon: Icons.category,
                    widget: const Center(
                      child: Text("Strand Analysis coming soon ..."),
                    ),
                  ),
                  TabViewItem(
                    label: "Bloom Skill Analysis",
                    icon: FontAwesomeIcons.brain,
                    widget: const Center(
                      child: Text("Bloom Skill Analysis coming soon ..."),
                    ),
                  ),
                ],
              )
        : const SizedBox.shrink();
  }

  @override
  ExamPerformanceWidgetModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExamPerformanceWidgetModel(examItem, classItem);
}
