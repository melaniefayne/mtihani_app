import 'package:flutter/material.dart';
import 'package:mtihani_app/models/exam.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/widgets/app_animated_counter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AppHalfArcPercentChart extends StatelessWidget {
  final double percent;
  final Color? progressColor;
  final Widget? center;
  final double? centerRadius;
  const AppHalfArcPercentChart({
    super.key,
    required this.percent,
    this.progressColor,
    this.center,
    this.centerRadius,
  });

  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.sizeOf(context);
    double chartRadius = centerRadius ?? pageSize.height * 0.2;

    return Stack(
      children: [
        ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.5,
            child: CircularPercentIndicator(
              radius: chartRadius,
              lineWidth: 40,
              percent: (percent / 2) * 0.01,
              animation: true,
              progressColor: progressColor ?? kcDarkGreyColor,
              animationDuration: 800,
              startAngle: 270,
            ),
          ),
        ),
        if (center != null)
          Positioned(
            bottom: chartRadius * 0.1,
            left: 0,
            right: 0,
            child: center!,
          ),
      ],
    );
  }
}

class AppCircularPercentChart extends StatelessWidget {
  final double percent;
  final Color? progressColor;
  final String? title;
  final double? centerRadius;
  const AppCircularPercentChart({
    super.key,
    required this.percent,
    this.title,
    this.progressColor,
    this.centerRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    double chartRadius = centerRadius ?? pageSize.height * 0.045;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularPercentIndicator(
          radius: chartRadius,
          percent: percent > 100 ? 1.0 : percent * 0.01,
          progressColor: progressColor ?? kcMediumGrey,
          backgroundColor:
              theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.2),
          animation: true,
          animationDuration: 800,
          center: Center(
            child: Text("$percent%",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(title!, style: theme.textTheme.titleMedium),
          ),
      ],
    );
  }
}

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

class AppHeatMap extends StatelessWidget {
  final List<String> yValues;
  final List<String> xValues;
  final List<List<double>> values;
  final String yTitle;

  const AppHeatMap({
    super.key,
    required this.yValues,
    required this.xValues,
    required this.values,
    required this.yTitle,
  });

  Color getColorFromScore(double score) {
    if (score < 40) return appRed;
    if (score < 60) return appPeach;
    if (score < 70) return appYellow;
    if (score < 80) return appGreen;
    if (score < 90) return appPurple;
    return appBlue;
  }

  String getScoreRangeLabel(double score) {
    if (score < 40) return "< 40";
    if (score < 60) return "40–59";
    if (score < 70) return "60–69";
    if (score < 80) return "70–79";
    if (score < 90) return "80–89";
    return "90–100";
  }

  List<Map<String, dynamic>> getLegendData() {
    return [
      {"label": "< 40", "color": appRed},
      {"label": "40–59", "color": appPeach},
      {"label": "60–69", "color": appYellow},
      {"label": "70–79", "color": appGreen},
      {"label": "80–89", "color": appPurple},
      {"label": "90–100", "color": appBlue},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: (50 * xValues.length).toDouble(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Table(
              defaultColumnWidth: const IntrinsicColumnWidth(),
              border: TableBorder.all(color: kcMediumGrey),
              children: [
                // Header Row
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          yTitle,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    for (final val in yValues)
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            val,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                  ],
                ),
                // Other Rows
                for (int idx = 0; idx < xValues.length; idx++)
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(xValues[idx]),
                        ),
                      ),
                      ...values[idx].map(
                        (e) {
                          Color bgColor = getColorFromScore(e);
                          return TableCell(
                            child: Container(
                              color: bgColor,
                              padding: const EdgeInsets.all(8),
                              alignment: Alignment.center,
                              child: Text(
                                e.toStringAsFixed(1),
                                style: TextStyle(
                                    color: defaultTextChartColors[bgColor]),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ],
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.end,
          children: getLegendData().map((item) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  color: item['color'],
                ),
                const SizedBox(width: 4),
                Text(item['label']),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
