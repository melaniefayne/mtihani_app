import 'package:flutter/material.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/ui/views/auth/profile/profile_view.dart';
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
              onViewProfile: () {
                viewModel.setIndex(2); // profile page index
              },
            ),
            SizedBox(height: pageSize.height * 0.02),
            Expanded(
              child: IndexedStack(
                index: viewModel.currentIndex,
                children: [
                  // viewModel.isTeacherRole
                  //     ? TeacherClassesView(
                  //         loggedInUser: viewModel.loggedInUser,
                  //         onSwitchToExamTab: () {
                  //           viewModel.setIndex(1); // exam page index
                  //         },
                  //       )
                  //     : StudentClassesView(
                  //         loggedInUser: viewModel.loggedInUser),
                  // const ExamListSection(
                  //     // loggedInUserClassrooms: viewModel.loggedInUser.user_classes ?? [],
                  //     ),
                  ProfileView(loggedInUser: viewModel.loggedInUser)
                ],
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
    required Function onViewProfile,
  }) {
    List<String> tabs = ["Dashboard", "Exams"];
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
                    buildAppLogo(),
                    const SizedBox(width: 10),
                    ...tabs
                        .asMap()
                        .entries
                        .map(
                          (e) => Container(
                            decoration: BoxDecoration(
                              border: e.key == currentIdx
                                  ? Border.all(
                                      width: 2.0, color: theme.primaryColor)
                                  : null,
                            ),
                            padding: e.key == currentIdx
                                ? const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10)
                                : null,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              e.value,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => onViewProfile(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      color: theme.primaryColor,
                      size: theme.textTheme.headlineSmall!.fontSize,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      user.name ?? "--",
                      style: theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              )
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
