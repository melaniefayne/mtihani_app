import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/ui/views/auth/profile/profile_view.dart';
import 'package:mtihani_app/ui/views/cbc/cbc_view.dart';
import 'package:mtihani_app/ui/views/classroom_list/classroom_list_view.dart';
import 'package:mtihani_app/ui/views/exam_list/exam_list_view.dart';
import 'package:mtihani_app/ui/views/tr_docs/tr_docs_view.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';

import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    List<Widget> dashboardPages = [
      const TrDocsView(),
      ClassroomListView(
        userClassrooms: viewModel.userClassrooms,
        loggedInUser: viewModel.loggedInUser,
      ),
      ExamListView(
        userClassrooms: viewModel.userClassrooms,
        loggedInUser: viewModel.loggedInUser,
      ),
      const CbcView(),
      ProfileView(loggedInUser: viewModel.loggedInUser)
    ];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: pageSize.height * 0.03,
          horizontal: pageSize.width * 0.05,
        ),
        child: Column(
          children: [
            buildAppNavBar(
              theme: theme,
              user: viewModel.loggedInUser,
              currentIdx: viewModel.currentIndex,
              onSwitchTab: viewModel.setIndex,
              profileTabIdx: dashboardPages.length - 1,
            ),
            SizedBox(height: pageSize.height * 0.02),
            Expanded(
              child: IndexedStack(
                index: viewModel.currentIndex,
                children: viewModel.isLoading
                    ? [
                        ...List.generate(
                            2,
                            (idx) => buildLoadingWidget(
                                theme, "Setting up your classes ...")),
                        const CbcView(),
                        ProfileView(loggedInUser: viewModel.loggedInUser),
                      ]
                    : viewModel.userClassrooms.isEmpty
                        ? [
                            ...List.generate(
                                2,
                                (idx) => buildNoItemsWidget(
                                      "You have no available classes",
                                      extraWidget: buildPriBtn(
                                        theme: theme,
                                        btnTxt: viewModel.classActionTxt,
                                        iconPath:
                                            FontAwesomeIcons.usersRectangle,
                                        onAction: viewModel.onOnboardClassroom,
                                      ),
                                    )),
                            const CbcView(),
                            ProfileView(loggedInUser: viewModel.loggedInUser),
                          ]
                        : dashboardPages,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(DashboardViewModel viewModel) {
    viewModel.onDashboardViewReady();
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();

  Widget buildAppNavBar({
    required ThemeData theme,
    required UserModel user,
    required int currentIdx,
    required int profileTabIdx,
    required Function(int tabIdx) onSwitchTab,
  }) {
    List<String> tabs = ["Dashboard", "Exams", "CBC", "Community"];
    bool isProfileSelected = currentIdx == profileTabIdx;
    Color bgColor = isProfileSelected ? theme.primaryColor : Colors.transparent;
    Color fgColor =
        isProfileSelected ? theme.colorScheme.onPrimary : theme.primaryColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => onSwitchTab(0),
                      child: buildAppLogo(),
                    ),
                    const SizedBox(width: 10),
                    ...tabs.asMap().entries.map(
                      (e) {
                        bool isSelected = e.key == currentIdx;
                        Color bgColor = isSelected
                            ? theme.primaryColor
                            : Colors.transparent;
                        Color fgColor = isSelected
                            ? theme.colorScheme.onPrimary
                            : theme.primaryColor;
                        return GestureDetector(
                          onTap: () {
                            onSwitchTab(e.key);
                          },
                          child: Container(
                            decoration: BoxDecoration(color: bgColor),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              e.value,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: fgColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  onSwitchTab(profileTabIdx);
                },
                child: Container(
                  decoration: BoxDecoration(color: bgColor),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        color: fgColor,
                        size: theme.textTheme.headlineSmall!.fontSize,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        user.name ?? "--",
                        style: theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: fgColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2.0,
          color: theme.primaryColor,
        ),
      ],
    );
  }
}
