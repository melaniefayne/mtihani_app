import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/common/dash_page/dash_page.dart';
import 'package:mtihani_app/ui/widgets/common/exam_widgets.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';

import 'exam_list_viewmodel.dart';

class ExamListView extends DashPage<ExamListViewModel> {
  const ExamListView({
    Key? key,
    required List<ClassroomModel> userClassrooms,
    required UserModel loggedInUser,
  }) : super(
          key: key,
          userClassrooms: userClassrooms,
          loggedInUser: loggedInUser,
        );

  @override
  Widget buildContent(BuildContext context, ExamListViewModel viewModel) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    final ScrollController scrollController = ScrollController();

    if (userClassrooms.isEmpty) {
      return Center(
        child: Text(
            "${viewModel.isTeacher ? "Create" : "Join"} a classroom to view exams"),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCountWidget(
                  theme: theme,
                  label: viewModel.isSingleClassView
                      ? "Grade ${userClassrooms.first.name} Exams"
                      : "Exam Listing",
                  count: viewModel.data?.length ?? 0,
                ),
                if (viewModel.isTeacher)
                  buildPriBtn(
                    theme: theme,
                    btnTxt: "Generate Exam",
                    iconPath: FontAwesomeIcons.scroll,
                    onAction: viewModel.onGenerateExam,
                  ),
              ],
            ),
            const Divider(),
            SizedBox(height: pageSize.height * 0.01),
            AppPageFilters(
              fullWidth: pageSize.width * 0.75,
              filters: [
                if (userClassrooms.isNotEmpty)
                  AppFilterItem(
                    label: "Class",
                    selectedValue: viewModel.selectedClass,
                    onChanged: (val) {
                      viewModel.onChangeClass(val);
                    },
                    items: userClassrooms.map<DropdownMenuItem<ClassroomModel>>(
                        (ClassroomModel value) {
                      return DropdownMenuItem<ClassroomModel>(
                        value: value,
                        child: Text(value.name ?? "--"),
                      );
                    }).toList(),
                  ),
                AppFilterItem(
                  label: "Status",
                  selectedValue: viewModel.selectedExamStatus,
                  onChanged: (val) {
                    viewModel.onChangeExamStatus(val);
                  },
                  items: (viewModel.isTeacher
                          ? allTrExamStatuses
                          : allStExamStatuses)
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                if (viewModel.isTeacher)
                  AppFilterItem(
                    label: "Publish Status",
                    selectedValue: viewModel.selectedExamIsPublished,
                    onChanged: (val) {
                      viewModel.onChangeExamIsPublished(val);
                    },
                    items: allExamPublishStatuses
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
              ],
            ),
            SizedBox(height: pageSize.height * 0.02),
            if (viewModel.isBusy)
              buildLoadingWidget(theme, "Fetching your exams", isLinear: true),
            if (viewModel.data != null)
              viewModel.data!.isEmpty
                  ? buildNoItemsWidget("No exams available")
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      controller: scrollController,
                      itemCount: viewModel.examList.length,
                      itemBuilder: (context, idx) => ExamCard(
                        exam: viewModel.examList[idx],
                        isStudent: viewModel.isStudent,
                        onViewExam: viewModel.onViewExam,
                        onRetryExamGen: viewModel.onRetryExamGeneration,
                        onRefresh: viewModel.initialise,
                      ),
                    ),
            const SizedBox(height: 10),
            if (viewModel.nextPageUrl != null)
              buildPriBtn(
                theme: theme,
                btnTxt: "Load More",
                onAction: viewModel.onViewMoreExams,
              ),
          ],
        ),
      ),
    );
  }

  @override
  ExamListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExamListViewModel(userClassrooms, loggedInUser);
}
