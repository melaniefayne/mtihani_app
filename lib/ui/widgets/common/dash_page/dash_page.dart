import 'package:flutter/material.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';

import 'dash_page_model.dart';

abstract class DashPage<T extends DashPageModel> extends StackedView<T> {
  final List<ClassroomModel> userClassrooms;
  final UserModel loggedInUser;
  final AppPageConfig? appPageConfig;

  const DashPage({
    Key? key,
    required this.loggedInUser,
    required this.userClassrooms,
    this.appPageConfig,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, T viewModel, Widget? child) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return appPageConfig == null
        ? buildContent(context, viewModel)
        : buildAppPageScaffold(
            theme: theme,
            pageTitle: appPageConfig!.title,
            pageSize: pageSize,
            children: [
              buildContent(context, viewModel),
            ],
          );
  }

  Widget buildContent(BuildContext context, T viewModel);
}

class AppPageConfig {
  final String title;
  final IconData iconPath;
  List<Widget>? appBarActions;

  AppPageConfig(
      {required this.title, required this.iconPath, this.appBarActions});
}
