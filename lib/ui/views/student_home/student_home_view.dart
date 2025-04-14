import 'package:flutter/material.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:stacked/stacked.dart';

import 'student_home_viewmodel.dart';

class StudentHomeView extends StackedView<StudentHomeViewModel> {
  final UserModel loggedInUser;
  const StudentHomeView({Key? key, required this.loggedInUser})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StudentHomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("Student View")),
      ),
    );
  }

  @override
  StudentHomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StudentHomeViewModel();
}
