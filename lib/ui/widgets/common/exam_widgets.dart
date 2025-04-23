import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';

class ExamCard extends StatelessWidget {
  final ExamModel exam;
  final Function(ExamModel)? onTap;

  const ExamCard({
    super.key,
    required this.exam,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateStr = exam.start_time != null
        ? appDayDateFormat.format(exam.start_time!)
        : '--';
    final durationStr = exam.duration_min != null
        ? '${exam.duration_min! ~/ 60}hr ${exam.duration_min! % 60} minutes'
        : '--';

    return GestureDetector(
      onTap: onTap != null ? () => onTap!(exam) : null,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: theme.primaryColor,
              offset: const Offset(4, 4),
              spreadRadius: -1,
              blurRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.scroll,
                  size: theme.textTheme.headlineMedium!.fontSize,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exam ${exam.code ?? "--"}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text('Grade ${exam.classroom?.name ?? "--"} • $dateStr'),
                    Text(durationStr),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                buildStatusDot(
                  theme,
                  exam.status!.name.replaceFirst(
                      exam.status!.name[0], exam.status!.name[0].toUpperCase()),
                  getExamStatusColor(exam.status!, theme),
                ),
                if (onTap != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: buildSecBtn(
                      theme: theme,
                      btnTxt: "View",
                      iconPath: Icons.open_in_new,
                      onAction: () => onTap!(exam),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const String examStatGeneratingKw = "Generating";
const String examStatUpcomingKw = "Upcoming";
const String examStatOngoingKw = "Ongoing";
const String examStatGradingKw = "Grading";
const String examStatCompleteKw = "Complete";

const List<String> allExamStatuses = [
  examStatGeneratingKw,
  examStatUpcomingKw,
  examStatOngoingKw,
  examStatGradingKw,
  examStatCompleteKw,
];

Color getExamStatusColor(ExamStatus statusEnum, ThemeData theme) {
  switch (statusEnum) {
    case ExamStatus.generating:
      return appPeach;
    case ExamStatus.upcoming:
      return appBlue;
    case ExamStatus.ongoing:
      return appGreen;
    case ExamStatus.grading:
      return appPurple;
    case ExamStatus.complete:
      return theme.primaryColor;
    default:
      break;
  }

  return theme.primaryColor;
}
