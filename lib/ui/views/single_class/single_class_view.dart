import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/ui/widgets/common/exam_list_secton/exam_list_section.dart';
import 'package:mtihani_app/ui/views/single_exam/exam_performance/exam_performance.dart';
import 'package:mtihani_app/ui/widgets/app_tab_bar.dart';
import 'package:mtihani_app/ui/widgets/common/student_list/student_list_section.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';

import 'single_class_viewmodel.dart';

class SingleClassView extends StackedView<SingleClassViewModel> {
  final ClassModel classItem;
  const SingleClassView({Key? key, required this.classItem}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SingleClassViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return buildAppPageScaffold(
      theme: theme,
      pageSize: pageSize,
      pageTitle: "Grade ${classItem.name ?? '--'}",
      trailing: buildPriBtn(
        theme: theme,
        btnTxt: "Edit Class",
        onAction: viewModel.onEditClass,
      ),
      children: [
        AppTabBarScaffold(
          tabs: [
            TabViewItem(
              label: "Performance",
              icon: Icons.trending_up,
              widget: ExamPerformanceWidget(classItem: classItem),
            ),
            TabViewItem(
              label: "Exams",
              icon: FontAwesomeIcons.scroll,
              widget: ExamListSection(userClasses: [classItem]),
            ),
            TabViewItem(
              label: "Students",
              icon: Icons.group,
              widget: StudentListSection(classItem: classItem),
            ),
          ],
        ),
      ],
    );
  }

  @override
  SingleClassViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingleClassViewModel(classItem);
}
