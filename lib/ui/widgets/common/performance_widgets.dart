import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/icon_mapper.dart';
import 'package:mtihani_app/ui/widgets/app_animated_counter.dart';
import 'package:mtihani_app/ui/widgets/app_filters.dart';
import 'package:mtihani_app/ui/widgets/app_text_carousel.dart';
import 'package:mtihani_app/ui/widgets/charts/app_bar_chart.dart';
import 'package:mtihani_app/ui/widgets/charts/app_grid_chart.dart';
import 'package:mtihani_app/ui/widgets/charts/app_heat_map.dart';
import 'package:mtihani_app/ui/widgets/charts/app_linear_percent_chart.dart';
import 'package:mtihani_app/ui/widgets/charts/app_percent_charts.dart';
import 'package:mtihani_app/ui/widgets/charts/app_pie_donut_chart.dart';
import 'package:mtihani_app/ui/widgets/common/exam_widgets.dart';
import 'package:mtihani_app/ui/widgets/global_widgets.dart';

class ScoreVarianceCard extends StatelessWidget {
  final ScoreModel? variance;

  const ScoreVarianceCard({
    Key? key,
    this.variance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.labelSmall;
    final valueStyle =
        theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatColumn(
              Icons.trending_up,
              'Max',
              variance?.max ?? 0.0,
              textStyle,
              valueStyle,
              theme.colorScheme.secondaryContainer,
            ),
            _buildStatColumn(
              Icons.trending_down,
              'Min',
              variance?.min ?? 0.0,
              textStyle,
              valueStyle,
              theme.colorScheme.secondaryContainer,
            ),
            _buildStatColumn(
              Icons.stacked_line_chart,
              'Std Dev',
              variance?.std_dev ?? 0.0,
              textStyle,
              valueStyle,
              theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(
    IconData icon,
    String label,
    double value,
    TextStyle? labelStyle,
    TextStyle? valueStyle,
    Color mainColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28, color: mainColor),
          Text(label, style: labelStyle),
          AppAnimatedCounter(
            valueToAnimate: value,
            postTexts: [
              TextSpan(text: "%", style: labelStyle),
            ],
          ),
        ],
      ),
    );
  }
}

class CompactInfoCard extends StatelessWidget {
  final String title;
  final IconData iconPath;
  final List<Map<String, String>> infoItems;
  final VoidCallback? onTap;
  final Function(Map<String, String> item)? onInfoItemTap;
  final Color? bgColor;
  final Color? fgColor;
  final double? width;

