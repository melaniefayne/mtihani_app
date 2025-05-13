import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/widgets/app_carousel.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
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
                AppCarousel(
                  children: [
                    metaIconText(theme, pageSize, Icons.onetwothree,
                        'Question Number', examQuestion.number?.toString(),
                        spacing: pageSize.width * 0.024),
                    metaIconText(theme, pageSize, Icons.star, 'Grade',
                        gradeText(examQuestion.grade),
                        spacing: pageSize.width * 0.024),
                    metaIconText(theme, pageSize, Icons.folder_copy, 'Strand',
                        examQuestion.strand,
                        spacing: pageSize.width * 0.024),
                    metaIconText(theme, pageSize, Icons.folder_open,
                        'Sub-Strand', examQuestion.sub_strand,
                        spacing: pageSize.width * 0.024),
                  ],
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        examQuestion.description ?? "--",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Current Score: ${studentAnswer.tr_score ?? studentAnswer.score ?? "--"}",
                        style: theme.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
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
