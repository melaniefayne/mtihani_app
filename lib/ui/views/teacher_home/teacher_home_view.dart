import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/ui/views/exam_list/exam_list_view.dart';
import 'package:mtihani_app/ui/widgets/charts/app_bar_chart.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/ui/widgets/model_widgets/class_widgets.dart';
import 'package:mtihani_app/ui/widgets/model_widgets/lesson_time.dart';
import 'package:stacked/stacked.dart';

import 'teacher_home_viewmodel.dart';

const double firstSectionWidth = 0.5;
const double lastSectionWidth = 0.32;

class TeacherHomeView extends StackedView<TeacherHomeViewModel> {
  final UserModel loggedInUser;
  final Function onSwitchToExamTab;
  const TeacherHomeView({
    Key? key,
    required this.loggedInUser,
    required this.onSwitchToExamTab,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TeacherHomeViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    Widget buildClassDataSection(Widget child) {
      return viewModel.isFetchingTrClasses
          ? buildLoadingWidget(theme, "Setting up your classes ...")
          : viewModel.fetchedTrClasses.isEmpty
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildNoItemsWidget("You have no available classes"),
                    buildPriBtn(
                      theme: theme,
                      btnTxt: "Add Class",
                      isFullWidth: false,
                      iconPath: FontAwesomeIcons.usersRectangle,
                      onAction: viewModel.onAddClass,
                    ),
                  ],
                )
              : child;
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          buildClassDataSection(
            buildClassesSection(
              theme: theme,
              pageSize: pageSize,
              classes: viewModel.fetchedTrClasses,
              onAddClass: viewModel.onAddClass,
              onViewClass: viewModel.onViewClass,
            ),
          ),
          SizedBox(height: pageSize.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: pageSize.width * firstSectionWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recent Exams",
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    viewModel.isFetchingTrClasses
                        ? buildLoadingWidget(theme, "Getting your exams ...")
                        : ExamList(
                            examList: viewModel.fetchedTrExams,
                            onViewExam: viewModel.onViewExam,
                            onViewMore: onSwitchToExamTab,
                          ),
                  ],
                ),
              ),
              buildSectionDivider(
                height: pageSize.height * 0.2,
                color: theme.colorScheme.outlineVariant,
              ),
              SizedBox(
                width: pageSize.width * lastSectionWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today",
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    buildClassDataSection(
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: viewModel.getLessonTimes.length,
                        itemBuilder: (context, idx) {
                          ClassLessonTime classLesson =
                              viewModel.getLessonTimes[idx];
                          return buildLessonTimeCard(
                            theme: theme,
                            classLesson: classLesson,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildClassesSection({
    required ThemeData theme,
    required Size pageSize,
    required List<ClassModel> classes,
    required Function onAddClass,
    required Function(ClassModel classItem) onViewClass,
  }) {
    List<double> classTermScores =
        classes.map((e) => e.avg_term_score ?? 0.0).toList();
    List<double> classExamScores =
        classes.map((e) => e.avg_exam_score ?? 0.0).toList();
    List<String> classNames = classes.map((e) => e.name ?? "--").toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildCountWidget(
              theme: theme,
              label: "My Classes",
              count: classes.length,
            ),
            buildPriBtn(
              theme: theme,
              btnTxt: "Add Class",
              isFullWidth: false,
              iconPath: FontAwesomeIcons.usersRectangle,
              onAction: () => onAddClass(),
            ),
          ],
        ),
        const Divider(),
        SizedBox(height: pageSize.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: pageSize.width * firstSectionWidth,
              child: Wrap(
                children: classes
                    .map((classItem) => ClassCard(
                          classItem: classItem,
                          onTap: onViewClass,
                        ))
                    .toList(),
              ),
            ),
            SizedBox(
              width: pageSize.width * lastSectionWidth,
              child: AppBarChart(
                barWidth: pageSize.width * 0.03,
                chartHeight: pageSize.height * 0.25,
                dataSeries: [classTermScores, classExamScores],
                xAxisLabels: classNames,
                seriesLabels: const ["Term Scores", "Mtihani Scores"],
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  TeacherHomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TeacherHomeViewModel();
}
