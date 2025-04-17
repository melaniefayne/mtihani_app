import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/ui/widgets/app_carousel.dart';
import 'package:mtihani_app/ui/widgets/charts/app_bar_chart.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/ui/widgets/common/classroom_widgets.dart';
import 'package:stacked/stacked.dart';

import 'teacher_classes_viewmodel.dart';

const double biggerSectionWidth = 0.5;
const double smallerSectionWidth = 0.32;

class TeacherClassesView extends StackedView<TeacherClassesViewModel> {
  final UserModel loggedInUser;
  final Function onSwitchToExamTab;
  const TeacherClassesView({
    Key? key,
    required this.loggedInUser,
    required this.onSwitchToExamTab,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TeacherClassesViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    return Material(
      child: viewModel.isBusy
          ? buildLoadingWidget(theme, "Setting up your classes ...")
          : viewModel.hasError ||
                  viewModel.data == null ||
                  viewModel.data!.isEmpty
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildNoItemsWidget("You have no available classes"),
                    buildPriBtn(
                      theme: theme,
                      btnTxt: "Add Class",
                      iconPath: FontAwesomeIcons.usersRectangle,
                      onAction: viewModel.onAddClass,
                    ),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildCountWidget(
                            theme: theme,
                            label: "My Classes",
                            count: viewModel.data!.length,
                          ),
                          buildPriBtn(
                            theme: theme,
                            btnTxt: "Add Class",
                            iconPath: FontAwesomeIcons.usersRectangle,
                            onAction: viewModel.onAddClass,
                          ),
                        ],
                      ),
                      const Divider(),
                      SizedBox(height: pageSize.height * 0.02),
                      AppCarousel(
                        children: viewModel.data!
                            .map((e) => ClassroomCard(classroom: e))
                            .toList(),
                      ),
                      SizedBox(height: pageSize.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: pageSize.width * biggerSectionWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Averages",
                                  style: theme.textTheme.titleLarge!.copyWith(
                                    color: theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(),
                                AppBarChart(
                                  barWidth: pageSize.width * 0.03,
                                  chartHeight: pageSize.height * 0.25,
                                  dataSeries: [
                                    viewModel.classTermScores,
                                    viewModel.classMtihaniScores
                                  ],
                                  xAxisLabels: viewModel.classNames,
                                  seriesLabels: const [
                                    "Term Scores",
                                    "Mtihani Scores"
                                  ],
                                ),
                              ],
                            ),
                          ),
                          buildSectionDivider(
                            height: pageSize.height * 0.2,
                            color: theme.colorScheme.outlineVariant,
                          ),
                          SizedBox(
                            width: pageSize.width * smallerSectionWidth,
                            child: TimeTableWidget(
                              lessons: viewModel.classLessonTimes,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
    );
  }

  @override
  TeacherClassesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TeacherClassesViewModel();
}
