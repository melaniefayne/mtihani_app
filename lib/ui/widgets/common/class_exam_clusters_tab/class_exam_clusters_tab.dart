import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/widgets/app_carousel.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/charts/app_bar_chart.dart';
import 'package:mtihani_app/ui/widgets/charts/app_linear_percent_chart.dart';
import 'package:mtihani_app/ui/widgets/common/exam_question_list/exam_question_list.dart';
import 'package:mtihani_app/ui/widgets/common/performance_widgets.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';

import 'class_exam_clusters_tab_model.dart';

class ClassExamClustersTab extends StackedView<ClassExamClustersTabModel> {
  final ExamModel exam;
  const ClassExamClustersTab({super.key, required this.exam});

  @override
  Widget builder(
    BuildContext context,
    ClassExamClustersTabModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    const String chartTxt =
        "Select a strand to view it's sub strand score distribution";

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
              "Performance Clusters will be available after analysis :)",
            ),
          ],
        ),
      );
    }

    if (viewModel.isBusy) {
      return buildLoadingWidget(theme, "Fetching performance clusters");
    }

    if (viewModel.data == null) {
      return const Center(
        child: Text(
            "Oops, something went wrong on our side! Please try again later"),
      );
    }

    if (viewModel.data!.isEmpty) {
      return buildNoItemsWidget("No clusters available for this exam");
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCarousel(
            children: viewModel.data!
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CompactInfoCard(
                      title: e.cluster_label ?? "--",
                      iconPath: Icons.group_outlined,
                      width: pageSize.width / 3.3,
                      bgColor: kcLightGrey,
                      infoItems: [
                        {
                          "name": "Student Count",
                          "value": "${e.cluster_size ?? 0}",
                        },
                        {
                          "name": "Avg. Score",
                          "value": "${e.avg_score ?? 0.0}%",
                        },
                        {
                          "name": "Best Strand",
                          "value":
                              "${e.strand_scores?.first.name ?? "--"}: ${e.strand_scores?.first.percentage ?? "--"}%",
                        },
                        {
                          "name": "Worst Strand",
                          "value":
                              "${e.strand_scores?.last.name ?? "--"}: ${e.strand_scores?.last.percentage ?? "--"}%",
                        },
                        {
                          "name": "Best Skill",
                          "value":
                              "${e.bloom_skill_scores?.first.name ?? "--"}: ${e.bloom_skill_scores?.first.percentage ?? "--"}%",
                        },
                        {
                          "name": "Worst Skill",
                          "value":
                              "${e.bloom_skill_scores?.last.name ?? "--"}: ${e.bloom_skill_scores?.last.percentage ?? "--"}%",
                        },
                      ],
                    ),
                  ),
                )
                .toList(),
          ),

          //
          SizedBox(height: pageSize.height * 0.02),
          AppPageFilters(
            filters: [
              AppFilterItem(
                label: "Cluster",
                selectedValue: viewModel.selectedCluster,
                onChanged: (val) {
                  viewModel.onChangeSelectedCluster(val);
                },
                items: viewModel.data!
                    .map<DropdownMenuItem<ClassExamPerfClusterModel>>(
                        (ClassExamPerfClusterModel value) {
                  return DropdownMenuItem<ClassExamPerfClusterModel>(
                    value: value,
                    child: Text(value.cluster_label ?? "--"),
                  );
                }).toList(),
              ),
            ],
          ),

          //
          if (viewModel.selectedCluster != null)
            Column(
              children: [
                buildHeaderWidget(
                  theme: theme,
                  title: "Summary",
                  leadingWidget: const Icon(Icons.insights),
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    buildAvgScoreSection(
                      theme: theme,
                      pageSize: pageSize,
                      avgScore: viewModel.selectedCluster!.avg_score,
                      avgExpectationLevel:
                          viewModel.selectedCluster!.avg_expectation_level,
                      otherScores:
                          viewModel.selectedCluster!.bloom_skill_scores,
                    ),
                    ScoreVarianceCard(
                        variance: viewModel.selectedCluster!.score_variance),
                  ],
                ),

                //
                buildHeaderWidget(
                  theme: theme,
                  title: "Strand Performance",
                  leadingWidget: const Icon(Icons.folder),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: pageSize.width * 0.3,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            chartTxt,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodySmall,
                          ),
                          AppLinearPercentChart(
                            showPercentages: false,
                            indicatorPostfix: '%',
                            dataSeries:
                                (viewModel.selectedCluster!.strand_scores ?? [])
                                    .map((e) => e.percentage?.toDouble() ?? 0.0)
                                    .toList(),
                            chartLabels:
                                (viewModel.selectedCluster!.strand_scores ?? [])
                                    .map((e) => e.name?.toString() ?? "--")
                                    .toList(),
                            onChartTileTap: viewModel.onStrandTap,
                            selectedTile: viewModel.selectedStrand?.name,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: viewModel.selectedStrand == null
                          ? const Center(
                              child: Text(
                                chartTxt,
                                textAlign: TextAlign.center,
                              ),
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  viewModel.selectedStrand!.name,
                                  style: theme.textTheme.titleMedium,
                                ),
                                AppBarChart(
                                  seriesColors: [theme.primaryColor],
                                  dataSeries: [
                                    (viewModel.selectedStrand!.sub_strands ??
                                            [])
                                        .map((e) =>
                                            e.percentage?.toDouble() ?? 0.0)
                                        .toList()
                                  ],
                                  xAxisLabels:
                                      (viewModel.selectedStrand!.sub_strands ??
                                              [])
                                          .map((e) => e.name.toString())
                                          .toList(),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),

                //
                SizedBox(height: pageSize.height * 0.01),
                CompactInfoCard(
                  title: "Student Listing",
                  iconPath: Icons.person,
                  onInfoItemTap: viewModel.onClusterViewExamSession,
                  infoItems: (viewModel.selectedCluster!.student_sessions ?? [])
                      .map((e) => {
                            "name": e.student_name ?? "--",
                            "value":
                                "${e.avg_score}% • ${(e.avg_expectation_level ?? "Below")[0].toUpperCase()}E",
                          })
                      .toList(),
                ),

                //
                SizedBox(height: pageSize.height * 0.01),
                if (viewModel.selectedCluster?.follow_up_exam_id != null) ...[
                  ExamQuestionList(
                    key: ValueKey(viewModel.selectedCluster?.follow_up_exam_id),
                    exam: ExamModel(
                      id: viewModel.selectedCluster!.follow_up_exam_id,
                    ),
                    title: "Follow Up Quiz",
                    downloadAction: viewModel.onDownloadClusterQuiz,
                  ),
                ],
              ],
            ),
        ],
      ),
    );
  }

  @override
  ClassExamClustersTabModel viewModelBuilder(
    BuildContext context,
  ) =>
      ClassExamClustersTabModel(exam);
}
