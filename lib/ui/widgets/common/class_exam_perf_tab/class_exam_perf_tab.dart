import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/icon_mapper.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/app_text_carousel.dart';
import 'package:mtihani_app/ui/widgets/charts/app_bar_chart.dart';
import 'package:mtihani_app/ui/widgets/charts/app_grid_chart.dart';
import 'package:mtihani_app/ui/widgets/charts/app_heat_map.dart';
import 'package:mtihani_app/ui/widgets/charts/app_pie_donut_chart.dart';
import 'package:mtihani_app/ui/widgets/common/performance_widgets.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';

import 'class_exam_perf_tab_model.dart';

class ClassExamPerfTab extends StackedView<ClassExamPerfTabModel> {
  final ExamModel exam;
  const ClassExamPerfTab({super.key, required this.exam});

  @override
  Widget builder(
    BuildContext context,
    ClassExamPerfTabModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    if (exam.status != ExamStatus.complete) {
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
              "Exam Analysis will be available after grading :)",
            ),
          ],
        ),
      );
    }

    if (viewModel.isBusy) {
      return buildLoadingWidget(theme, "Fetching class exam performance");
    }

    if (viewModel.data == null) {
      return const Center(
        child: Text(
            "Oops, something went wrong on our side! Pleasw try again later"),
      );
    }
    ClassExamPerformanceModel classPerf = viewModel.data!;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              buildWhiteCard(
                theme,
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: classPerf.student_count?.toString() ?? "--",
                          style: theme.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.primaryColor),
                        ),
                        const TextSpan(text: " Students"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          //
          buildAvgScoreSection(
            theme: theme,
            pageSize: pageSize,
            avgScore: classPerf.avg_score,
            avgExpectationLevel: classPerf.avg_expectation_level,
            otherScores: classPerf.bloom_skill_scores,
          ),

          //
          buildScoreDistSection(
            theme: theme,
            pageSize: pageSize,
            classPerf: classPerf,
          ),

          //
          buildStrandOverviewSection(
            theme: theme,
            pageSize: pageSize,
            classPerf: classPerf,
          ),

          //
          if ((viewModel.data!.strand_analysis ?? []).isNotEmpty)
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
                      items: viewModel.data!.strand_analysis!
                          .map<DropdownMenuItem<StrandPerformanceModel>>(
                              (StrandPerformanceModel value) {
                        return DropdownMenuItem<StrandPerformanceModel>(
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
                          child: Text("Select a strand to view it's analysis",
                              textAlign: TextAlign.center),
                        )
                      : StrandPerformanceWidget(
                          key: ValueKey(viewModel.selectedStrand!.name),
                          strandData: viewModel.selectedStrand!,
                          onInfoItemTap: viewModel.onStrandStudentItemTap,
                        ),
                ),
              ],
            ),

          if ((viewModel.data!.flagged_sub_strands ?? []).isNotEmpty)
            buildPerfSection(
              theme: theme,
              pageSize: pageSize,
              title: "Interesting correlations",
              iconPath: Icons.compare_arrows,
              children: viewModel.data!.flagged_sub_strands!
                  .map(
                    (e) => FlaggedSubStrandCard(model: e),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }

  Widget buildScoreDistSection({
    required ThemeData theme,
    required Size pageSize,
    required ClassExamPerformanceModel classPerf,
  }) {
    List<double> scoreCounts = (classPerf.score_distribution ?? [])
        .map((e) => (e.count ?? 0).toDouble())
        .toList();
    List<String> countLabels = (classPerf.score_distribution ?? [])
        .map((e) => (e.name.toString()))
        .toList();

    List<double> levelCounts = (classPerf.expectation_level_distribution ?? [])
        .map((e) => (e.count ?? 0).toDouble())
        .toList();
    List<String> levelLabels = (classPerf.expectation_level_distribution ?? [])
        .map((e) => (e.name.toString()))
        .toList();

    List<double> gradeScores = (classPerf.grade_scores ?? [])
        .map((e) => (e.percentage ?? 0).toDouble())
        .toList();
    List<String> gradeNames = (classPerf.grade_scores ?? [])
        .map((e) => ("Grade ${e.name.toString()}"))
        .toList();
    List<IconData> gradeIcons =
        gradeNames.map((e) => (appIconMapper[e] ?? Icons.category)).toList();

    return buildPerfSection(
      theme: theme,
      pageSize: pageSize,
      title: "Average Score Analysis",
      iconPath: Icons.analytics_outlined,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            AppBarChart(
              chartHeight: pageSize.height * 0.3,
              dataSeries: [scoreCounts],
              xAxisLabels: countLabels,
              chartTitle: 'Avg. Score Distribution',
              seriesColors: const [kcDarkGreyColor],
            ),
            ScoreVarianceCard(variance: classPerf.score_variance),
          ],
        ),
        AppTextCarousel(
          title: 'Insights',
          texts: classPerf.general_insights ?? [],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: pageSize.width * 0.4,
              child: AppGridChart(
                chartTitle: 'Grade Performance',
                dataSeries: gradeScores,
                chartLabels: gradeNames,
                cardIcons: gradeIcons,
                showPercentages: false,
                valuePostfix: '%',
                crossCount: 1,
                cardAspectRatio: 7,
              ),
            ),
            Expanded(
              child: AppPieDonutChart(
                dataSeries: levelCounts,
                pieLabels: levelLabels,
                chartTitle: 'Avg. Expectation Level Distribution',
                chartDirection: Axis.horizontal,
                pieColors: defaultChartColors.reversed.toList(),
                onPieColors: defaultChartColors.reversed
                    .toList()
                    .map((e) => defaultTextChartColors[e] ?? Colors.white)
                    .toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStrandOverviewSection({
    required ThemeData theme,
    required Size pageSize,
    required ClassExamPerformanceModel classPerf,
  }) {
    const double spacing = 0.04;
    List<double> strandScores = (classPerf.strand_analysis ?? [])
        .map((e) => (e.avg_score ?? 0).toDouble())
        .toList();
    List<String> strandNames = (classPerf.strand_analysis ?? [])
        .map((e) => (e.name.toString()))
        .toList();
    List<IconData> strandIcons = strandNames
        .map(
            (e) => (appIconMapper[e.split('(').first.trim()] ?? Icons.category))
        .toList();

    return buildPerfSection(
      theme: theme,
      pageSize: pageSize,
      title: "Strand Performance",
      iconPath: Icons.folder_copy,
      children: [
        buildSubTitle(
          theme: theme,
          title: "Overview",
          subtitle: "Average scores for all strands tested in syllabus order",
        ),
        AppGridChart(
          dataSeries: strandScores,
          chartLabels: strandNames,
          cardIcons: strandIcons,
          showPercentages: false,
          crossCount: 3,
          valuePostfix: '%',
        ),

        //
        SizedBox(height: pageSize.height * spacing),
        buildSubTitle(
          theme: theme,
          title: "Student Mastery",
          subtitle:
              "The top and bottom percentile students across all strands at a glance",
        ),
        AppHeatMap(
          yValues: classPerf.strand_student_mastery?.strands ?? [],
          xValues: (classPerf.strand_student_mastery?.students ?? [])
              .map((e) => e.name.toString())
              .toList(),
          values: (classPerf.strand_student_mastery?.students ?? [])
              .map((e) => e.scores ?? [])
              .toList(),
          yTitle: 'Students',
        ),
      ],
    );
  }

  @override
  ClassExamPerfTabModel viewModelBuilder(
    BuildContext context,
  ) =>
      ClassExamPerfTabModel(exam);
}
