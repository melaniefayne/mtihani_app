import 'package:flutter/material.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/app_search_table.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';

import 'student_listing_model.dart';

class StudentListing extends StackedView<StudentListingModel> {
  final ClassroomModel classroom;
  final bool hasStatusFilter;
  final bool hasSearch;
  const StudentListing({
    super.key,
    required this.classroom,
    this.hasStatusFilter = true,
    this.hasSearch = true,
  });

  @override
  Widget builder(
    BuildContext context,
    StudentListingModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppPageFilters(
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
              if (hasStatusFilter)
                AppFilterItem(
                  label: "Status",
                  selectedValue: viewModel.selectedStudentStatus,
                  onChanged: (val) {
                    viewModel.onChangeStudentStatus(val);
                  },
                  items: allStudentStatuses
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
            ],
          ),
          SizedBox(height: pageSize.height * 0.01),
          if (viewModel.isBusy)
            buildLoadingWidget(theme, "Fetching classroom students",
                isLinear: true),
          if (viewModel.data != null)
            AppSearchTable(
              isSearchActive: hasSearch ? viewModel.isSearchActive : null,
              onSearchCanceled: viewModel.onSearchCanceled,
              onSearchTermChanged: viewModel.onSearchTermChanged,
              hintText: "Search by student name",
              searchTxtCtrl: viewModel.searchTxtCtrl,
              tableHeight: pageSize.height * 0.57,
              tableHeaders: const [
                "Name",
                "Avg. Term Score",
                "Expectation Level",
                "Status",
                "Action"
              ],
              tableRows: List.generate(viewModel.data!.length, (int idx) {
                ClassroomStudent student = viewModel.data![idx];
                onViewStudent() => viewModel.onViewStudent(student);

                return DataRow(
                  cells: [
                    buildCellTxt(
                      student.name ?? "--",
                      useLeftAlign: true,
                      onAction: onViewStudent,
                    ),
                    buildCellTxt("${student.avg_score ?? 0.0}%",
                        onAction: onViewStudent),
                    buildCellTxt(student.avg_expectation_level ?? "--",
                        onAction: onViewStudent),
                    buildCellTxt(student.status ?? "--",
                        onAction: onViewStudent),
                    buildCellViewAction(theme: theme, onAction: onViewStudent),
                  ],
                );
              }),
              itemsText: "No students available",
            ),
          const SizedBox(height: 10),
          if (viewModel.nextPageUrl != null)
            buildPriBtn(
              theme: theme,
              btnTxt: "Load More",
              onAction: viewModel.onViewMoreStudents,
            ),
        ],
      ),
    );
  }

  @override
  StudentListingModel viewModelBuilder(
    BuildContext context,
  ) =>
      StudentListingModel(classroom);
}
