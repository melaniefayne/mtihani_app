import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/ui/widgets/app_carousel.dart';
import 'package:mtihani_app/ui/widgets/charts/app_bar_chart.dart';
import 'package:mtihani_app/ui/widgets/common/dash_page/dash_page.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/ui/widgets/common/classroom_widgets.dart';

import 'classroom_list_viewmodel.dart';

const double biggerSectionWidth = 0.5;
const double smallerSectionWidth = 0.32;

class ClassroomListView extends DashPage<ClassroomListViewModel> {
  const ClassroomListView({
    Key? key,
    required List<ClassroomModel> userClassrooms,
    required UserModel loggedInUser,
  }) : super(
          key: key,
          userClassrooms: userClassrooms,
          loggedInUser: loggedInUser,
        );

  @override
  Widget buildContent(BuildContext context, ClassroomListViewModel viewModel) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

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
                  label: "My Classes",
                  count: userClassrooms.length,
                ),
                if (viewModel.isTeacher)
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
              children: userClassrooms
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
                        seriesLabels: const ["Term Scores", "Mtihani Scores"],
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
    );
  }

  @override
  ClassroomListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ClassroomListViewModel(userClassrooms, loggedInUser);

  @override
  void onViewModelReady(ClassroomListViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.onClassroomListViewViewReady();
  }
}
