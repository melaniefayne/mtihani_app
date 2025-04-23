import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  final UserModel loggedInUser;
  const ProfileView({Key? key, required this.loggedInUser}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          buildPageAppHeader(
            theme: theme,
            iconPath: Icons.account_circle_outlined,
            pageTitle: "Profile",
          ),
          SizedBox(height: pageSize.height * 0.01),
          getScreenMenuItem(
            theme: theme,
            label: "Edit Profile",
            iconPath: FontAwesomeIcons.userPen,
            action: viewModel.onEditProfile,
          ),
          getScreenMenuItem(
            theme: theme,
            label: "Change Password",
            iconPath: FontAwesomeIcons.lock,
            action: viewModel.onChangePassword,
          ),
          getScreenMenuItem(
            theme: theme,
            label: "Logout",
            iconPath: Icons.logout,
            action: viewModel.onLogOut,
            textColor: theme.colorScheme.error,
          ),
        ],
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