  const CompactInfoCard({
    super.key,
    required this.title,
    required this.iconPath,
    required this.infoItems,
    this.onTap,
    this.onInfoItemTap,
    this.bgColor,
    this.fgColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(12),
        color: bgColor ?? Colors.grey.shade200,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Icon Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600, color: fgColor),
                    ),
                    Icon(iconPath, size: 24, color: fgColor),
                  ],
                ),
                const SizedBox(height: 4),
                Divider(thickness: 1, color: fgColor),
                const SizedBox(height: 4),

                // Info rows
                for (final item in infoItems)
                  GestureDetector(
                    onTap: () {
                      if (onInfoItemTap != null) {
                        onInfoItemTap!(item);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Text(
                            item['name'] ?? '',
                            style: theme.textTheme.bodySmall!
                                .copyWith(color: fgColor),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Divider(color: fgColor),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                item['value'] ?? '',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                    color: fgColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              if (onInfoItemTap != null)
                                Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: CircleAvatar(
                                    backgroundColor: fgColor,
                                    foregroundColor: bgColor,
                                    radius: theme.textTheme.bodySmall!.fontSize,
                                    child: Icon(
                                      Icons.call_made,
                                      size: theme.textTheme.bodySmall!.fontSize,
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildPerfSection({
  required ThemeData theme,
  required Size pageSize,
  required List<Widget> children,
  IconData? iconPath,
  String? title,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: pageSize.height * 0.02),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (iconPath != null && title != null)
          buildHeaderWidget(
            theme: theme,
            title: title,
            leadingWidget: Icon(iconPath),
          ),
        ...children,
      ],
    ),
  );
}

Widget buildAvgScoreSection({
  required ThemeData theme,
  required Size pageSize,
  double? avgScore,
  String? avgExpectationLevel,
  List<ScoreModel>? otherScores,
  double? bigRadius,
  double? smallRadius,
  double? classAvgDiff,
}) {
  return buildPerfSection(
    theme: theme,
    pageSize: pageSize,
    children: [
      AppHalfArcPercentChart(
        percent: avgScore ?? 0.0,
        centerRadius: bigRadius,
        center: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Average Score"),
            AppAnimatedCounter(
              valueToAnimate: avgScore ?? 0,
              startValue: 0,
              postTexts: [
                TextSpan(text: "%", style: theme.textTheme.titleMedium),
                if (avgExpectationLevel != null) ...[
                  const TextSpan(text: ' • '),
                  TextSpan(
                    text: getShortExpectationLevel(avgExpectationLevel),
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ],
            ),
            if (classAvgDiff != null)
              Text(
                classAvgDiff == 0
                    ? 'Equal to Class Average'
                    : '$classAvgDiff% ${classAvgDiff < 0 ? 'Below' : 'Above'} Class Average',
                style: theme.textTheme.bodySmall,
              ),
          ],
        ),
      ),
      SizedBox(height: pageSize.height * 0.02),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: (otherScores ?? [])
            .map(
              (e) => AppCircularPercentChart(
                percent: e.percentage ?? 0.0,
                title: e.name,
                centerRadius: smallRadius,
              ),
            )
            .toList(),
      ),
    ],
  );
}

class StrandPerformanceWidget extends StatefulWidget {
  final StrandPerformanceModel strandData;
  final Function(Map<String, String> item)? onInfoItemTap;
  const StrandPerformanceWidget({
    super.key,
    required this.strandData,
    this.onInfoItemTap,
  });

  @override
  State<StrandPerformanceWidget> createState() =>
      _StrandPerformanceWidgetState();
}

class _StrandPerformanceWidgetState extends State<StrandPerformanceWidget> {
  ScoreModel? selectedSubStrand;

  @override
  void initState() {
    super.initState();
    selectedSubStrand = widget.strandData.sub_strand_scores?.firstOrNull;
  }

  onSubStrandTap(String subStrandName) {
    setState(() {
      selectedSubStrand = (widget.strandData.sub_strand_scores ?? [])
          .firstWhere((e) => e.name == subStrandName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    const double spacing = 0.04;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: pageSize.height * spacing),
        Stack(
          alignment: Alignment.topRight,
          children: [
            buildAvgScoreSection(
              theme: theme,
              pageSize: pageSize,
              avgScore: widget.strandData.avg_score,
              avgExpectationLevel: widget.strandData.avg_expectation_level,
              otherScores: widget.strandData.bloom_skill_scores,
            ),
            ScoreVarianceCard(variance: widget.strandData.score_variance),
          ],
        ),

        //
        if ((widget.strandData.insights ?? []).isNotEmpty) ...[
          SizedBox(height: pageSize.height * spacing),
          AppTextCarousel(
              title: 'Insights', texts: widget.strandData.insights!),
        ],

        //
        if ((widget.strandData.top_students ?? []).isNotEmpty) ...[
          SizedBox(height: pageSize.height * spacing),
          buildSubTitle(
            theme: theme,
            title: 'Student Mastery',
            subtitle: '',
          ),
          Row(
            children: [
              Expanded(
                child: CompactInfoCard(
                  title: "Top Percentile",
                  iconPath: Icons.arrow_upward,
                  bgColor: kcLightGrey,
                  fgColor: theme.primaryColor,
                  onInfoItemTap: widget.onInfoItemTap,
                  infoItems: (widget.strandData.top_students ?? [])
                      .map((e) => {
                            "name": e.student_name ?? "--",
                            "value":
                                "${e.avg_score}% • ${(e.avg_expectation_level ?? "Below")[0].toUpperCase()}E",
                          })
                      .toList(),
                ),
              ),
              SizedBox(width: pageSize.width * 0.01),
              Expanded(
                child: CompactInfoCard(
                  title: "Bottom Percentile",
                  iconPath: Icons.arrow_downward,
                  onInfoItemTap: widget.onInfoItemTap,
                  bgColor: kcMediumGrey,
                  fgColor: Colors.white,
                  infoItems: (widget.strandData.bottom_students ?? [])
                      .map((e) => {
                            "name": e.student_name ?? "--",
                            "value":
                                "${e.avg_score}% • ${(e.avg_expectation_level ?? "Below")[0].toUpperCase()}E",
                          })
                      .toList(),
                ),
              ),
            ],
          ),
        ],

        //
        if ((widget.strandData.sub_strand_scores ?? []).isNotEmpty) ...[
          SizedBox(height: pageSize.height * spacing),
          buildSubTitle(
            theme: theme,
            title: 'Sub-Strand Performance',
            subtitle: '',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: pageSize.width * 0.4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Select a sub-strand to view it's analysis",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall,
                    ),
                    AppLinearPercentChart(
                      showPercentages: false,
                      indicatorPostfix: '%',
                      dataSeries: (widget.strandData.sub_strand_scores ?? [])
                          .map((e) => e.percentage?.toDouble() ?? 0.0)
                          .toList(),
                      chartLabels: (widget.strandData.sub_strand_scores ?? [])
                          .map((e) => e.name?.toString() ?? "--")
                          .toList(),
                      onChartTileTap: onSubStrandTap,
                      selectedTile: selectedSubStrand?.name,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: pageSize.width * 0.27,
                child: selectedSubStrand == null
                    ? const Center(
                        child: Text(
                          "Select a strand to view it's sub-strand distribution",
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            selectedSubStrand!.name,
                            style: theme.textTheme.titleMedium,
                          ),
                          AppAnimatedCounter(
                            valueToAnimate:
                                selectedSubStrand!.percentage ?? 0.0,
                            startValue: 0,
                            textStyle: theme.textTheme.displayLarge,
                            postTexts: [
                              TextSpan(
                                  text: "%",
                                  style: theme.textTheme.titleMedium),
                            ],
                          ),
                          if (selectedSubStrand?.difference != null) ...[
                            const Divider(),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${selectedSubStrand!.difference}% ",
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: theme.primaryColor),
                                  ),
                                  TextSpan(
                                    text: selectedSubStrand!.difference_desc ??
                                        "--",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
              ),
            ],
          ),
        ],

        //
        if ((widget.strandData.suggestions ?? []).isNotEmpty) ...[
          SizedBox(height: pageSize.height * spacing),
          AppTextCarousel(
            title: 'Recommendations',
            texts: widget.strandData.suggestions ?? [],
          ),
        ],

        SizedBox(height: pageSize.height * spacing),
      ],
    );
  }
}

class FlaggedSubStrandCard extends StatelessWidget {
  final FlaggedSubStrandModel model;

  const FlaggedSubStrandCard({super.key, required this.model});

  Color getCorrelationColor(double? value) {
    if (value == null) return kcLightGrey;
    if (value.abs() < 0.3) return appGreen;
    if (value.abs() < 0.6) return appPeach;
    return appRed;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pairDisplay = model.pair?.join(" ↔ ") ?? "Unspecified Pair";
    final corr = model.correlation != null
        ? model.correlation!.toStringAsFixed(2)
        : "N/A";

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    pairDisplay,
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: getCorrelationColor(model.correlation),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Corr: $corr",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Side-by-side layout
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (model.insight != null)
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "💡 Insight",
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          model.insight!,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                const SizedBox(width: 20),
                if (model.suggestion != null)
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "✅ Suggestion",
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          model.suggestion!,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
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

class StudentExamPerformanceWidget extends StatefulWidget {
  final StudentExamSessionPerformanceModel studentPerf;
  const StudentExamPerformanceWidget({
    super.key,
    required this.studentPerf,
  });

  @override
  State<StudentExamPerformanceWidget> createState() =>
      _StudentExamPerformanceWidgetState();
}

class _StudentExamPerformanceWidgetState
    extends State<StudentExamPerformanceWidget> {
  List<double> gradeScores = [];
  List<String> gradeNames = [];
  List<IconData> gradeIcons = [];

  List<double> strandScores = [];
  List<String> strandNames = [];
  List<IconData> strandIcons = [];

  String? selectedStrandName;
  List<double> subStrandValues = [];
  List<String> subStrandLabels = [];

  @override
  void initState() {
    super.initState();
    gradeScores = (widget.studentPerf.grade_scores ?? [])
        .map((e) => (e.percentage ?? 0).toDouble())
        .toList();
    gradeNames = (widget.studentPerf.grade_scores ?? [])
        .map((e) => ("Grade ${e.name.toString()}"))
        .toList();
    gradeIcons =
        gradeNames.map((e) => (appIconMapper[e] ?? Icons.category)).toList();

    strandScores = (widget.studentPerf.strand_scores ?? [])
        .map((e) => (e.percentage ?? 0).toDouble())
        .toList();
    strandNames = (widget.studentPerf.strand_scores ?? [])
        .map((e) => e.name.toString())
        .toList();
    strandIcons = strandNames
        .map((e) => (appIconMapper[e.split(' (').first] ?? Icons.category))
        .toList();

    print(strandNames);

    if (strandNames.isNotEmpty) onStrandTap(strandNames.first);
  }

  onStrandTap(String strandName) {
    if (strandName == selectedStrandName) return;
    selectedStrandName = strandName;
    ScoreModel? selectedStrand = (widget.studentPerf.strand_scores ?? [])
        .where((e) => e.name == strandName)
        .firstOrNull;
    if (selectedStrand != null) {
      subStrandValues = (selectedStrand.sub_strands ?? [])
          .map((e) => e.percentage ?? 0.0)
          .toList();
      subStrandLabels = (selectedStrand.sub_strands ?? [])
          .map((e) => e.name.toString())
          .toList();
    } else {
      subStrandLabels = [];
      subStrandValues = [];
    }

    print(subStrandLabels);
    print(subStrandValues);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        if (widget.studentPerf.completion_rate != null)
          buildWhiteCard(
            theme,
            Center(
              child: Text.rich(
                TextSpan(
                  children: widget.studentPerf.completion_rate == null
                      ? [
                          TextSpan(
                            text: widget.studentPerf.exam_count?.toString() ??
                                "--",
                            style: theme.textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.primaryColor),
                          ),
                          const TextSpan(text: " Exams"),
                        ]
                      : [
                          TextSpan(
                            text:
                                "${widget.studentPerf.completion_rate?.toString() ?? '--'}%",
                            style: theme.textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.primaryColor),
                          ),
                          const TextSpan(text: " Completion Rate"),
                          TextSpan(
                              text:
                                  " (${widget.studentPerf.questions_answered}/${(widget.studentPerf.questions_unanswered ?? 0) + (widget.studentPerf.questions_answered ?? 0)})"),
                        ],
                ),
              ),
            ),
          ),

        //
        buildAvgScoreSection(
          theme: theme,
          pageSize: pageSize,
          avgScore: widget.studentPerf.avg_score,
          avgExpectationLevel: widget.studentPerf.avg_expectation_level,
          otherScores: widget.studentPerf.bloom_skill_scores,
          classAvgDiff: widget.studentPerf.class_avg_difference,
        ),

        //
        buildHeaderWidget(
          theme: theme,
          title: "Grade Performance",
          leadingWidget: const Icon(FontAwesomeIcons.stairs),
        ),
        AppGridChart(
          dataSeries: gradeScores,
          chartLabels: gradeNames,
          cardIcons: gradeIcons,
          showPercentages: false,
          valuePostfix: '%',
          crossCount: 1,
          cardAspectRatio: 10,
        ),

        //
        buildPerfSection(
          theme: theme,
          pageSize: pageSize,
          title: "Strand Scores",
          iconPath: Icons.folder_copy,
          children: [
            Row(
              children: [
                SizedBox(
                  width: pageSize.width * 0.3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Select a strand to view the student's sub-strand score distribution",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall,
                      ),
                      AppLinearPercentChart(
                        dataSeries: strandScores,
                        chartLabels: strandNames,
                        leadingWidgets:
                            strandIcons.map((e) => Icon(e)).toList(),
                        onChartTileTap: onStrandTap,
                        selectedTile: selectedStrandName,
                        indicatorPostfix: '%',
                      ),
                    ],
                  ),
                ),
                buildVerticalDivider(pageSize),
                SizedBox(
                  width: pageSize.width * 0.43,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          top: pageSize.height * 0.05),
                      child: subStrandValues.isEmpty
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
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        //
        if ((widget.studentPerf.best_5_answers ?? []).isNotEmpty)
          buildAnswersListSection(
            theme: theme,
            title: "Best 5 Answers",
            answers: widget.studentPerf.best_5_answers!,
          ),
        if ((widget.studentPerf.worst_5_answers ?? []).isNotEmpty)
          buildAnswersListSection(
            theme: theme,
            title: "Last 5 Answers",
            answers: widget.studentPerf.worst_5_answers!,
          ),
      ],
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
}

class ClassExamPerformanceWidget extends StatefulWidget {
  final ClassExamPerformanceModel classPerf;
  final Function(Map<String, String> item)? onStrandStudentItemTap;

  const ClassExamPerformanceWidget({
    super.key,
    required this.classPerf,
    this.onStrandStudentItemTap,
  });

  @override
  State<ClassExamPerformanceWidget> createState() =>
      _ClassExamPerformanceWidgetState();
}

class _ClassExamPerformanceWidgetState
    extends State<ClassExamPerformanceWidget> {
  StrandPerformanceModel? selectedStrand;

  @override
  void initState() {
    setState(() {
      selectedStrand = widget.classPerf.strand_analysis?.firstOrNull;
    });
    super.initState();
  }

  onChangeStrand(StrandPerformanceModel strandData) {
    selectedStrand = strandData;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        buildWhiteCard(
          theme,
          Center(
            child: Text.rich(
              TextSpan(
                children: widget.classPerf.student_count == null
                    ? [
                        TextSpan(
                          text: widget.classPerf.exam_count?.toString() ?? "--",
                          style: theme.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.primaryColor),
                        ),
                        const TextSpan(text: " Exams"),
                      ]
                    : [
                        TextSpan(
                          text: widget.classPerf.student_count?.toString() ??
                              "--",
                          style: theme.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.primaryColor),
                        ),
                        const TextSpan(text: " Students"),
                      ],
              ),
            ),
          ),
        ),

        //
        buildAvgScoreSection(
          theme: theme,
          pageSize: pageSize,
          avgScore: widget.classPerf.avg_score,
          avgExpectationLevel: widget.classPerf.avg_expectation_level,
          otherScores: widget.classPerf.bloom_skill_scores,
        ),

        //
        if ((widget.classPerf.score_distribution ?? []).isNotEmpty)
          buildScoreDistSection(
            theme: theme,
            pageSize: pageSize,
            classPerf: widget.classPerf,
          ),

        //
        buildStrandOverviewSection(
          theme: theme,
          pageSize: pageSize,
          classPerf: widget.classPerf,
        ),

        //
        if ((widget.classPerf.strand_analysis ?? []).isNotEmpty)
          buildPerfSection(
            theme: theme,
            pageSize: pageSize,
            children: [
              AppPageFilters(
                fullWidth: pageSize.width * 0.8,
                filters: [
                  AppFilterItem(
                    label: "Strand",
                    selectedValue: selectedStrand,
                    onChanged: (val) {
                      onChangeStrand(val);
                    },
                    items: widget.classPerf.strand_analysis!
                        .map<DropdownMenuItem<StrandPerformanceModel>>(
                            (StrandPerformanceModel value) {
                      return DropdownMenuItem<StrandPerformanceModel>(
                        value: value,
                        child: Text(value.name ?? '--'),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Container(
                color: theme.colorScheme.primaryContainer,
                padding: const EdgeInsets.all(16),
                child: selectedStrand == null
                    ? const Center(
                        child: Text("Select a strand to view it's analysis",
                            textAlign: TextAlign.center),
                      )
                    : StrandPerformanceWidget(
                        key: ValueKey(selectedStrand!.name),
                        strandData: selectedStrand!,
                        onInfoItemTap: widget.onStrandStudentItemTap,
                      ),
              ),
            ],
          ),

        if ((widget.classPerf.flagged_sub_strands ?? []).isNotEmpty)
          buildPerfSection(
            theme: theme,
            pageSize: pageSize,
            title: "Interesting correlations",
            iconPath: Icons.compare_arrows,
            children: widget.classPerf.flagged_sub_strands!
                .map(
                  (e) => FlaggedSubStrandCard(model: e),
                )
                .toList(),
          ),
      ],
    );
  }

  Widget buildScoreDistSection({
    required ThemeData theme,
    required Size pageSize,
    required ClassExamPerformanceModel classPerf,
  }) {
    List<double> scoreCounts = (classPerf.score_distribution ?? [])
        .map((e) => (e.count ?? 0).toDouble())
        .toList();
    List<String> countLabels = (classPerf.score_distribution ?? [])
        .map((e) => (e.name.toString()))
        .toList();

    List<double> levelCounts = (classPerf.expectation_level_distribution ?? [])
        .map((e) => (e.count ?? 0).toDouble())
        .toList();
    List<String> levelLabels = (classPerf.expectation_level_distribution ?? [])
        .map((e) => (e.name.toString()))
        .toList();

    List<double> gradeScores = (classPerf.grade_scores ?? [])
        .map((e) => (e.percentage ?? 0).toDouble())
        .toList();
    List<String> gradeNames = (classPerf.grade_scores ?? [])
        .map((e) => ("Grade ${e.name.toString()}"))
        .toList();
    List<IconData> gradeIcons =
        gradeNames.map((e) => (appIconMapper[e] ?? Icons.category)).toList();

    return buildPerfSection(
      theme: theme,
      pageSize: pageSize,
      title: "Average Score Analysis",
      iconPath: Icons.analytics_outlined,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            AppBarChart(
              chartHeight: pageSize.height * 0.3,
              dataSeries: [scoreCounts],
              xAxisLabels: countLabels,
              chartTitle: 'Avg. Score Distribution',
              seriesColors: const [kcDarkGreyColor],
            ),
            ScoreVarianceCard(variance: classPerf.score_variance),
          ],
        ),
        AppTextCarousel(
          title: 'Insights',
          texts: classPerf.general_insights ?? [],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: pageSize.width * 0.4,
              child: AppGridChart(
                chartTitle: 'Grade Performance',
                dataSeries: gradeScores,
                chartLabels: gradeNames,
                cardIcons: gradeIcons,
                showPercentages: false,
                valuePostfix: '%',
                crossCount: 1,
                cardAspectRatio: 7,
              ),
            ),
            Expanded(
              child: AppPieDonutChart(
                dataSeries: levelCounts,
                pieLabels: levelLabels,
                chartTitle: 'Avg. Expectation Level Distribution',
                chartDirection: Axis.horizontal,
                pieColors: defaultChartColors.reversed.toList(),
                onPieColors: defaultChartColors.reversed
                    .toList()
                    .map((e) => defaultTextChartColors[e] ?? Colors.white)
                    .toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStrandOverviewSection({
    required ThemeData theme,
    required Size pageSize,
    required ClassExamPerformanceModel classPerf,
  }) {
    const double spacing = 0.04;
    List<double> strandScores = (classPerf.strand_analysis ?? [])
        .map((e) => (e.avg_score ?? 0).toDouble())
        .toList();
    List<String> strandNames = (classPerf.strand_analysis ?? [])
        .map((e) => (e.name.toString()))
        .toList();
    List<IconData> strandIcons = strandNames
        .map(
            (e) => (appIconMapper[e.split('(').first.trim()] ?? Icons.category))
        .toList();

    return buildPerfSection(
      theme: theme,
      pageSize: pageSize,
      title: "Strand Performance",
      iconPath: Icons.folder_copy,
      children: [
        buildSubTitle(
          theme: theme,
          title: "Overview",
          subtitle: "Average scores for all strands tested in syllabus order",
        ),
        AppGridChart(
          dataSeries: strandScores,
          chartLabels: strandNames,
          cardIcons: strandIcons,
          showPercentages: false,
          crossCount: 3,
          valuePostfix: '%',
        ),

        //
        SizedBox(height: pageSize.height * spacing),
        buildSubTitle(
          theme: theme,
          title: "Student Mastery",
          subtitle:
              "The top and bottom percentile students across all strands at a glance",
        ),
        AppHeatMap(
          yValues: classPerf.strand_student_mastery?.strands ?? [],
          xValues: (classPerf.strand_student_mastery?.students ?? [])
              .map((e) => e.name.toString())
              .toList(),
          values: (classPerf.strand_student_mastery?.students ?? [])
              .map((e) => e.scores ?? [])
              .toList(),
          yTitle: 'Students',
        ),
      ],
    );
  }
}
