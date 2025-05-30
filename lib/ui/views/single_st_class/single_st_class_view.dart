import 'package:flutter/material.dart';
import 'package:mtihani_app/models/classroom.dart';
import 'package:mtihani_app/models/user.dart';
import 'package:mtihani_app/ui/views/exam_list/exam_list_view.dart';
import 'package:mtihani_app/ui/widgets/app_side_bar.dart';
import 'package:mtihani_app/ui/widgets/app_tab_bar.dart';
import 'package:mtihani_app/ui/widgets/common/student_edit_form/student_edit_form.dart';
import 'package:mtihani_app/ui/widgets/common/student_performance_tab/student_performance_tab.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';

import 'single_st_class_viewmodel.dart';

class SingleStClassView extends StackedView<SingleStClassViewModel> {
  const SingleStClassView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SingleStClassViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.stClassroom == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return AppSideBarScaffold(
      pageTitle: viewModel.isStudent
          ? "Grade ${viewModel.stClassroom?.classroom_name ?? '--'}"
          : "Grade ${viewModel.stClassroom?.classroom_name ?? '--'}: ${viewModel.stClassroom?.name ?? "--"}",
      tabItems: [
        TabViewItem(
          label: "Overall Performance",
          icon: Icons.trending_up,
          widget: StudentPerformanceTab(student: viewModel.stClassroom!),
        ),
        TabViewItem(
          label: "Exams",
          icon: Icons.list_alt,
          widget: ExamListView(
            userClassrooms: [
              ClassroomModel(
                id: viewModel.stClassroom!.classroom_id,
                name: viewModel.stClassroom!.classroom_name,
              )
            ],
            loggedInUser: UserModel(
                role:
                    viewModel.isTeacher ? appTeacherRoleKw : appStudentRoleKw),
          ),
        ),
        if (viewModel.isTeacher)
          TabViewItem(
            label: "Edit Student",
            icon: Icons.edit,
            widget: StudentEditForm(
              student: viewModel.stClassroom!,
              onApiUpdateStudent: viewModel.onApiUpdateStudent,
            ),
          ),
      ],
    );
  }

  @override
  SingleStClassViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingleStClassViewModel();

  @override
  void onViewModelReady(SingleStClassViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.onSingleStClassViewReady();
  }

  @override
  void onDispose(SingleStClassViewModel viewModel) {
    viewModel.onDispose();
    super.onDispose(viewModel);
  }
}
