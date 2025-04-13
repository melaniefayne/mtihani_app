import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/widgets/model_widgets/exam_widgets.dart';

class ExamPerformanceWidget extends StatelessWidget {
  final ExamModel examItem;
  const ExamPerformanceWidget({super.key, required this.examItem});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    ExamStatus examStatus = getExamEnumStatus(examItem.status);
    const List<ExamStatus> allowedStatus = [ExamStatus.complete];
    return allowedStatus.contains(examStatus)
        ? buildWaitingWidget(pageSize.height)
        : SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "ExamPerformanceWidget",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          );
  }
}
