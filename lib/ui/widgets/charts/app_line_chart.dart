import 'dart:math';
import 'dart:developer' as dev;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/widgets/charts/chart_indicators.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';

// Constants
//

// Models
//
class AppLineChartData {
  List<LineChartBarData> lineChartData;
  List<String> xAxisLabels;
  double maxY;
  List<Color> seriesColors;
  List<String> seriesLabels;
  Color? textColor;
  bool? useIndIcons;

  AppLineChartData({
    required this.lineChartData,
    required this.xAxisLabels,
    required this.maxY,
    required this.seriesColors,
    required this.seriesLabels,
    this.textColor,
    this.useIndIcons,
  });

  AppLineChartData copyWith({
    List<LineChartBarData>? lineChartData,
    List<String>? xAxisLabels,
    double? maxY,
    List<Color>? seriesColors,
    List<String>? seriesLabels,
    Color? textColor,
    bool? useIndIcons,
  }) {
    return AppLineChartData(
      lineChartData: lineChartData ?? this.lineChartData,
      xAxisLabels: xAxisLabels ?? this.xAxisLabels,
      maxY: maxY ?? this.maxY,
      seriesColors: seriesColors ?? this.seriesColors,
      seriesLabels: seriesLabels ?? this.seriesLabels,
      textColor: textColor ?? this.textColor,
      useIndIcons: useIndIcons ?? this.useIndIcons,
    );
  }
}

// View
//
class AppLineChart extends StatefulWidget {
  final List<List<double>> dataSeries;
  final List<String> xAxisLabels;
  final List<String>? seriesLabels;
  final List<Color>? seriesColors;
  final Color? textColor;
  final Color? bgColor;
  final double? chartHeight;
  final String? tipPreText;
  final String? chartTitle;
  final String? name;
  final bool? useIndIcons;

  const AppLineChart({
    super.key,
    required this.dataSeries,
    required this.xAxisLabels,
    this.seriesLabels,
    this.seriesColors,
    this.bgColor,
    this.textColor,
    this.chartTitle,
    this.name,
    this.chartHeight = 200,
    this.tipPreText = "",
    this.useIndIcons,
  });

  @override
  State<AppLineChart> createState() => _AppLineChartState();
}

class _AppLineChartState extends State<AppLineChart> {
  int currentSeriesIdx = -1;

  /// [_createChartData]
  /// Returns [0]: chartData, [1]: chartIndicators
  _createChartData(ThemeData theme, Size pageSize) {
    List<List<double>> currentSeries;
    List<String> currentSeriesLabels;
    List<Color> currentSeriesColors;

    List<String> lineSeriesLabels = widget.seriesLabels ??
        List.generate(widget.dataSeries.length, (i) => "Series $i");
    List<Color> lineChartColors =
        widget.seriesColors ?? getChartColors(widget.dataSeries.length, theme);

    if (currentSeriesIdx == -1) {
      currentSeries = widget.dataSeries;
      currentSeriesLabels = lineSeriesLabels;
      currentSeriesColors = lineChartColors;
    } else {
      currentSeries = [widget.dataSeries[currentSeriesIdx]];
      currentSeriesLabels = [lineSeriesLabels[currentSeriesIdx]];
      currentSeriesColors = [lineChartColors[currentSeriesIdx]];
    }

    List<Widget> lineChartIndicators = getChartIndicators(
      currentSeriesLabels,
      currentSeriesColors,
      [],
      useIcons: widget.useIndIcons,
      theme: theme,
      pageSize: pageSize,
    );

    final lineChartData = getLineChartData(currentSeries, currentSeriesColors);

    AppLineChartData chartData = AppLineChartData(
      lineChartData: lineChartData,
      xAxisLabels: widget.xAxisLabels,
      maxY: getMaxY(currentSeries),
      textColor: widget.textColor,
      seriesColors: currentSeriesColors,
      seriesLabels: currentSeriesLabels,
      useIndIcons: widget.useIndIcons,
    );

    return [chartData, lineChartIndicators];
  }

