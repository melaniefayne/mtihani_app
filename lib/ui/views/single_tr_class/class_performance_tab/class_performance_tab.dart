import 'package:flutter/material.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/ui/widgets/app_animated_counter.dart';
import 'package:mtihani_app/ui/widgets/charts/app_line_chart.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';
import 'class_performance_tab_model.dart';

class ClassPerformanceTab extends StackedView<ClassPerformanceTabModel> {
  final ClassroomModel classroom;

  const ClassPerformanceTab({super.key, required this.classroom});

  @override
  Widget builder(
    BuildContext context,
    ClassPerformanceTabModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          viewModel.isFetchingTermScores
              ? buildLoadingWidget(theme, "Fetching term scores ...")
              : viewModel.classAvgTermScores.isEmpty
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
                        valueToAnimate: classroom.avg_term_score ?? 0.0,
                      ),
                      children: [
                        AppLineChart(
                          dataSeries: [viewModel.classTermScores],
                          xAxisLabels: viewModel.classTermNames,
                          tipPostText: "%",
                        ),
                      ],
                    ),
        ],
      ),
    );
  }

  @override
  ClassPerformanceTabModel viewModelBuilder(
    BuildContext context,
  ) =>
      ClassPerformanceTabModel(classroom);
}
