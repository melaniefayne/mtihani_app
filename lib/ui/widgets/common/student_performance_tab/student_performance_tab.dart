import 'package:flutter/material.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/ui/widgets/app_animated_counter.dart';
import 'package:mtihani_app/ui/widgets/charts/app_line_chart.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';

import 'student_performance_tab_model.dart';

class StudentPerformanceTab extends StackedView<StudentPerformanceTabModel> {
  final StudentModel student;
  const StudentPerformanceTab({super.key, required this.student});

  @override
  Widget builder(
    BuildContext context,
    StudentPerformanceTabModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          viewModel.student.term_scores == null || student.term_scores!.isEmpty
              ? buildNoItemsWidget("No available term scores")
              : buildPageSectionScaffold(
                  theme: theme,
                  iconPath: Icons.calendar_today,
                  title: "Term Scores",
                  headerTrailing: AppAnimatedCounter(
                    preTexts: const [
                      TextSpan(
                          text: "Average Score: ",
                          style: TextStyle(fontWeight: FontWeight.w500))
                    ],
                    postTexts: const [TextSpan(text: "%")],
                    startValue: 0,
                    valueToAnimate: (student.avg_score ?? 0.0).toInt(),
                  ),
                  children: [
                    AppLineChart(
                      dataSeries: [viewModel.termScores],
                      xAxisLabels: viewModel.termNames,
                      tipPostText: "%",
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  @override
  StudentPerformanceTabModel viewModelBuilder(
    BuildContext context,
  ) =>
      StudentPerformanceTabModel(student);
}
