import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/app_search_table.dart';
import 'package:mtihani_app/ui/widgets/common/student_listing/student_listing_model.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
import 'package:stacked/stacked.dart';

import 'exam_responses_list_model.dart';

class ExamResponsesList extends StackedView<ExamResponsesListModel> {
  final ExamModel exam;
  const ExamResponsesList({super.key, required this.exam});

  @override
  Widget builder(
    BuildContext context,
    ExamResponsesListModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    if ([ExamStatus.upcoming, ExamStatus.ongoing].contains(exam.status)) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              astImagesWaiting,
              height: pageSize.height * 0.3,
            ),
            SizedBox(height: pageSize.height * 0.01),
            const Text(
              "The responses will be ready to view as soon as they come in :)",
            ),
          ],
        ),
      );
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (viewModel.isExamComplete)
            Padding(
              padding: EdgeInsets.only(bottom: pageSize.height * 0.01),
              child: AppPageFilters(
                fullWidth: pageSize.width * 0.75,
                filters: [
                  AppFilterItem(
                    label: "Expectation Level",
                    selectedValue: viewModel.selectedStudentExpectation,
                    onChanged: (val) {
                      viewModel.onChangeStudentExpectation(val);
                    },
                    items: allExpectationLevels
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          if (viewModel.isBusy)
            buildLoadingWidget(theme, "Fetching student responses",
                isLinear: true),
          if (viewModel.data != null)
            AppSearchTable(
              isSearchActive: viewModel.isSearchActive,
              onSearchCanceled: viewModel.onSearchCanceled,
              onSearchTermChanged: viewModel.onSearchTermChanged,
              hintText: "Search by student name",
              searchTxtCtrl: viewModel.searchTxtCtrl,
              tableHeight: pageSize.height * 0.7,
              tableHeaders: viewModel.isExamComplete
                  ? const [
                      "Name",
                      "Start",
                      "End",
                      "Duration",
                      "Avg. Score",
                      "Expectation Level",
                      "Action",
                    ]
                  : const ["Name", "Start", "End", "Duration", "Action"],
              tableRows: List.generate(viewModel.data!.length, (int idx) {
                StudentExamSessionModel session = viewModel.data![idx];
                onViewStudent() => viewModel.onViewExamSession(session);
                final localStart = session.start_date_time?.toLocal();
                final localEnd = session.end_date_time?.toLocal();

                return DataRow(
                  cells: [
                    buildCellTxt(
                      session.student_name,
                      useLeftAlign: true,
                      onAction: onViewStudent,
                    ),
                    buildCellTxt(
                        localStart != null
                            ? shortDateTimeFormat.format(localStart)
                            : '--',
                        onAction: onViewStudent),
                    buildCellTxt(
                        localEnd != null
                            ? shortDateTimeFormat.format(localEnd)
                            : '--',
                        onAction: onViewStudent),
                    buildCellTxt("${session.duration_min ?? '--'} min",
                        onAction: onViewStudent),
                    if (viewModel.isExamComplete) ...[
                      buildCellTxt("${session.avg_score ?? 0.0}%",
                          onAction: onViewStudent),
                      buildCellTxt(session.expectation_level,
                          onAction: onViewStudent),
                    ],
                    localStart != null && localEnd != null
                        ? buildCellViewAction(
                            theme: theme, onAction: onViewStudent)
                        : buildCellTxt("--"),
                  ],
                );
              }),
              itemsText: "No responses available",
            ),
          const SizedBox(height: 10),
          if (viewModel.nextPageUrl != null)
            buildPriBtn(
              theme: theme,
              btnTxt: "Load More",
              onAction: viewModel.onViewMore,
            ),
        ],
      ),
    );
  }

  @override
  ExamResponsesListModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExamResponsesListModel(exam);
}
