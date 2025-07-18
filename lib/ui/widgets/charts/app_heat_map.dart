import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';

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
