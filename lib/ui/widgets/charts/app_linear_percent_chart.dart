import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// View
//

///[AppLinearPercentChart] renders custom Sisitech Linear Percent Indicators Charts
/// Required Fields:
///- List<double> dataSeries: single series of data points
///- List<String> chartLabels: list of labels for each data point
class AppLinearPercentChart extends StatelessWidget {
  final List<double> dataSeries;
  final List<String> chartLabels;
  final List<Color>? tileColors;
  final String? selectedTile;
  final Function(String val)? onChartTileTap;
  final List<Widget>? leadingWidgets;
  final List<Widget>? trailingWidgets;
  final Color? selectedColor;
  final String? chartTitle;
  final double tileHeight;
  final List<Color>? textColors;
  final String? indicatorPrefix;
  final String? indicatorPostfix;
  final bool showPercentages;

  const AppLinearPercentChart({
    required this.dataSeries,
    required this.chartLabels,
    this.tileColors,
    this.selectedTile,
    this.onChartTileTap,
    this.leadingWidgets,
    this.trailingWidgets,
    this.selectedColor,
    this.chartTitle,
    this.tileHeight = 42.0,
    this.textColors,
    this.indicatorPrefix = "",
    this.indicatorPostfix = "",
    this.showPercentages = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    List<Color> bgColors =
        tileColors ?? getChartColors(dataSeries.length, theme);
    List<Color> fgColors =
        textColors ?? getOnChartColors(dataSeries.length, theme);

    double total = dataSeries.fold(0, (sum, item) => sum + item);
    List<double> percentages = total != 0
        ? dataSeries.map((item) => item / total).toList()
        : List.filled(dataSeries.length, 0.0);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          if (chartTitle != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chartTitle!,
                  style: textTheme.titleLarge!.copyWith(
                      color: colorScheme.primary, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
              ],
            ),
          if (percentages.isNotEmpty)
            ...percentages.asMap().entries.map(
              (entry) {
                int idx = entry.key;
                double percent = percentages[idx];

                bool isSelected = selectedTile == chartLabels[idx];
                return buildLinearPercentTile(
                  pageSize: pageSize,
                  colorScheme: colorScheme,
                  label: chartLabels[idx],
                  percent: percent,
                  bgColor: bgColors[idx],
                  fgColor: fgColors[idx],
                  value: dataSeries[idx],
                  indicatorPrefix: indicatorPrefix,
                  leadingWidget:
                      leadingWidgets == null ? null : leadingWidgets![idx],
                  trailingWidget:
                      trailingWidgets != null ? trailingWidgets![idx] : null,
                  tileHeight: tileHeight,
                  isSelected: isSelected,
                  selectedColor: selectedColor,
                  onChartTileTap: onChartTileTap,
                );
              },
            ),
        ],
      ),
    );
  }

  Widget buildLinearPercentTile({
    required Size pageSize,
    bool isSelected = false,
    required ColorScheme colorScheme,
    Color? selectedColor,
    Function(String val)? onChartTileTap,
    required String label,
    double tileHeight = 47.0,
    required double percent,
    Widget? leadingWidget,
    required Color bgColor,
    required Color fgColor,
    String? indicatorPrefix = "",
    required double value,
    Widget? trailingWidget,
  }) {
    return GestureDetector(
      onTap: () {
        if (onChartTileTap != null) {
          onChartTileTap(label);
        }
      },
      child: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: isSelected ? const EdgeInsets.all(4) : null,
                  color: isSelected ? bgColor.withOpacity(0.4) : null,
                  child: LinearPercentIndicator(
                    animation: true,
                    lineHeight: tileHeight,
                    animationDuration: 1000,
                    percent: percent,
                    backgroundColor: colorScheme.surface,
                    progressColor: bgColor,
                    barRadius: const Radius.circular(5),
                    leading: leadingWidget,
                  ),
                ),
                Container(
                  width: pageSize.width * 0.4,
                  margin: const EdgeInsets.only(left: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        label,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              percent < 0.6 ? colorScheme.onSurface : fgColor,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            color:
                                percent < 0.6 ? colorScheme.onSurface : fgColor,
                          ),
                          children: [
                            TextSpan(text: indicatorPrefix),
                            TextSpan(text: addThousandSeparators(value)),
                            TextSpan(text: indicatorPostfix),
                            if (showPercentages)
                              TextSpan(
                                text:
                                    " • ${(percent * 100).toStringAsFixed(1)}%",
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (trailingWidget != null) trailingWidget,
        ],
      ),
    );
  }
}
