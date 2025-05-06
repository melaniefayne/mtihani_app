import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/widgets/app_carousel.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'edit_exam_question_dialog_model.dart';

class EditExamQuestionDialog extends StackedView<EditExamQuestionDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const EditExamQuestionDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditExamQuestionDialogModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    final widgetConfig = request.data as Map<String, dynamic>?;
    ExamQuestionModel examQuestion = widgetConfig!['examQuestion'];

    return buildDialogScaffold(
      theme: theme,
      pageSize: pageSize,
      title: "Edit Exam Question",
      children: [
        SizedBox(
          width: pageSize.width * 0.5,
          height: pageSize.height * 0.6,
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
                        isLast: true, spacing: pageSize.width * 0.024),
                  ],
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Tap an option you prefer for this question",
                    textAlign: TextAlign.center,
                  ),
                ),
                ...(examQuestion.bloom_skill_options ?? []).asMap().entries.map(
                  (e) {
                    String bloomSkill = e.value;
                    String questionDesc = examQuestion.question_options![e.key];
                    String answerDesc = examQuestion.answer_options![e.key];
                    bool isSelected = viewModel.selectedQuestion == null
                        ? questionDesc == examQuestion.description
                        : questionDesc == viewModel.selectedQuestion;

                    return GestureDetector(
                      onTap: () {
                        viewModel.onOptionChanged(questionDesc);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Radio<String>(
                              value: questionDesc,
                              groupValue: viewModel.selectedQuestion ??
                                  examQuestion.description ??
                                  "--",
                              onChanged: viewModel.onOptionChanged,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? appBlue.withOpacity(0.2)
                                      : null,
                                  border: Border.all(
                                      color: isSelected
                                          ? appBlue
                                          : theme.primaryColor,
                                      width: 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Bloom Skill: ",
                                              style: theme.textTheme.labelSmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          TextSpan(text: bloomSkill),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "❔: ",
                                              style: theme.textTheme.labelSmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          TextSpan(text: questionDesc),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "✅: ",
                                              style: theme.textTheme.labelSmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          TextSpan(text: answerDesc),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
                const SizedBox(height: 10),
                buildPriBtn(
                  theme: theme,
                  isFullWidth: true,
                  iconPath: Icons.check,
                  btnTxt: "Update Question",
                  onAction: () {
                    viewModel.onOptionSelection(completer, examQuestion);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  EditExamQuestionDialogModel viewModelBuilder(BuildContext context) =>
      EditExamQuestionDialogModel();
}
