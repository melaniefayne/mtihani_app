import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/views/exam_list/exam_list_view.dart';

class ExamResponsesWidget extends StatelessWidget {
  final ExamModel examItem;
  const ExamResponsesWidget({super.key, required this.examItem});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    ExamStatus examStatus = getExamEnumStatus(examItem.status);
    const List<ExamStatus> allowedStatus = [
      ExamStatus.complete,
      ExamStatus.grading,
      ExamStatus.ongoing
    ];

    return allowedStatus.contains(examStatus)
        ? buildWaitingWidget(pageSize.height)
        : SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "ExamResponsesWidget",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          );
  }
}
