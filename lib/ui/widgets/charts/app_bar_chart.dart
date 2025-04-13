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
class AppBarChartData {
  List<BarChartGroupData> barGroupData;
  List<String> xAxisLabels;
  double maxY;
  List<Color> seriesColors;
  List<String> seriesLabels;
  Color? textColor;
  bool? useIndIcons;

  AppBarChartData({
    required this.barGroupData,
    required this.xAxisLabels,
    required this.maxY,
    required this.seriesColors,
    required this.seriesLabels,
    this.textColor,
    this.useIndIcons,
  });

  AppBarChartData copyWith({
    List<BarChartGroupData>? barGroupData,
    List<String>? xAxisLabels,
    double? maxY,
    List<Color>? seriesColors,
    List<String>? seriesLabels,
    Color? textColor,
    bool? useIndIcons,
  }) {
    return AppBarChartData(
      barGroupData: barGroupData ?? this.barGroupData,
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
class AppBarChart extends StatefulWidget {
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
  final double? barWidth;

  const AppBarChart({
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
    this.barWidth,
  });

  @override
  State<AppBarChart> createState() => _AppBarChartState();
}

class _AppBarChartState extends State<AppBarChart> {
  int currentSeriesIdx = -1;

  /// [_createChartData]
  ///Returns [0]: chartData, [1] chartIndicators
  _createChartData(ThemeData theme, Size pageSize) {
    List<List<double>> currentSeries;
    List<String> currentSeriesLabels;
    List<Color> currentSeriesColors;

    List<String> barSeriesLabels = widget.seriesLabels ??
        List.generate(widget.dataSeries.length, (i) => "Series $i");
    List<Color> barChartColors =
        widget.seriesColors ?? getChartColors(widget.dataSeries.length, theme);

    if (currentSeriesIdx == -1) {
      currentSeries = widget.dataSeries;
      currentSeriesLabels = barSeriesLabels;
      currentSeriesColors = barChartColors;
    } else {
      currentSeries = [widget.dataSeries[currentSeriesIdx]];
      currentSeriesLabels = [barSeriesLabels[currentSeriesIdx]];
      currentSeriesColors = [barChartColors[currentSeriesIdx]];
    }

    List<Widget> barChartIndicators = getChartIndicators(
      currentSeriesLabels,
      currentSeriesColors,
      [],
      theme: theme,
      pageSize: pageSize,
    );

    final barGroupData =
        getBarGroupData(currentSeries, currentSeriesColors, widget.barWidth);

    AppBarChartData chartData = AppBarChartData(
      barGroupData: barGroupData,
      xAxisLabels: widget.xAxisLabels,
      maxY: getMaxY(currentSeries),
      textColor: widget.textColor,
      seriesColors: currentSeriesColors,
      seriesLabels: currentSeriesLabels,
      useIndIcons: widget.useIndIcons,
    );

    return [chartData, barChartIndicators];
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
    AppBarChartData chartData = createChartRes[0];
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
          child: BarChart(
            BarChartData(
              maxY: chartData.maxY,
              minY: 0.0,
              barGroups: chartData.barGroupData,
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
              groupsSpace: 6.0,
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: theme.colorScheme.surfaceContainerHighest
                      .withOpacity(0.4),
                  getTooltipItem: (BarChartGroupData group, int groupIndex,
                      BarChartRodData rod, int rodIndex) {
                    return BarTooltipItem(
                      "${widget.xAxisLabels[group.x]}: ",
                      TextStyle(
                        color: widget.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              "${widget.tipPreText}${getThousandsNumber(rod.toY)}",
                          style: TextStyle(
                            color: rod.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    );
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

  List<BarChartGroupData> getBarGroupData(
      List<List<double>> series, List<Color> colors, double? barWidth) {
    List<BarChartGroupData> barGroupData = [];

    for (int x = 0; x < series[0].length; x++) {
      var barData = BarChartGroupData(
        barsSpace: 2.0,
        x: x,
        barRods: getBarRods(series, colors, x, barWidth),
      );
      barGroupData.add(barData);
    }
    return barGroupData;
  }

  List<BarChartRodData> getBarRods(
    List<List<double>> series,
    List<Color> colors,
    int seriesIndex,
    double? barWidth,
  ) {
    List<BarChartRodData> barRods = [];
    for (int index = 0; index < series.length; index++) {
      var e = series[index];
      barRods.add(
        BarChartRodData(
          toY: e[seriesIndex].isFinite ? e[seriesIndex] : 0,
          color: colors[index],
          width: barWidth ?? 8.0,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(2),
            topRight: Radius.circular(2),
          ),
        ),
      );
    }
    return barRods;
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
