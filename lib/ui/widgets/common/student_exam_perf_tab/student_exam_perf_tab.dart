import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/widgets/common/exam_widgets.dart';
import 'package:mtihani_app/ui/widgets/common/performance_widgets.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';
import 'package:stacked/stacked.dart';

import 'student_exam_perf_tab_model.dart';

class StudentExamPerfTab extends StackedView<StudentExamPerfTabModel> {
  final StudentExamSessionModel examSession;
  const StudentExamPerfTab({super.key, required this.examSession});

  @override
  Widget builder(
    BuildContext context,
    StudentExamPerfTabModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    if ((examSession.status) != getExamStatusStr(ExamStatus.complete)) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              astImagesWaiting,
              height: pageSize.height * 0.3,
            ),
            SizedBox(height: pageSize.height * 0.02),
            const Text(
              "Overall Performance will be available after analysis :)",
            ),
          ],
        ),
      );
    }

    if (viewModel.isBusy) {
      return buildLoadingWidget(theme, "Fetching student's performance");
    }

    if (viewModel.hasError) {
      return const Center(child: Text(errorOopsie));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: StudentExamPerformanceWidget(
        studentPerf: viewModel.data!,
      ),
    );
  }

  buildAnswersListSection({
    required ThemeData theme,
    required String title,
    required List<StudentAnswerModel> answers,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildHeaderWidget(
          theme: theme,
          title: title,
          leadingWidget: const Icon(FontAwesomeIcons.comment),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: answers.length,
          itemBuilder: (context, idx) {
            StudentAnswerModel answer = answers[idx];
            return ExamQuestionCard(
              question: ExamQuestionModel(
                description: answer.question_description,
                expected_answer: answer.expected_answer,
                strand: answer.strand,
                sub_strand: answer.sub_strand,
                grade: answer.grade,
                number: answer.question_number,
                bloom_skill: answer.bloom_skill,
              ),
              answer: answer,
            );
          },
        ),
      ],
    );
  }

  @override
  StudentExamPerfTabModel viewModelBuilder(
    BuildContext context,
  ) =>
      StudentExamPerfTabModel(examSession);
}
