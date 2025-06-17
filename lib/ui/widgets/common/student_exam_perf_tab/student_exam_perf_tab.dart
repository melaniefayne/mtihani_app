import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/ui/widgets/charts/app_bar_chart.dart';
import 'package:mtihani_app/ui/widgets/charts/app_grid_chart.dart';
import 'package:mtihani_app/ui/widgets/charts/app_linear_percent_chart.dart';
import 'package:mtihani_app/ui/widgets/common/exam_widgets.dart';
import 'package:mtihani_app/ui/widgets/common/performance_widgets.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';

import 'student_exam_perf_tab_model.dart';

class StudentExamPerfTab extends StackedView<StudentExamPerfTabModel> {
  final StudentExamSessionModel examSession;
  const StudentExamPerfTab({super.key, required this.examSession});

  @override
  Widget builder(
    BuildContext context,
    StudentExamPerfTabModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    if ((examSession.status) != getExamStatusStr(ExamStatus.complete)) {
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
              "Overall Performance will be available after analysis :)",
            ),
          ],
        ),
      );
    }

    if (viewModel.isBusy) {
      return buildLoadingWidget(theme, "Fetching student's performance");
    }

    if (viewModel.hasError) {
      return const Center(child: Text(errorOopsie));
    }

    StudentExamSessionPerformanceModel studentPerf = viewModel.data!;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          buildWhiteCard(
            theme,
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "${studentPerf.completion_rate?.toString() ?? '--'}%",
                      style: theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor),
                    ),
                    const TextSpan(text: " Completion Rate"),
                    TextSpan(
                        text:
                            " (${studentPerf.questions_answered}/${(studentPerf.questions_unanswered ?? 0) + (studentPerf.questions_answered ?? 0)})"),
                  ],
                ),
              ),
            ),
          ),

          //
          buildAvgScoreSection(
            theme: theme,
            pageSize: pageSize,
            avgScore: studentPerf.avg_score,
            avgExpectationLevel: studentPerf.avg_expectation_level,
            otherScores: studentPerf.bloom_skill_scores,
            classAvgDiff: studentPerf.class_avg_difference,
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
          buildPerfSection(
            theme: theme,
            pageSize: pageSize,
            title: "Strand Scores",
            iconPath: Icons.folder_copy,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: pageSize.width * 0.3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Select a strand to view the student's sub-strand score distribution",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall,
                        ),
                        AppLinearPercentChart(
                          dataSeries: viewModel.strandScores,
                          chartLabels: viewModel.strandNames,
                          leadingWidgets: viewModel.strandIcons
                              .map((e) => Icon(e))
                              .toList(),
                          onChartTileTap: viewModel.onStrandTap,
                          selectedTile: viewModel.selectedStrandName,
                          indicatorPostfix: '%',
                        ),
                      ],
                    ),
                  ),
                  buildVerticalDivider(pageSize),
                  SizedBox(
                    width: pageSize.width * 0.43,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 10,
                            top: pageSize.height * 0.05),
                        child: viewModel.subStrandValues.isEmpty
                            ? const Center(
                                child: Text(
                                  "Select a strand to view it's sub-strand distribution",
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : AppBarChart(
                                dataSeries: [viewModel.subStrandValues],
                                xAxisLabels: viewModel.subStrandLabels,
                                seriesColors: [theme.primaryColor],
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          //
          if ((studentPerf.best_5_answers ?? []).isNotEmpty)
            buildAnswersListSection(
              theme: theme,
              title: "Best 5 Answers",
              answers: studentPerf.best_5_answers!,
            ),
          if ((studentPerf.worst_5_answers ?? []).isNotEmpty)
            buildAnswersListSection(
              theme: theme,
              title: "Last 5 Answers",
              answers: studentPerf.worst_5_answers!,
            ),
        ],
      ),
    );
  }

  buildAnswersListSection({
    required ThemeData theme,
    required String title,
    required List<StudentAnswerModel> answers,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildHeaderWidget(
          theme: theme,
          title: title,
          leadingWidget: const Icon(FontAwesomeIcons.comment),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: answers.length,
          itemBuilder: (context, idx) {
            StudentAnswerModel answer = answers[idx];
            return ExamQuestionCard(
              question: ExamQuestionModel(
                description: answer.question_description,
                expected_answer: answer.expected_answer,
                strand: answer.strand,
                sub_strand: answer.sub_strand,
                grade: answer.grade,
                number: answer.question_number,
                bloom_skill: answer.bloom_skill,
              ),
              answer: answer,
            );
          },
        ),
      ],
    );
  }

  @override
  StudentExamPerfTabModel viewModelBuilder(
    BuildContext context,
  ) =>
      StudentExamPerfTabModel(examSession);
}
