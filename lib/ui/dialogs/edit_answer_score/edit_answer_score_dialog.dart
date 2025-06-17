import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/widgets/common/exam_widgets.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'edit_answer_score_dialog_model.dart';

class EditAnswerScoreDialog extends StackedView<EditAnswerScoreDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const EditAnswerScoreDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditAnswerScoreDialogModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    final widgetConfig = request.data as Map<String, dynamic>?;
    StudentAnswerModel studentAnswer = widgetConfig!['studentAnswer'];
    ExamQuestionModel examQuestion = studentAnswer.question!;

    return buildDialogScaffold(
      theme: theme,
      pageSize: pageSize,
      title: "Edit Answer Score",
      children: [
        SizedBox(
          width: pageSize.width * 0.5,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                buildQuestionSummary(
                  theme: theme,
                  pageSize: pageSize,
                  examQuestion: examQuestion,
                ),
                Text(
                  "Current Score: ${studentAnswer.score ?? "--"}",
                  style: theme.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: pageSize.width * 0.4,
                      child: AppTextFormField(
                        readOnly: true,
                        label: "Your score",
                        controller: TextEditingController(
                          text: "${viewModel.score ?? ''}",
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    buildFormIcon(
                      onAction: viewModel.onAddScore,
                      iconPath: Icons.arrow_upward,
                      theme: theme,
                    ),
                    const SizedBox(width: 5),
                    buildFormIcon(
                      onAction: viewModel.onReduceScore,
                      iconPath: Icons.arrow_downward,
                      theme: theme,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                buildPriBtn(
                  theme: theme,
                  isFullWidth: true,
                  iconPath: Icons.check,
                  btnTxt: "Update Score",
                  onAction: () {
                    viewModel.onUpdatedScore(completer, studentAnswer);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildFormIcon({
    required IconData iconPath,
    required Function onAction,
    required ThemeData theme,
  }) {
    return GestureDetector(
      onTap: () => onAction(),
      child: CircleAvatar(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        child: Icon(iconPath),
      ),
    );
  }

  @override
  EditAnswerScoreDialogModel viewModelBuilder(BuildContext context) =>
      EditAnswerScoreDialogModel();
}
