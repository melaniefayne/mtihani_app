import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/ui/widgets/app_carousel.dart';
import 'package:mtihani_app/ui/widgets/charts/app_bar_chart.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/ui/widgets/common/classroom_widgets.dart';
import 'package:stacked/stacked.dart';

import 'classroom_list_viewmodel.dart';

const double biggerSectionWidth = 0.5;
const double smallerSectionWidth = 0.32;

class ClassroomList extends StackedView<ClassroomListModel> {
  final UserModel loggedInUser;
  final Function onSwitchToExamTab;
  const ClassroomList({
    Key? key,
    required this.loggedInUser,
    required this.onSwitchToExamTab,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ClassroomListModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                          btnTxt: viewModel.classActionTxt,
                          iconPath: FontAwesomeIcons.usersRectangle,
                          onAction: viewModel.onOnboardClassroom,
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              btnTxt: viewModel.classActionTxt,
                              iconPath: FontAwesomeIcons.usersRectangle,
                              onAction: viewModel.onOnboardClassroom,
                            ),
                          ],
                        ),
                        const Divider(),
                        SizedBox(height: pageSize.height * 0.02),
                        AppCarousel(
                          children: viewModel.data!
                              .map((e) => ClassroomCard(
                                    classroom: e,
                                    onTap: viewModel.onViewClassItem,
                                  ))
                              .toList(),
                        ),
                        SizedBox(height: pageSize.height * 0.03),
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
                                    tipPostText: "%",
                                  ),
                                ],
                              ),
                            ),
                            buildSectionDivider(
                              height: pageSize.height * 0.4,
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
      ),
    );
  }

  @override
  ClassroomListModel viewModelBuilder(
    BuildContext context,
  ) =>
      ClassroomListModel();

  @override
  void onViewModelReady(ClassroomListModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.onClassroomListViewReady();
  }
}
