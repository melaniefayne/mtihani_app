import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/ui/widgets/app_animated_counter.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/charts/app_grid_chart.dart';
import 'package:mtihani_app/ui/widgets/charts/app_line_chart.dart';
import 'package:mtihani_app/ui/widgets/common/performance_widgets.dart';
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
    final pageSize = MediaQuery.sizeOf(context);

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
          //
          SizedBox(height: pageSize.height * 0.01),
          buildHeaderWidget(
            theme: theme,
            title: "Mtihani Average Performance",
            leadingWidget: const Icon(Icons.insights),
          ),
          viewModel.isFetchingClassAvgPerf
              ? buildLoadingWidget(
                  theme, "Fetching average class performance ...")
              : viewModel.classAvgPerf == null
                  ? buildNoItemsWidget(
                      "No mtihani averages available. Create an exam to get in-depth insights!")
                  : Column(
                      children: [
                        //
                        buildAvgScoreSection(
                          theme: theme,
                          pageSize: pageSize,
                          avgScore: viewModel.classAvgPerf!.avg_score,
                          avgExpectationLevel:
                              viewModel.classAvgPerf!.avg_expectation_level,
                          otherScores:
                              viewModel.classAvgPerf!.bloom_skill_scores,
                        ),

                        //
                        buildHeaderWidget(
                          theme: theme,
                          title: "Grade Performance",
                          leadingWidget: const Icon(FontAwesomeIcons.stairs),
                        ),
                        AppGridChart(
                          dataSeries: viewModel.gradeScores,
                          chartLabels: viewModel.gradeNames,
                          cardIcons: viewModel.gradeIcons,
                          showPercentages: false,
                          valuePostfix: '%',
                          crossCount: 1,
                          cardAspectRatio: 10,
                        ),

                        //
                        if ((viewModel.classAvgPerf!.strand_analysis ?? [])
                            .isNotEmpty)
                          buildPerfSection(
                            theme: theme,
                            pageSize: pageSize,
                            children: [
                              AppPageFilters(
                                fullWidth: pageSize.width * 0.8,
                                filters: [
                                  AppFilterItem(
                                    label: "Strand",
                                    selectedValue: viewModel.selectedStrand,
                                    onChanged: (val) {
                                      viewModel.onChangeStrand(val);
                                    },
                                    items: viewModel
                                        .classAvgPerf!.strand_analysis!
                                        .map<
                                                DropdownMenuItem<
                                                    StrandPerformanceModel>>(
                                            (StrandPerformanceModel value) {
                                      return DropdownMenuItem<
                                          StrandPerformanceModel>(
                                        value: value,
                                        child: Text(value.name ?? '--'),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                              Container(
                                color: theme.colorScheme.primaryContainer,
                                padding: const EdgeInsets.all(16),
                                child: viewModel.selectedStrand == null
                                    ? const Center(
                                        child: Text(
                                            "Select a strand to view it's analysis",
                                            textAlign: TextAlign.center),
                                      )
                                    : StrandPerformanceWidget(
                                        key: ValueKey(
                                            viewModel.selectedStrand!.name),
                                        strandData: viewModel.selectedStrand!,
                                      ),
                              ),
                            ],
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