  void onSwapChartSeries(ThemeData theme, Size pageSize) {
    currentSeriesIdx++;
    if (currentSeriesIdx < widget.dataSeries.length) {
      _createChartData(theme, pageSize);
    } else {
      currentSeriesIdx = -1;
      _createChartData(theme, pageSize);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    var createChartRes = _createChartData(theme, pageSize);
    AppLineChartData chartData = createChartRes[0];
    List<Widget> chartIndicators = createChartRes[1];

    return Column(
      children: [
        const SizedBox(height: 10),
        if (widget.chartTitle != null)
          Text(
            widget.chartTitle!,
            style: textTheme.titleLarge!.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        if (widget.dataSeries.length > 1)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Wrap(
                  children:
                      chartIndicators.map((indicator) => indicator).toList(),
                ),
                IconButton(
                  onPressed: () => onSwapChartSeries(theme, pageSize),
                  icon: const Icon(Icons.swap_horiz),
                )
              ],
            ),
          ),
        SizedBox(
          height: widget.chartHeight,
          child: LineChart(
            LineChartData(
              maxY: chartData.maxY,
              minY: 0.0,
              lineBarsData: chartData.lineChartData,
              titlesData: FlTitlesData(
                show: true,
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: getXAxisTitles,
                    interval: 1,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 48,
                    getTitlesWidget: getYAxisTitles,
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: theme.hintColor,
                  ),
                ),
              ),
              gridData: const FlGridData(show: true, drawVerticalLine: false),
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Theme.of(context)
                      .colorScheme
                      .surfaceContainerHighest
                      .withOpacity(0.4),
                  // getTooltipColor: (data) => Theme.of(context)
                  //     .colorScheme
                  //     .surfaceVariant
                  //     .withOpacity(0.4),
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots
                        .map((e) => LineTooltipItem(
                              "${widget.xAxisLabels[e.spotIndex]}: ${widget.tipPreText}${getThousandsNumber(widget.dataSeries[e.barIndex][e.spotIndex])}",
                              TextStyle(
                                color: chartData.seriesColors[e.barIndex],
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ))
                        .toList();
                  },
                  tooltipPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<LineChartBarData> getLineChartData(
      List<List<double>> series, List<Color> colors) {
    List<LineChartBarData> lineChartData = [];

    for (int index = 0; index < series.length; index++) {
      List<FlSpot> spots = [];
      for (int x = 0; x < series[index].length; x++) {
        spots.add(FlSpot(x.toDouble(), series[index][x]));
      }

      var lineData = LineChartBarData(
        spots: spots,
        isCurved: true,
        color: colors[index],
        dotData: const FlDotData(show: true),
        barWidth: 0.7,
      );
      lineChartData.add(lineData);
    }
    return lineChartData;
  }

  double getMaxY(List<List<double>> dataSeries) {
    List<double> allPoints = [];
    for (var series in dataSeries) {
      for (var point in series) {
        allPoints.add(point);
      }
    }
    if (allPoints.isEmpty) {
      dev.log("⚠️ getMaxY: dataSeries is empty. Defaulting to maxY=1.");
      return 1;
    }
    return allPoints.reduce(max);
  }

  Widget getXAxisTitles(double xValue, TitleMeta meta) {
    if (xValue.isInfinite || xValue.isNaN) {
      dev.log("Invalid xValue in getXAxisTitles: $xValue");
      return const SizedBox.shrink(); // avoid rendering invalid label
    }

    final index = xValue.toInt();
    String text = index >= 0 && index < widget.xAxisLabels.length
        ? widget.xAxisLabels[index]
        : '';

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        text,
        style: TextStyle(color: widget.textColor, fontSize: 11),
      ),
    );
  }

  Widget getYAxisTitles(double yValue, TitleMeta meta) {
    if (yValue.isInfinite || yValue.isNaN) {
      dev.log("Invalid yValue in getYAxisTitles: $yValue");
      return const SizedBox.shrink();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: TextStyle(color: widget.textColor, fontSize: 11),
      ),
    );
  }
}
