import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/ui/widgets/app_animated_counter.dart';
import 'package:mtihani_app/ui/widgets/charts/app_line_chart.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';

import 'class_performance_tab_model.dart';

class ClassPerformanceTab extends StackedView<ClassPerformanceTabModel> {
  final ClassroomModel classroom;

  const ClassPerformanceTab({
    super.key,
    required this.classroom,
  });

  @override
  Widget builder(
    BuildContext context,
    ClassPerformanceTabModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return viewModel.isBusy
        ? buildLoadingWidget(theme, "Fetching class performance data ...")
        : viewModel.hasError || viewModel.data == null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildNoItemsWidget("No class performance available"),
                ],
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildPageAppHeader(
                      theme: theme,
                      iconPath: Icons.trending_up_rounded,
                      pageTitle: "Term Scores",
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        buildScoreCard(
                          theme: theme,
                          label: "Average Term Score",
                          score: viewModel.data!.avg_term_score ?? 0.0,
                        ),
                        AppLineChart(
                          dataSeries: [viewModel.classTermScores],
                          xAxisLabels: viewModel.classTermNames,
                        ),
                      ],
                    ),
                    //
                    buildPageAppHeader(
                      theme: theme,
                      iconPath: Icons.trending_up_rounded,
                      pageTitle: "Mtihani Scores",
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

  Widget buildScoreCard({
    required ThemeData theme,
    required String label,
    required double score,
  }) {
    Color bgColor = theme.colorScheme.primary;
    Color fgColor = theme.colorScheme.onPrimary;
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: fgColor,
            offset: const Offset(4, 4),
            spreadRadius: -1,
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Average",
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: fgColor,
            ),
          ),
          const SizedBox(height: 4),
          AppAnimatedCounter(
            valueToAnimate: score.toInt(),
            postTexts: const [TextSpan(text: "%")],
          )
        ],
      ),
    );
  }
}
