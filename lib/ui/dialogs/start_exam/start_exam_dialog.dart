import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'start_exam_dialog_model.dart';

class StartExamDialog extends StackedView<StartExamDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const StartExamDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartExamDialogModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    final widgetConfig = request.data as Map<String, dynamic>?;
    ExamModel currentExam = widgetConfig!['currentExam'];
    bool isStartExamDialog = widgetConfig['isStartExamDialog'];
    final durationStr = currentExam.duration_min != null
        ? '${currentExam.duration_min! ~/ 60}hr ${currentExam.duration_min! % 60} minutes'
        : '--';

    return buildDialogScaffold(
      theme: theme,
      pageSize: pageSize,
      title: isStartExamDialog ? "Ready to Start" : "Are you Sure?",
      children: [
        SizedBox(
          width: pageSize.width * 0.4,
          child: Column(
            children: [
              Image.asset(
                astImagesReady,
                height: pageSize.height * 0.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  isStartExamDialog
                      ? "You’re about to start a Science exam set by your teacher. Ensure you’re in a conducive environment to do the exam. All the best."
                      : "Once you submit the exam you will not be able to edit your answers again!",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: pageSize.height * 0.01),
              Text(
                "${currentExam.analysis?.question_count ?? "--"} Questions • $durationStr",
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: pageSize.height * 0.02),
              buildPriBtn(
                theme: theme,
                btnTxt: isStartExamDialog ? "Start Exam" : "End Exam",
                iconPath: Icons.start,
                isFullWidth: true,
                onAction: () {
                  viewModel.onStartExam(completer);
                },
              ),
              SizedBox(height: pageSize.height * 0.01),
            ],
          ),
        ),
      ],
    );
  }

  @override
  StartExamDialogModel viewModelBuilder(BuildContext context) =>
      StartExamDialogModel();
}
