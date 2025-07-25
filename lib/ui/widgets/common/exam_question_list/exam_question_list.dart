import 'package:flutter/material.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/app_search_list.dart';
import 'package:mtihani_app/ui/widgets/common/exam_widgets.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';

import 'exam_question_list_model.dart';

class ExamQuestionList extends StackedView<ExamQuestionListModel> {
  final ExamModel exam;
  final String title;
  final Function? downloadAction;

  const ExamQuestionList({
    super.key,
    required this.exam,
    this.title = "Listing",
    this.downloadAction,
  });

  @override
  Widget builder(
    BuildContext context,
    ExamQuestionListModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          viewModel.isLoading
              ? buildLoadingWidget(theme, "Fetching exam details ...")
              : viewModel.exam.analysis != null
                  ? Column(
                      children: [
                        buildHeaderWidget(
                          theme: theme,
                          title: "Analysis",
                          leadingWidget: const Icon(Icons.analytics_outlined),
                        ),
                        ExamQuestionAnalysisSection(
                          questionAnalysis: viewModel.exam.analysis!,
                        )
                      ],
                    )
                  : const SizedBox.shrink(),

          buildHeaderWidget(
            theme: theme,
            title: title,
            leadingWidget: const Icon(Icons.help_outline),
          ),
          if (downloadAction != null &&
              !viewModel.isLoading &&
              viewModel.questionsList.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildPriBtn(
                  theme: theme,
                  btnTxt: "Download PDF",
                  onAction: () => downloadAction!(),
                ),
              ],
            ),

          //
          SizedBox(height: pageSize.height * 0.02),
          viewModel.isLoading
              ? buildLoadingWidget(theme, "Fetching question details ...")
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppPageFilters(
                      fullWidth: pageSize.width * 0.75,
                      filters: [
                        AppFilterItem(
                          label: "Bloom Skill",
                          selectedValue: viewModel.selectedBloomSkill,
                          onChanged: (val) {
                            viewModel.onChangeSelectedBloomSkill(val);
                          },
                          items: ['All', ...allBloomSkills]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        AppFilterItem(
                          label: "Grade",
                          selectedValue: viewModel.selectedGrade?.toString(),
                          onChanged: (val) {
                            viewModel.onChangeSelectedGrade(val);
                          },
                          items: ['All', "7", "8", "9"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child:
                                  Text(value == "All" ? "All" : "Grade $value"),
                            );
                          }).toList(),
                        ),
                        AppFilterItem(
                          label: "Strand",
                          selectedValue: viewModel.selectedStrand,
                          onChanged: (val) {
                            viewModel.onChangeSelectedStrand(val);
                          },
                          items: [
                            StrandModel(name: "All"),
                            ...viewModel.allStrands
                          ].map<DropdownMenuItem<StrandModel>>(
                              (StrandModel value) {
                            return DropdownMenuItem<StrandModel>(
                              value: value,
                              child: Text(value.name ?? "--"),
                            );
                          }).toList(),
                        ),
                        AppFilterItem(
                          label: "Sub-Strand",
                          selectedValue: viewModel.selectedSubStrand,
                          onChanged: (val) {
                            viewModel.onChangeSelectedSubStrand(val);
                          },
                          items: [
                            SubStrandModel(name: "All"),
                            ...viewModel.allSubStrands
                          ].map<DropdownMenuItem<SubStrandModel>>(
                              (SubStrandModel value) {
                            return DropdownMenuItem<SubStrandModel>(
                              value: value,
                              child: Text(value.name ?? "--"),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: pageSize.height * 0.01),
                    if (viewModel.isBusy)
                      buildLoadingWidget(theme, "Fetching exam questions",
                          isLinear: true),
                    AppSearchList(
                      isSearchActive: viewModel.isSearchActive,
                      searchTxtCtrl: viewModel.searchTxtCtrl,
                      onSearchTermChanged: viewModel.onSearchTermChanged,
                      onSearchCanceled: viewModel.onSearchCanceled,
                      hintText: "Search by question description",
                      itemsText: "exam questions",
                      children: viewModel.questionsList
                          .map((e) => ExamQuestionCard(
                                question: e,
                                onEditQuestion:
                                    exam.status == ExamStatus.upcoming
                                        ? viewModel.onEditQuestion
                                        : null,
                                onViewPerformance:
                                    exam.status == ExamStatus.complete
                                        ? viewModel.onViewQuestionPerformance
                                        : null,
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 10),
                    if (viewModel.nextPageUrl != null)
                      buildPriBtn(
                        theme: theme,
                        btnTxt: "Load More",
                        onAction: viewModel.onViewMoreQuestions,
                      ),
                  ],
                ),
        ],
      ),
    );
  }

  @override
  ExamQuestionListModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExamQuestionListModel(exam);
}
