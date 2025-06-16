import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/services/cbc_service.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/widgets/app_carousel.dart';
import 'package:mtihani_app/ui/widgets/charts/app_bar_chart.dart';
import 'package:mtihani_app/ui/widgets/charts/app_linear_percent_chart.dart';
import 'package:mtihani_app/ui/widgets/charts/app_pie_donut_chart.dart';
import 'package:mtihani_app/ui/widgets/common/performance_widgets.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
import 'package:mtihani_app/utils/helpers/validators.dart';

class ExamCard extends StatelessWidget {
  final ExamModel exam;
  final Function(ExamModel) onViewExam;
  final Function(ExamModel) onRetryExamGen;
  final Function() onRefresh;
  final bool isStudent;

  const ExamCard({
    super.key,
    required this.exam,
    required this.onViewExam,
    required this.onRetryExamGen,
    required this.onRefresh,
    required this.isStudent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    final dateStr = exam.start_date_time != null
        ? shortDayDateFormat.format(exam.start_date_time!)
        : '--';
    final localStart = exam.start_date_time!.toLocal();
    final localEnd = exam.end_date_time!.toLocal();
    final timeStr =
        "${timeDateFormat.format(localStart)} to ${timeDateFormat.format(localEnd)}";

    final bool isFailedGen = exam.status == ExamStatus.failed;
    final bool isGenerating = exam.status == ExamStatus.generating;
    final bool hideActionBtn =
        isStudent && !studentViewExamStatuses.contains(exam.status);

    onExamAction() {
      if (hideActionBtn) return;

      if (isGenerating) {
        onRefresh();
        return;
      }

      if (isFailedGen) {
        onRetryExamGen(exam);
        return;
      }

      onViewExam(exam);
    }

    return GestureDetector(
      onTap: onExamAction,
      child: buildWhiteCard(
        theme,
        Row(
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
                      'Exam ${exam.code ?? "--"} (Grade ${exam.classroom_name})',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (!isGenerating)
                      isFailedGen
                          ? SizedBox(
                              width: pageSize.width * 0.7,
                              child: Text(
                                  exam.generation_error ??
                                      "Please contact support",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.colorScheme.error,
                                  )))
                          : Text(
                              '${exam.analysis?.question_count ?? "--"} Questions'),
                    Text("$dateStr • $timeStr"),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildExamStatusDot(theme, exam.status!),
                if (!hideActionBtn)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: buildSecBtn(
                      theme: theme,
                      btnTxt: isGenerating
                          ? "Refresh"
                          : isFailedGen
                              ? "Retry"
                              : "View",
                      iconPath: isGenerating
                          ? Icons.refresh
                          : isFailedGen
                              ? Icons.repeat
                              : Icons.open_in_new,
                      onAction: onExamAction,
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

Widget buildExamStatusDot(
  ThemeData theme,
  ExamStatus status, {
  double iconSize = 14,
  TextStyle? txtStyle,
}) {
  String statusLabel =
      status.name.replaceFirst(status.name[0], status.name[0].toUpperCase());
  Color statusColor = getExamStatusColor(status, theme);
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.circle, size: iconSize, color: statusColor),
      const SizedBox(width: 4),
      Text(
        statusLabel,
        style: txtStyle ?? theme.textTheme.labelMedium,
      ),
    ],
  );
}

const String examIsPublishedKw = "Published";
const String examIsUnpublishedKw = "Unpublished";
const List<String> allExamPublishStatuses = [
  examIsPublishedKw,
  examIsUnpublishedKw
];

List<ExamStatus> teacherOnlyStatuses = [
  ExamStatus.generating,
  ExamStatus.failed
];

List<ExamStatus> studentViewExamStatuses = [
  ExamStatus.ongoing,
  ExamStatus.grading,
  ExamStatus.analysing,
  ExamStatus.complete
];

List<String> allTrExamStatuses = ExamStatus.values
    .where((f) => f != ExamStatus.archived)
    .map((e) => getExamStatusStr(e))
    .toList();

String getExamStatusStr(ExamStatus status) {
  return status.name.replaceFirst(status.name[0], status.name[0].toUpperCase());
}

List<String> allStExamStatuses = ExamStatus.values
    .where((f) => !teacherOnlyStatuses.contains(f) && f != ExamStatus.archived)
    .map((e) => getExamStatusStr(e))
    .toList();

Color getExamStatusColor(ExamStatus statusEnum, ThemeData theme) {
  switch (statusEnum) {
    case ExamStatus.generating:
      return appPeach;
    case ExamStatus.failed:
      return appRed;
    case ExamStatus.upcoming:
      return appBlue;
    case ExamStatus.ongoing:
      return appGreen;
    case ExamStatus.grading:
      return appPurple;
    case ExamStatus.analysing:
      return appYellow;
    case ExamStatus.complete:
      return theme.primaryColor;
    case ExamStatus.archived:
      return Colors.grey;
  }
}

Color getAnswerColor(double? score, ThemeData theme) {
  switch (score) {
    case 0:
      return appRed;
    case 1:
      return appPeach;
    case 2:
      return appPurple;
    case 3:
      return appBlue;
    case 4:
      return appGreen;

    default:
      break;
  }

  return theme.primaryColor;
}

String getShortExpectationLevel(String? level) {
  if (isStringEmptyOrNull(level)) return "--";
  return "${level![0].toUpperCase()}.E";
}

class ExamQuestionCard extends StatelessWidget {
  final ExamQuestionModel question;
  final Function(ExamQuestionModel question)? onEditQuestion;
  final Function(ExamQuestionModel question)? onViewPerformance;
  final StudentAnswerModel? answer;
  final Function(StudentAnswerModel answer)? onEditAnswerScore;

  const ExamQuestionCard({
    super.key,
    required this.question,
    this.onEditQuestion,
    this.onViewPerformance,
    this.answer,
    this.onEditAnswerScore,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    final bool hasStudentAnswer = answer != null;
    final bool canEditAnswerScore =
        hasStudentAnswer && onEditAnswerScore != null;
    final bool canEditQuestion = !hasStudentAnswer && onEditQuestion != null;
    final bool canViewPerformance =
        !hasStudentAnswer && onViewPerformance != null;
    Color answerColor = getAnswerColor(answer?.score, theme);
    String answerLevel = getShortExpectationLevel(answer?.expectation_level);

    return GestureDetector(
      onTap: () {
        if (canViewPerformance) {
          onViewPerformance!(question);
          return;
        }

        if (canEditQuestion) {
          onEditQuestion!(question);
          return;
        }

        if (canEditAnswerScore) {
          onEditAnswerScore!(answer!);
          return;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          border: Border.all(color: theme.primaryColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: theme.primaryColor,
              offset: const Offset(4, 4),
              spreadRadius: -1,
              blurRadius: 0,
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question header
            Container(
              color: Colors.grey[800],
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: theme.colorScheme.secondaryContainer,
                    child: Text(
                      '${question.number ?? '?'}',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      question.description ?? 'No question provided.',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  if (canEditQuestion || canViewPerformance)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: buildIconBtn(
                        theme: theme,
                        iconPath:
                            canViewPerformance ? Icons.read_more : Icons.edit,
                      ),
                    ),
                  if (answer?.score != null)
                    Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onPrimary,
                        border: Border.all(color: answerColor, width: 1),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      margin: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${answer?.score} • $answerLevel",
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: answerColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (canEditAnswerScore)
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: buildIconBtn(
                                theme: theme,
                                iconPath: Icons.edit,
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            // Answers
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    const TextSpan(
                      text: '✔ ',
                      style: TextStyle(color: appGreen),
                    ),
                    TextSpan(
                      text: question.expected_answer ??
                          'No expected answer provided.',
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
            if (hasStudentAnswer)
              Container(
                width: double.infinity,
                color: answerColor.withValues(alpha: 0.2),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                          text: '=> ', style: TextStyle(color: answerColor)),
                      TextSpan(
                        text: isStringEmptyOrNull(answer?.description)
                            ? 'No student answer provided.'
                            : answer!.description,
                        style: TextStyle(
                            fontStyle: FontStyle.italic, color: answerColor),
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 10),

            // Metadata footer
            Center(
              child: AppCarousel(
                children: [
                  metaIconText(theme, pageSize, Icons.stairs_outlined, 'Grade',
                      gradeText(question.grade)),
                  metaIconText(theme, pageSize, Icons.folder_copy, 'Strand',
                      question.strand),
                  metaIconText(theme, pageSize, Icons.folder_open, 'Sub-Strand',
                      question.sub_strand),
                  metaIconText(theme, pageSize, Icons.psychology, 'Skill',
                      question.bloom_skill,
                      isLast: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExamQuestionAnalysisSection extends StatefulWidget {
  final ExamQuestionAnalysisModel questionAnalysis;
  const ExamQuestionAnalysisSection({
    super.key,
    required this.questionAnalysis,
  });

  @override
  State<ExamQuestionAnalysisSection> createState() =>
      _ExamQuestionAnalysisSectionState();
}

class _ExamQuestionAnalysisSectionState
    extends State<ExamQuestionAnalysisSection> {
  final _cbcService = locator<CbcService>();
  List<double> subStrandValues = [];
  List<String> subStrandLabels = [];
  String? selectedStrandName;

  @override
  void initState() {
    super.initState();
    List<ScoreModel> strandDist =
        widget.questionAnalysis.strand_distribution ?? [];
    if (strandDist.isNotEmpty) onStrandTap(strandDist.first.name);
  }

  onStrandTap(String strandName) {
    if (strandName == selectedStrandName) return;

    StrandModel? selectedStrand =
        _cbcService.getStrandByName(strandName.split('(').first.trim());
    if (selectedStrand != null) {
      setState(() {
        selectedStrandName = strandName;
        List<String> selectedStrandSubStrandNames = _cbcService
            .getAllSubStrandsForStrand(selectedStrand.id)
            .map((e) => e.name ?? "--")
            .toList();
        List<ScoreModel> selectedSubStrands =
            (widget.questionAnalysis.sub_strand_distribution ?? [])
                .where((e) => selectedStrandSubStrandNames.contains(e.name))
                .toList();
        subStrandValues =
            selectedSubStrands.map((e) => e.count?.toDouble() ?? 0.0).toList();
        subStrandLabels =
            selectedSubStrands.map((e) => e.name?.toString() ?? "--").toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    final double firstSecWidth = pageSize.width * 0.15;
    final double topSecWidth = pageSize.width * 0.25;
    const double pieChartHeight = 150;
    return Column(
      children: [
        AppCarousel(
          children: [
            buildAnalysisSection(
              theme: theme,
              title: "Count",
              width: firstSecWidth,
              mainWidget: CircleAvatar(
                radius: firstSecWidth * 0.35,
                backgroundColor: theme.colorScheme.primary,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.questionAnalysis.question_count?.toString() ??
                          "--",
                      style: theme.textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimary),
                    ),
                    Text(
                      "Questions",
                      style: theme.textTheme.titleMedium!
                          .copyWith(color: theme.colorScheme.onPrimary),
                    )
                  ],
                ),
              ),
            ),
            buildVerticalDivider(pageSize),
            buildAnalysisSection(
              theme: theme,
              title: "Grade Distribution",
              width: topSecWidth,
              mainWidget: AppPieDonutChart(
                dataSeries: (widget.questionAnalysis.grade_distribution ?? [])
                    .map((e) => e.count?.toDouble() ?? 0.0)
                    .toList(),
                pieLabels: (widget.questionAnalysis.grade_distribution ?? [])
                    .map((e) => "Grade ${e.name?.toString() ?? "--"}")
                    .toList(),
                chartHeight: pieChartHeight,
              ),
            ),
            buildVerticalDivider(pageSize),
            buildAnalysisSection(
              theme: theme,
              title: "Bloom Skill Distribution",
              width: topSecWidth,
              mainWidget: AppPieDonutChart(
                dataSeries:
                    (widget.questionAnalysis.bloom_skill_distribution ?? [])
                        .map((e) => e.count?.toDouble() ?? 0.0)
                        .toList(),
                pieLabels:
                    (widget.questionAnalysis.bloom_skill_distribution ?? [])
                        .map((e) => e.name?.toString() ?? "--")
                        .toList(),
                chartDirection: Axis.horizontal,
                chartHeight: pieChartHeight,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(),
        ),
        Row(
          children: [
            buildAnalysisSection(
              theme: theme,
              title: "Strand Distribution",
              width: pageSize.width * 0.3,
              mainWidget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Select a strand to view it's sub-strand distribution",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall,
                  ),
                  AppLinearPercentChart(
                    dataSeries:
                        (widget.questionAnalysis.strand_distribution ?? [])
                            .map((e) => e.count?.toDouble() ?? 0.0)
                            .toList(),
                    chartLabels:
                        (widget.questionAnalysis.strand_distribution ?? [])
                            .map((e) => e.name?.toString() ?? "--")
                            .toList(),
                    onChartTileTap: onStrandTap,
                    selectedTile: selectedStrandName,
                  ),
                ],
              ),
            ),
            SizedBox(width: pageSize.width * 0.01),
            buildVerticalDivider(pageSize),
            SizedBox(width: pageSize.width * 0.01),
            buildAnalysisSection(
              theme: theme,
              title:
                  "Sub-strand Distribution ${selectedStrandName != null ? ": $selectedStrandName" : ""}",
              width: pageSize.width * 0.45,
              isSubSection: true,
              mainWidget: subStrandValues.isEmpty && subStrandLabels.isEmpty
                  ? const Center(
                      child: Text(
                        "Select a strand to view it's sub-strand distribution",
                        textAlign: TextAlign.center,
                      ),
                    )
                  : AppBarChart(
                      dataSeries: [subStrandValues],
                      xAxisLabels: subStrandLabels,
                      seriesColors: [theme.primaryColor],
                    ),
            )
          ],
        ),
        if ((widget.questionAnalysis.untested_strands ?? []).isNotEmpty)
          buildAnalysisSection(
            theme: theme,
            title: "Untested Strands",
            mainWidget: Text(
              widget.questionAnalysis.untested_strands!.join(', '),
              style: theme.textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
      ],
    );
  }

  buildAnalysisSection({
    required ThemeData theme,
    required String title,
    required Widget mainWidget,
    bool isSubSection = false,
    double? width,
  }) {
    return Container(
      width: width,
      color: isSubSection ? theme.colorScheme.primaryContainer : null,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: isSubSection
                ? null
                : theme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Center(child: mainWidget),
        ],
      ),
    );
  }

  buildVerticalDivider(Size pageSize) {
    return Container(
      color: Colors.grey,
      width: 1,
      height: pageSize.height * 0.3,
      margin: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}

Widget buildQuestionSummary({
  required ThemeData theme,
  required Size pageSize,
  required ExamQuestionModel examQuestion,
  bool hideDescription = false,
}) {
  double metaSize = pageSize.width * 0.024;
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      AppCarousel(
        waitTime: 5,
        children: [
          metaIconText(theme, pageSize, Icons.onetwothree, 'Question Number',
              examQuestion.number?.toString(),
              spacing: metaSize),
          metaIconText(theme, pageSize, Icons.star, 'Grade',
              gradeText(examQuestion.grade),
              spacing: metaSize),
          metaIconText(
              theme, pageSize, Icons.folder_copy, 'Strand', examQuestion.strand,
              spacing: metaSize),
          metaIconText(theme, pageSize, Icons.folder_open, 'Sub-Strand',
              examQuestion.sub_strand,
              isLast: true, spacing: metaSize),
        ],
      ),
      const Divider(),
      if (!hideDescription)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            examQuestion.description ?? "--",
            textAlign: TextAlign.center,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
    ],
  );
}

Widget buildClusterCard(
    {required ClassExamPerfClusterModel cluster, double? width}) {
  return CompactInfoCard(
    title: cluster.cluster_label ?? "--",
    iconPath: Icons.group_outlined,
    width: width,
    bgColor: kcLightGrey,
    infoItems: [
      {
        "name": "Student Count",
        "value": "${cluster.cluster_size ?? 0}",
      },
      {
        "name": "Avg. Score",
        "value": "${cluster.avg_score ?? 0.0}%",
      },
      {
        "name": "Best Strand",
        "value":
            "${cluster.strand_scores?.first.name ?? "--"}: ${cluster.strand_scores?.first.percentage ?? "--"}%",
      },
      {
        "name": "Worst Strand",
        "value":
            "${cluster.strand_scores?.last.name ?? "--"}: ${cluster.strand_scores?.last.percentage ?? "--"}%",
      },
      {
        "name": "Best Skill",
        "value":
            "${cluster.bloom_skill_scores?.first.name ?? "--"}: ${cluster.bloom_skill_scores?.first.percentage ?? "--"}%",
      },
      {
        "name": "Worst Skill",
        "value":
            "${cluster.bloom_skill_scores?.last.name ?? "--"}: ${cluster.bloom_skill_scores?.last.percentage ?? "--"}%",
      },
    ],
  );
}
