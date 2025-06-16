import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/dialogs/exam_question_perf/exam_question_perf_dialog.form.dart';
import 'package:mtihani_app/ui/widgets/app_animated_counter.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/app_search_list.dart';
import 'package:mtihani_app/ui/widgets/charts/app_pie_donut_chart.dart';
import 'package:mtihani_app/ui/widgets/common/exam_widgets.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'exam_question_perf_dialog_model.dart';

@FormView(fields: [
  FormTextField(name: 'studentSearch', validator: formStrValueValidator),
])
class ExamQuestionPerfDialog extends StackedView<ExamQuestionPerfDialogModel>
    with $ExamQuestionPerfDialog {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ExamQuestionPerfDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ExamQuestionPerfDialogModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    final widgetConfig = request.data as Map<String, dynamic>?;
    ExamQuestionModel examQuestion = widgetConfig!['examQuestion'];

    return buildSideDialogScaffold(
      theme: theme,
      pageSize: pageSize,
      iconPath: FontAwesomeIcons.listCheck,
      title: "Question Performance",
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: buildQuestionSummary(
                theme: theme,
                pageSize: pageSize,
                examQuestion: examQuestion,
              ),
            ),
          ),
          viewModel.isBusy
              ? buildLoadingWidget(theme, 'Fetching analysis')
              : (!viewModel.hasError && viewModel.data != null)
                  ? Column(
                      children: [
                        const Divider(),
                        buildHeaderWidget(
                          theme: theme,
                          title: "Score Distribution",
                          leadingWidget: const Icon(Icons.pie_chart_outline),
                        ),
                        SizedBox(
                          width: pageSize.width * 0.3,
                          child: AppPieDonutChart(
                            dataSeries: viewModel.scoreDistCounts,
                            pieLabels: viewModel.scoreDistNames,
                            chartDirection: Axis.horizontal,
                            centerWidget: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Average",
                                  style: theme.textTheme.labelSmall,
                                ),
                                AppAnimatedCounter(
                                  valueToAnimate:
                                      viewModel.data?.avg_score ?? 0.0,
                                  startValue: 0,
                                  durationInUs: 1000,
                                  postTexts: [
                                    TextSpan(
                                        text:
                                            " • ${getShortExpectationLevel(viewModel.data?.avg_expectation_level)}")
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        buildHeaderWidget(
                          theme: theme,
                          title: "Answers",
                          leadingWidget: const Icon(Icons.list_alt),
                        ),
                        AppPageFilters(
                          filters: [
                            AppFilterItem(
                              label: "Expectation",
                              selectedValue: viewModel.selectedExpectationLevel,
                              onChanged: (val) {
                                viewModel.onChangeExpectationLevel(val);
                              },
                              items: (viewModel.data?.answers_by_level ?? [])
                                  .map<DropdownMenuItem<ScoreModel>>(
                                      (ScoreModel value) {
                                return DropdownMenuItem<ScoreModel>(
                                  value: value,
                                  child: Text(value.name),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        viewModel.isLoadingAnswers
                            ? buildLoadingWidget(theme, 'Fetching answers ...')
                            : AppSearchList(
                                hintText: "Search by student name",
                                itemsText: 'student answers',
                                searchTxtCtrl: studentSearchController,
                                onSearchTermChanged:
                                    viewModel.onStudentSearchNameChanged,
                                children: viewModel.questionAnswers
                                    .map((e) => buildStudentAnswerCard(
                                          theme: theme,
                                          studentAnswer: e,
                                          onViewStudentExamSession: viewModel
                                              .onViewStudentExamSession,
                                        ))
                                    .toList(),
                              )
                      ],
                    )
                  : buildNoItemsWidget('No analysis available'),
        ],
      ),
    );
  }

  Widget buildStudentAnswerCard({
    required ThemeData theme,
    required ExamModel studentAnswer,
    required Function(ExamModel studentAnswer) onViewStudentExamSession,
  }) {
    return GestureDetector(
      onTap: () {
        onViewStudentExamSession(studentAnswer);
      },
      child: Card(
        color: kcLightGrey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    studentAnswer.student_name ?? "--",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: "Score: ",
                        style: theme.textTheme.labelSmall,
                      ),
                      TextSpan(
                        text:
                            "${studentAnswer.answer_score} • (${getShortExpectationLevel(studentAnswer.answer_expectation_level)})",
                        style: theme.textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: Text(studentAnswer.answer_description ?? "--",
                        style: theme.textTheme.bodyMedium!
                            .copyWith(fontStyle: FontStyle.italic)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child:
                        buildIconBtn(theme: theme, iconPath: Icons.call_made),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ExamQuestionPerfDialogModel viewModelBuilder(BuildContext context) =>
      ExamQuestionPerfDialogModel();

  @override
  void onViewModelReady(ExamQuestionPerfDialogModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.onExamQuePerfViewReady();
  }
}
