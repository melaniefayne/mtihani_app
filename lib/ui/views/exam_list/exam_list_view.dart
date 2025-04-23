import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/common/exam_widgets.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';

import 'exam_list_viewmodel.dart';

class ExamListView extends StackedView<ExamListViewModel> {
  final ClassroomModel? classroom;
  final ClassroomStudent? classStudent;

  const ExamListView({Key? key, this.classroom, this.classStudent})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ExamListViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      body: SingleChildScrollView(
        child: viewModel.isBusy
            ? buildLoadingWidget(theme, "Setting up your exams ...")
            : viewModel.hasError ||
                    viewModel.data == null ||
                    viewModel.data!.isEmpty
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildNoItemsWidget("You have no available exams"),
                      buildPriBtn(
                        theme: theme,
                        btnTxt: "Generate Exam",
                        iconPath: FontAwesomeIcons.scroll,
                        onAction: viewModel.onGenerateExam,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildCountWidget(
                            theme: theme,
                            label: viewModel.listTitle,
                            count: viewModel.data!.length,
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
                        filters: [
                          if (viewModel.allFilterClasses.isNotEmpty)
                            AppFilterItem(
                              label: "Class",
                              selectedValue: viewModel.selectedClass,
                              onChanged: (val) {
                                viewModel.onChangeClass(val);
                              },
                              items: viewModel.allFilterClasses
                                  .map<DropdownMenuItem<ClassroomModel>>(
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
                            items: allExamStatuses
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
                      SizedBox(
                        height: pageSize.height * 0.6,
                        child: Scrollbar(
                          controller: scrollController,
                          thumbVisibility: true,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            controller: scrollController,
                            itemCount: viewModel.examList.length,
                            itemBuilder: (context, idx) => ExamCard(
                              exam: viewModel.examList[idx],
                              onTap: viewModel.onViewExam,
                            ),
                          ),
                        ),
                      ),
                      if (viewModel.nextPageUrl != null)
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: pageSize.height * 0.01),
                          child: buildPriBtn(
                            theme: theme,
                            btnTxt: "View More",
                            iconPath: Icons.read_more,
                            onAction: viewModel.onViewMoreExams,
                          ),
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
      ExamListViewModel(classroom, classStudent);

  @override
  void onViewModelReady(ExamListViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.onExamListViewReady();
  }
}
