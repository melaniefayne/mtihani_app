import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/views/auth/teacher_onboarding/class_form/class_form_view.dart';
import 'package:mtihani_app/ui/views/single_tr_class/class_performance_tab/class_performance_tab.dart';
import 'package:mtihani_app/ui/widgets/app_side_bar.dart';
import 'package:mtihani_app/ui/widgets/app_tab_bar.dart';
import 'package:mtihani_app/ui/widgets/common/student_listing/student_listing.dart';
import 'package:stacked/stacked.dart';

import 'single_tr_class_viewmodel.dart';

class SingleTrClassView extends StackedView<SingleTrClassViewModel> {
  const SingleTrClassView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SingleTrClassViewModel viewModel,
    Widget? child,
  ) {
    if (viewModel.trClassroom == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return AppSideBarScaffold(
      pageTitle: "Grade ${viewModel.trClassroom?.name ?? '--'}",
      tabItems: [
        TabViewItem(
          label: "Performance",
          icon: Icons.trending_up,
          widget: ClassPerformanceTab(classroom: viewModel.trClassroom!),
        ),
        TabViewItem(
          label: "Exams",
          icon: Icons.list_alt,
          widget: const Center(
            child: Text("Exam listing"),
          ),
        ),
        TabViewItem(
          label: "Students",
          icon: Icons.group,
          widget: StudentListing(classroom: viewModel.trClassroom!),
        ),
        TabViewItem(
          label: "Edit Classroom",
          icon: Icons.edit,
          widget: const ClassFormView(),
        ),
      ],
    );
  }

  @override
  SingleTrClassViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingleTrClassViewModel();

  @override
  void onViewModelReady(SingleTrClassViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.onSingleClassViewReady();
  }

  @override
  void onDispose(SingleTrClassViewModel viewModel) {
    viewModel.onDispose();
    super.onDispose(viewModel);
  }
}
