import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/widgets/app_text_form_field.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';
import 'package:stacked/stacked.dart';

import 'st_exam_session_viewmodel.dart';

class StExamSessionView extends StackedView<StExamSessionViewModel> {
  const StExamSessionView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StExamSessionViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    if (viewModel.exam == null ||
        viewModel.data == null ||
        viewModel.hasError) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Row(
        children: [
          _buildSidebar(viewModel, pageSize, theme),
          Expanded(
            child: PageView.builder(
              controller: viewModel.pageController,
              onPageChanged: viewModel.onPageChanged,
              itemCount: viewModel.editableAnswers.length,
              itemBuilder: (_, index) {
                final q = viewModel.editableAnswers[index];
                return _buildQuestionPage(q, viewModel, theme, pageSize);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(
    StExamSessionViewModel viewModel,
    Size pageSize,
    ThemeData theme,
  ) {
    double horizPadding = 0.02;
    Color bgColor = Colors.grey.shade900;
    return buildSideBarScaffold(
      theme: theme,
      pageSize: pageSize,
      width: pageSize.width * 0.2,
      bgColor: bgColor,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: pageSize.width * horizPadding),
          child: Text(
            "Exam ${viewModel.exam!.code}",
            style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: pageSize.width * horizPadding),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: viewModel.editableAnswers.length,
              itemBuilder: (_, index) {
                StudentAnswerModel? q = viewModel.editableAnswers[index].answer;
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Question ${index + 1}",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  subtitle: Text(
                    "${q?.strand ?? '--'} G${q?.grade ?? '--'}",
                    style: theme.textTheme.labelMedium!.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                  trailing: Checkbox(
                    activeColor: theme.colorScheme.onPrimary,
                    checkColor: bgColor,
                    value: viewModel.isQuestionAnswered(index),
                    onChanged: (val) {},
                  ),
                  dense: true,
                  onTap: () => viewModel.pageController.jumpToPage(index),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: theme.colorScheme.onPrimary,
                thickness: 1,
              ),
            ),
          ),
        ),
        if (viewModel.examIsActive)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: pageSize.width * horizPadding,
              vertical: pageSize.width * 0.01,
            ),
            child: buildPriBtn(
              theme: theme,
              btnTxt: "Submit",
              iconPath: Icons.send,
              bgColor: viewModel.timerColor,
              fgColor: Colors.white,
              isFullWidth: true,
              onAction: viewModel.endExamSession,
            ),
          ),
        Center(
          child: Text(
            _formatTime(viewModel.timeRemaining),
            style: TextStyle(
                color: viewModel.timerColor, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        if (!isStringEmptyOrNull(viewModel.warningMessage))
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: pageSize.width * horizPadding),
              child: Text(
                viewModel.warningMessage,
                style: theme.textTheme.labelMedium!
                    .copyWith(color: viewModel.timerColor),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildQuestionPage(
    StudentAnswerEditModel q,
    StExamSessionViewModel viewModel,
    ThemeData theme,
    Size pageSize,
  ) {
    double horizPadding = 0.02;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey.shade200),
          padding: EdgeInsets.all(pageSize.width * 0.01),
          child: Row(
            children: [
              if (viewModel.currentIndex > 0)
                buildPriBtn(
                  theme: theme,
                  btnTxt: "Prev",
                  iconPath: Icons.arrow_back,
                  onAction: viewModel.prev,
                ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Question ${q.answer?.question_number ?? '--'}",
                      style: theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Text(
                      "${q.answer?.strand ?? '--'} G${q.answer?.grade ?? '--'}",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
              if (viewModel.currentIndex < viewModel.editableAnswers.length - 1)
                buildPriBtn(
                  theme: theme,
                  btnTxt: "Next",
                  iconPath: Icons.arrow_forward,
                  onAction: viewModel.next,
                ),
            ],
          ),
        ),
        Container(
          width: pageSize.width * 0.7,
          margin: EdgeInsets.all(pageSize.width * horizPadding),
          decoration: BoxDecoration(
            color: viewModel.timerColor.withOpacity(0.2),
            border: Border.all(color: viewModel.timerColor, width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(pageSize.width * horizPadding),
                child: Text(
                  q.answer?.question_description ?? '--',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              if (!isStringEmptyOrNull(q.answer?.description))
                Container(
                  width: pageSize.width * 0.7,
                  decoration: BoxDecoration(
                    color: viewModel.timerColor.withOpacity(0.3),
                    border: Border(
                        top: BorderSide(color: theme.colorScheme.outline)),
                  ),
                  padding: EdgeInsets.all(pageSize.width * horizPadding),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Your Answer: ',
                          style: TextStyle(
                              color: viewModel.timerColor,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: q.answer!.description!,
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        const Spacer(),
        if (viewModel.examIsActive) ...[
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: pageSize.width * horizPadding),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Answer",
                style: theme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: pageSize.width * horizPadding),
            child: Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    controller: q.descTxtCtrl,
                    hintText: "Type Answer here",
                    maxLines: 5,
                  ),
                ),
                SizedBox(width: pageSize.width * 0.01),
                buildSecBtn(
                  theme: theme,
                  btnTxt: "Confirm",
                  onAction: () {
                    viewModel.updateQuestionAnswer(q.answer?.id, q.descTxtCtrl);
                  },
                ),
              ],
            ),
          ),
        ],
        SizedBox(height: pageSize.height * 0.03),
      ],
    );
  }

  String _formatTime(Duration duration) {
    final h = duration.inHours;
    final m = duration.inMinutes % 60;
    final s = duration.inSeconds % 60;
    return "${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
  }

  @override
  StExamSessionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StExamSessionViewModel();
  @override
  void onViewModelReady(StExamSessionViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.onSingleStExamSessionViewReady();
  }

  @override
  void onDispose(StExamSessionViewModel viewModel) {
    viewModel.onDispose();
    super.onDispose(viewModel);
  }
}
