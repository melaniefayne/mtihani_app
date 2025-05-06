import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/views/exam_setup/exam_setup_view.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'edit_exam_time_dialog_model.dart';

class EditExamTimeDialog extends StackedView<EditExamTimeDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const EditExamTimeDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditExamTimeDialogModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    return buildDialogScaffold(
      theme: theme,
      pageSize: pageSize,
      title: "Select new date and time",
      children: [
        SizedBox(
          width: pageSize.width * 0.55,
          child: ExamDateTimeForm(
            onDateTimesSelected: viewModel.onDateTimesSelected,
            isLoading: viewModel.isLoading,
            btnTxt: "Update Exam Times",
            examSetupError: viewModel.examSetupError,
            btnIconPath: Icons.edit,
            onConfirm: () {
              viewModel.onEditExamSchedule(completer);
            },
          ),
        ),
      ],
    );
  }

  @override
  EditExamTimeDialogModel viewModelBuilder(BuildContext context) =>
      EditExamTimeDialogModel();
}
