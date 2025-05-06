import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/app/app.locator.dart';
import 'package:mtihani_app/models/cbc.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/services/cbc_service.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/widgets/app_carousel.dart';
import 'package:mtihani_app/ui/widgets/charts/app_bar_chart.dart';
import 'package:mtihani_app/ui/widgets/charts/app_linear_percent_chart.dart';
import 'package:mtihani_app/ui/widgets/charts/app_pie_donut_chart.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';

class ExamCard extends StatelessWidget {
  final ExamModel exam;
  final Function(ExamModel) onViewExam;
  final Function(ExamModel) onRetryExamGen;
  final Function() onRefresh;

  const ExamCard({
    super.key,
    required this.exam,
    required this.onViewExam,
    required this.onRetryExamGen,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateStr = exam.start_date_time != null
        ? shortDayDateFormat.format(exam.end_date_time!)
        : '--';
    final durationStr = exam.duration_min != null
        ? '${exam.duration_min! ~/ 60}hr ${exam.duration_min! % 60} minutes'
        : '--';
    final bool isFailedGen = exam.status == ExamStatus.failed;
    final bool isGenerating = exam.status == ExamStatus.generating;

    onExamAction() {
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
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: theme.primaryColor),
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
                      'Exam ${exam.code ?? "--"} (Grade ${exam.classroom_name})',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (!isGenerating)
                      isFailedGen
                          ? Text(
                              exam.generation_error ?? "Please contact support",
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.colorScheme.error,
                              ))
                          : Text(
                              '${exam.analysis?.question_count ?? "--"} Questions'),
                    Text("$dateStr • $durationStr"),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                buildExamStatusDot(theme, exam.status!),
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
List<String> allExamStatuses = ExamStatus.values
    .map((e) => e.name.replaceFirst(e.name[0], e.name[0].toUpperCase()))
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
    case ExamStatus.complete:
      return theme.primaryColor;
    case ExamStatus.archived:
      return Colors.grey;
    default:
      break;
  }

  return theme.primaryColor;
}

class ExamQuestionCard extends StatelessWidget {
  final ExamQuestionModel question;
  final Function(ExamQuestionModel question) onViewQuestion;
  final bool canEdit;

  const ExamQuestionCard({
    super.key,
    required this.question,
    required this.onViewQuestion,
    this.canEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () => onViewQuestion(question),
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
                  const SizedBox(width: 10),
                  buildIconBtn(
                    theme: theme,
                    iconPath: canEdit ? Icons.edit : Icons.read_more,
                  ),
                ],
              ),
            ),

            // Answer
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 10),
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
                      text: question.expected_answer ?? 'No answer provided.',
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),

            // Metadata footer
            Center(
              child: AppCarousel(
                children: [
                  _metaIconText(theme, pageSize, Icons.stairs_outlined, 'Grade',
                      gradeText(question.grade)),
                  _metaIconText(theme, pageSize, Icons.folder_copy, 'Strand',
                      question.strand),
                  _metaIconText(theme, pageSize, Icons.folder_open,
                      'Sub-Strand', question.sub_strand),
                  _metaIconText(theme, pageSize, Icons.psychology, 'Skill',
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

  Widget _metaIconText(ThemeData theme, Size pageSize, IconData icon,
      String label, String? value,
      {bool isLast = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        const SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$label ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              value ?? '—-',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        if (!isLast)
          Container(
            margin: EdgeInsets.symmetric(horizontal: pageSize.width * 0.035),
            width: 1,
            height: pageSize.height * 0.05,
            color: theme.colorScheme.outlineVariant,
          ),
      ],
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

    StrandModel? selectedStrand = _cbcService.getStrandByName(strandName);
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
        AppCarousel(
          children: [
            buildAnalysisSection(
              theme: theme,
              title: "Strand Distribution",
              width: pageSize.width * 0.25,
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
            buildVerticalDivider(pageSize),
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
      padding: const EdgeInsets.all(3),
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
