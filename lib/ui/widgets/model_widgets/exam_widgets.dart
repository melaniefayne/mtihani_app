import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/constants/app_variables.dart';

class ExamList extends StatelessWidget {
  final List<ExamModel> examList;
  final Function(ExamModel exam) onViewExam;
  final Function? onViewMore;
  final Function onGenerateExam;

  const ExamList({
    super.key,
    required this.examList,
    required this.onViewExam,
    this.onViewMore,
    required this.onGenerateExam,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return examList.isEmpty
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildNoItemsWidget("You have no available exams"),
              buildPriBtn(
                theme: theme,
                btnTxt: "Generate Exam",
                isFullWidth: false,
                iconPath: FontAwesomeIcons.scroll,
                onAction: () => onGenerateExam(),
              ),
            ],
          )
        : Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: examList.length,
                itemBuilder: (context, idx) {
                  ExamModel exam = examList[idx];
                  return ExamCard(
                    exam: exam,
                    onTap: onViewExam,
                  );
                },
              ),
              if (onViewMore != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: buildPriBtn(
                    theme: theme,
                    btnTxt: "View More",
                    iconPath: Icons.read_more,
                    isFullWidth: false,
                    onAction: () => onViewMore!(),
                  ),
                ),
            ],
          );
  }
}

class ExamCard extends StatelessWidget {
  final ExamModel exam;
  final Function onTap;

  const ExamCard({
    super.key,
    required this.exam,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateStr = exam.start_time != null
        ? DateFormat('EEE, dd/MM/yyyy').format(exam.start_time!)
        : '--';
    final durationStr = exam.duration_min != null
        ? '${exam.duration_min! ~/ 60}hr ${exam.duration_min! % 60} minutes'
        : '--';

    return GestureDetector(
      onTap: () => onTap(exam),
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
                    Text('Grade ${exam.class_name ?? "--"} • $dateStr'),
                    Text(durationStr),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                buildExamStatus(theme, exam.status ?? "--"),
                const SizedBox(height: 8),
                buildSecBtn(
                  theme: theme,
                  btnTxt: "View",
                  isFullWidth: false,
                  iconPath: Icons.open_in_new,
                  onAction: () => onTap(exam),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildExamStatus(
  ThemeData theme,
  String status, {
  double iconSize = 14,
  TextStyle? txtStyle,
}) {
  Color examColor = getExamStatusColor(status, theme);
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.circle, size: iconSize, color: examColor),
      const SizedBox(width: 4),
      Text(
        status,
        style: txtStyle ?? theme.textTheme.labelMedium,
      ),
    ],
  );
}

Widget buildWaitingWidget(double pageHeight) {
  return Image.asset(
    astImagesWaiting,
    height: pageHeight * 0.3,
  );
}

const String examStatProcessingKw = "Processing";
const String examStatUpcomingKw = "Upcoming";
const String examStatOngoingKw = "Ongoing";
const String examStatGradingKw = "Grading";
const String examStatCompleteKw = "Complete";
const List<String> allExamStatuses = [
  examStatProcessingKw,
  examStatUpcomingKw,
  examStatOngoingKw,
  examStatGradingKw,
  examStatCompleteKw,
];

enum ExamStatus { processing, upcoming, ongoing, grading, complete }

ExamStatus getExamEnumStatus(String? statusStr) {
  switch (statusStr) {
    case examStatProcessingKw:
      return ExamStatus.processing;
    case examStatUpcomingKw:
      return ExamStatus.upcoming;
    case examStatOngoingKw:
      return ExamStatus.ongoing;
    case examStatGradingKw:
      return ExamStatus.grading;
    case examStatCompleteKw:
      return ExamStatus.complete;
    default:
      break;
  }
  return ExamStatus.processing;
}

Color getExamStatusColor(String? statusStr, ThemeData theme) {
  if (statusStr != null) {
    ExamStatus statusEnum = getExamEnumStatus(statusStr);
    switch (statusEnum) {
      case ExamStatus.processing:
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
  }
  return theme.primaryColor;
}
