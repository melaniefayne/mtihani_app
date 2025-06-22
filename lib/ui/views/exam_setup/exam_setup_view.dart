import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/ui/widgets/app_start_end_date_form.dart';
import 'package:mtihani_app/ui/widgets/app_files_form_field.dart';
import 'package:mtihani_app/ui/widgets/app_tab_bar.dart';
import 'package:mtihani_app/ui/widgets/common/cbc/strand_selection_card.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
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

    if (viewModel.trClassroom == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return buildAppPageScaffold(
      theme: theme,
      pageSize: pageSize,
      pageTitle: "Generate an exam",
      children: [
        Text(
          "You’re setting up an exam for a Grade ${viewModel.trClassroom!.grade} class (${viewModel.trClassroom!.name}).",
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        AppTabBarScaffold(
          showUnViewedIndicator: false,
          sectionWidth: pageSize.width * 0.7,
          tabs: [
            TabViewItem(
              label: " 1. Strands",
              icon: Icons.category,
              widget: viewModel.isBusy
                  ? const Center(child: CircularProgressIndicator())
                  : buildStrandSection(
                      theme: theme,
                      pageSize: pageSize,
                      viewModel: viewModel,
                    ),
            ),
            // TabViewItem(
            //   label: " 2. Custom Content",
            //   icon: Icons.file_upload,
            //   widget: buildCustomFilesSection(
            //     theme: theme,
            //     pageSize: pageSize,
            //     viewModel: viewModel,
            //   ),
            // ),
            TabViewItem(
              label: " 2. Duration",
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
    );
  }

  buildStrandSection({
    required ThemeData theme,
    required Size pageSize,
    required ExamSetupViewModel viewModel,
  }) {
    return buildSectionScaffold(
      theme: theme,
      pageSize: pageSize,
      sectionTitle:
          "Choose the strands you want to include, or leave it as is to test all strands up to this grade.",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: viewModel.hasSelectedAllStrands,
                    onChanged: (val) {
                      viewModel.onSelectAllStrands();
                    },
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "Select All",
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (viewModel.strandSelectError != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                viewModel.strandSelectError!,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            ),
          SizedBox(
            height: pageSize.height * 0.6,
            child: ListView(
              children: viewModel.currentClassCurriculum
                  .map(
                    (e) => StrandSelectionCard(
                      gradeCbc: e,
                      gradeStrandScores: const [],
                      selectedStrands: viewModel.selectedStrandsIds,
                      onStrandSelected: viewModel.onStrandSelected,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  buildCustomFilesSection({
    required ThemeData theme,
    required Size pageSize,
    required ExamSetupViewModel viewModel,
  }) {
    const int maxFiles = 3;
    const List<String> extensions = [
      'pdf',
      'txt',
      'doc',
      'docx',
    ];
    return buildSectionScaffold(
      theme: theme,
      pageSize: pageSize,
      sectionTitle:
          "Uploading files here is completely optional. If you'd like, you can add up to $maxFiles custom files to guide exam generation. We accept: ${extensions.join(', ')}.",
      child: AppMultiFileFormField(
        allowedExtensions: extensions,
        selectedFiles: viewModel.selectedFiles,
        onFileSelected: viewModel.onCustomFileSelected,
        onFileRemoved: viewModel.onCustomFilesRemoved,
        maxFiles: maxFiles,
      ),
    );
  }

  buildDurationSection({
    required ThemeData theme,
    required Size pageSize,
    required ExamSetupViewModel viewModel,
  }) {
    return buildSectionScaffold(
      theme: theme,
      pageSize: pageSize,
      sectionTitle:
          "Here’s where you schedule the exam date and time. For comprehensive coverage of the selected strands, we recommend a minimum duration of 1 hour 15 minutes.",
      child: ExamDateTimeForm(
        onDateTimesSelected: viewModel.onDateTimesSelected,
        isLoading: viewModel.isLoading,
        onConfirm: viewModel.onConfirmExamConfig,
        examSetupError: viewModel.examSetupError,
      ),
    );
  }

  buildSectionScaffold({
    required ThemeData theme,
    required Size pageSize,
    required Widget child,
    required String sectionTitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: pageSize.width * 0.1,
              vertical: pageSize.height * 0.02,
            ),
            child: Text(
              sectionTitle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            ),
          ),
          child,
        ],
      ),
    );
  }

  @override
  ExamSetupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ExamSetupViewModel();

  @override
  void onViewModelReady(ExamSetupViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.onExamSetupViewReady();
  }

  @override
  void onDispose(ExamSetupViewModel viewModel) {
    super.onDispose(viewModel);
    viewModel.onDispose();
  }
}

class ExamDateTimeForm extends StatelessWidget {
  final Function(DateTime, DateTime) onDateTimesSelected;
  final bool isLoading;
  final Function() onConfirm;
  final String? examSetupError;
  final String btnTxt;
  final IconData btnIconPath;

  const ExamDateTimeForm({
    super.key,
    required this.onDateTimesSelected,
    required this.isLoading,
    required this.onConfirm,
    required this.examSetupError,
    this.btnTxt = "Generate Exam",
    this.btnIconPath = FontAwesomeIcons.scroll,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppStartEndDateForm(
          minDurationInMin: minExamDurationInMin,
          onDateTimesSelected: onDateTimesSelected,
        ),
        SizedBox(height: pageSize.height * 0.02),
        const Divider(),
        if (examSetupError != null)
          Text(
            examSetupError!,
            style: theme.textTheme.bodyMedium!
                .copyWith(color: theme.colorScheme.error),
          ),
        SizedBox(height: pageSize.height * 0.01),
        buildPriBtn(
          theme: theme,
          btnTxt: btnTxt,
          iconPath: btnIconPath,
          isLoading: isLoading,
          onAction: onConfirm,
          isFullWidth: true,
        ),
      ],
    );
  }
}
