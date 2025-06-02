import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';

class AppGridChart extends StatelessWidget {
  final List<double> dataSeries;
  final List<String> chartLabels;
  final List<IconData>? cardIcons;
  final List<Color>? cardColors;
  final List<Color>? onCardColors;
  final Function(String val)? onCardTap;
  final int crossCount;
  final String valuePrefix;
  final String valuePostfix;
  final IconData actionIconPath;
  final double? cardAspectRatio;
  final String? chartTitle;
  final double spacing;
  final bool showPercentages;

  const AppGridChart({
    super.key,
    required this.dataSeries,
    required this.chartLabels,
    this.valuePrefix = '',
    this.valuePostfix = '',
    this.crossCount = 2,
    this.cardIcons,
    this.cardColors,
    this.onCardColors,
    this.onCardTap,
    this.cardAspectRatio,
    this.chartTitle,
    this.spacing = 1.5,
    this.showPercentages = true,
    this.actionIconPath = Icons.call_made,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    double total = getListOfDoublesSum(dataSeries);
    List<Color> bgColors =
        cardColors ?? getChartColors(dataSeries.length, theme);
    List<Color> fgColors =
        onCardColors ?? getOnChartColors(dataSeries.length, theme);

    return Column(
      children: [
        if (chartTitle != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              chartTitle!,
              style: textTheme.titleMedium!.copyWith(
                color: colorScheme.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        GridView.count(
          crossAxisCount: crossCount,
          childAspectRatio: cardAspectRatio ?? (crossCount == 1 ? 3 : 2.5),
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: dataSeries.asMap().entries.map((e) {
            var i = e.key;
            return getGridCardWidget(
              label: chartLabels[i],
              value: e.value,
              iconPath: cardIcons?[i],
              bgColor: bgColors[i],
              fgColor: fgColors[i],
              percentage: showPercentages ? (e.value / total) * 100 : null,
              theme: theme,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget getGridCardWidget({
    required String label,
    required double value,
    required Color bgColor,
    required Color fgColor,
    required ThemeData theme,
    double? percentage,
    IconData? iconPath,
  }) {
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: () {
        if (onCardTap != null) {
          onCardTap!(label);
        }
      },
      child: Container(
        color: bgColor,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: iconPath != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                if (iconPath != null)
                  CircleAvatar(
                    backgroundColor: fgColor,
                    foregroundColor: bgColor,
                    child: Icon(iconPath),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text.rich(
                      overflow: TextOverflow.ellipsis,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: valuePrefix,
                            style:
                                textTheme.labelSmall!.copyWith(color: fgColor),
                          ),
                          TextSpan(
                            text: getThousandsNumber(value),
                            style: textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: fgColor,
                            ),
                          ),
                          TextSpan(
                            text: valuePostfix,
                            style:
                                textTheme.labelSmall!.copyWith(color: fgColor),
                          ),
                        ],
                      ),
                    ),
                    if (percentage != null)
                      Text(
                        '${percentage.toStringAsFixed(1)}%',
                        style: textTheme.labelSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: fgColor,
                        ),
                      ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold, color: fgColor),
                  ),
                ),
                if (onCardTap != null)
                  CircleAvatar(
                    backgroundColor: fgColor,
                    foregroundColor: bgColor,
                    child: const Icon(Icons.keyboard_arrow_right_rounded),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
