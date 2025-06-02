import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/models/performance.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/widgets/app_animated_counter.dart';
import 'package:mtihani_app/ui/widgets/app_text_carousel.dart';
import 'package:mtihani_app/ui/widgets/charts/app_linear_percent_chart.dart';
import 'package:mtihani_app/ui/widgets/charts/app_percent_charts.dart';
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
            valueToAnimate: value.toInt(),
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
  final VoidCallback? onInfoItemTap;
  final Color? bgColor;
  final Color? fgColor;

  const CompactInfoCard({
    super.key,
    required this.title,
    required this.iconPath,
    required this.infoItems,
    this.onTap,
    this.onInfoItemTap,
    this.bgColor,
    this.fgColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
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
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600, color: fgColor),
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
                  onTap: onInfoItemTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['name'] ?? '',
                          style: theme.textTheme.bodyMedium!
                              .copyWith(color: fgColor),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(color: fgColor),
                          ),
                        ),
                        Text(
                          item['value'] ?? '',
                          style: theme.textTheme.bodyMedium!.copyWith(
                              color: fgColor, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
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
              valueToAnimate: avgScore?.toInt() ?? 0,
              startValue: 0,
              postTexts: [
                TextSpan(text: "%", style: theme.textTheme.titleMedium),
              ],
            ),
            Text(
              '${avgExpectationLevel ?? "--"} Expectations',
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
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
  final VoidCallback onInfoItemTap;
  const StrandPerformanceWidget({
    super.key,
    required this.strandData,
    required this.onInfoItemTap,
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
        SizedBox(height: pageSize.height * spacing),
        AppTextCarousel(
          title: 'Insights',
          texts: widget.strandData.insights ?? [],
        ),

        //
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
                iconPath: FontAwesomeIcons.userGroup,
                bgColor: kcLightGrey,
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
                iconPath: FontAwesomeIcons.userGroup,
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

        //
        SizedBox(height: pageSize.height * spacing),
        buildSubTitle(
          theme: theme,
          title: 'Sub-Strand Performance',
          subtitle: '',
        ),
        Row(
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
                              (selectedSubStrand!.percentage ?? 0.0).toInt(),
                          startValue: 0,
                          textStyle: theme.textTheme.displayLarge,
                          postTexts: [
                            TextSpan(
                                text: "%", style: theme.textTheme.titleMedium),
                          ],
                        ),
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
                                text:
                                    selectedSubStrand!.difference_desc ?? "--",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
        //
        SizedBox(height: pageSize.height * spacing),
        AppTextCarousel(
          title: 'Recommendations',
          texts: widget.strandData.suggestions ?? [],
        ),

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
