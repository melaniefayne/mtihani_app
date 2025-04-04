import 'package:flutter/material.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/models/class.dart';
import 'package:mtihani_app/ui/widgets/app_tab_bar.dart';
import 'package:mtihani_app/ui/widgets/cbc/strand_selection_card.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';

import 'exam_setup_viewmodel.dart';

class ExamSetupView extends StackedView<ExamSetupViewModel> {
  const ExamSetupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ExamSetupViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(pageSize.width * 0.03),
        child: Column(
          children: [
            buildPageTitle(
              theme: theme,
              pageTitle: "Set an Exam",
              action: viewModel.onGoToHome,
            ),
            AppTabBar(
              showUnViewedIndicator: false,
              sectionWidth: pageSize.width * 0.7,
              tabs: [
                TabViewItem(
                  label: "Strands",
                  icon: Icons.check_box,
                  widget: viewModel.busy(cbcFetchKey)
                      ? const Center(child: CircularProgressIndicator())
                      : buildStrandSection(
                          currentClass: viewModel.currentClass!,
                          gradeContent: viewModel.fetchedCbc,
                          selectedStrands: viewModel.selectedStrands,
                          onStrandSelected: viewModel.onStrandSelected,
                          pageSize: pageSize,
                        ),
                ),
                TabViewItem(
                  label: "Custom Content",
                  icon: Icons.file_upload,
                  widget: const Center(child: Text("Content")),
                ),
                TabViewItem(
                  label: "Duration",
                  icon: Icons.timer,
                  widget: buildDurationSection(
                    theme: theme,
                    pageSize: pageSize,
                    viewModel: viewModel,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildStrandSection({
    required ClassModel currentClass,
    required List<GradeModel> gradeContent,
    required List<int> selectedStrands,
    required Function(int) onStrandSelected,
    required Size pageSize,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: pageSize.width * 0.1,
            vertical: pageSize.height * 0.02,
          ),
          child: Text(
            "You are now creating an exam for a Grade ${currentClass.grade} class (${currentClass.name}). In this section, you can select which specific strands you want to test for. The default is all strands up to the current grade.",
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
          ),
        ),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: gradeContent
              .map((e) => StrandSelectionCard(
                    gradeCbc: e,
                    selectedStrands: selectedStrands,
                    onStrandSelected: onStrandSelected,
                    cardWidth: pageSize.width * 0.21,
                  ))
              .toList(),
        ),
      ],
    );
  }

  buildDurationSection({
    required ThemeData theme,
    required Size pageSize,
    required ExamSetupViewModel viewModel,
  }) {
    return Column(
      children: [
        SizedBox(height: pageSize.height * 0.02),
        buildPriBtn(
          theme: theme,
          btnTxt: 'Set Exam',
          isLoading: viewModel.isLoading,
          onAction: viewModel.onApiExamSetup,
        ),
      ],
    );
  }

  @override
  void onViewModelReady(ExamSetupViewModel viewModel) {
    viewModel.refreshView();
  }

  @override
  ExamSetupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExamSetupViewModel();
}
