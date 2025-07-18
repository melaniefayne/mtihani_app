import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mtihani_app/ui/common/app_colors.dart';
import 'package:mtihani_app/ui/widgets/charts/chart_indicators.dart';
import 'package:mtihani_app/utils/helpers/convertors.dart';

// Constants
//

// Models
//

// View
//
class AppPieDonutChart extends StatelessWidget {
  final List<double> dataSeries;
  final List<String> pieLabels;
  final List<Color>? pieColors;
  final List<Color>? onPieColors;
  final Axis? chartDirection;
  final double chartHeight;
  final double? donutCenterRadius;
  final Color? bgColor;
  final bool hideIndicators;
  final String? chartTitle;
  final double? badgeOffset;
  final double titleOffset;
  final bool hideIndicatorExt;
  final bool? useIndIcons;
  final bool isHalfArcChart;
  final double? sectionsSpace;
  final String indicatorPrefix;
  final String? selectedIndicator;
  final Function(String val)? onIndicatorTap;
  final Widget? centerWidget;
  final List<Color>? textColors;

  ///[AppPieDonutChart] renders custom Sisitech Pie or Donut Chart
  /// Required Fields:
  ///- List<double> dataSeries: single series of data points
  ///- List<String> pieLabels: list of labels for each data point
  /// Other Fields:
  ///- double? donutCenterRadius = 0: to get pie chart instead of donut
  ///
  const AppPieDonutChart({
    super.key,
    required this.dataSeries,
    required this.pieLabels,
    this.pieColors,
    this.onPieColors,
    this.chartDirection,
    this.chartHeight = 220,
    this.donutCenterRadius,
    this.bgColor,
    this.hideIndicators = false,
    this.chartTitle,
    this.badgeOffset,
    this.titleOffset = 0.7,
    this.hideIndicatorExt = false,
    this.useIndIcons,
    this.isHalfArcChart = false,
    this.sectionsSpace,
    this.indicatorPrefix = '',
    this.onIndicatorTap,
    this.selectedIndicator,
    this.centerWidget,
    this.textColors,
  });

  /// [_createChartData]
  ///Returns [0]: chartData, [1] chartIndicators
  _createChartData(ThemeData theme, Size pageSize) {
    List<double> chartSeries =
        isHalfArcChart ? getHalfArcChartValues(dataSeries) : dataSeries;

    List<Color> bgColors =
        pieColors ?? getChartColors(chartSeries.length, theme);
    List<Color> fgColors =
        onPieColors ?? getOnChartColors(chartSeries.length, theme);

    List<Widget> pieChartIndicators = getChartIndicators(
      pieLabels,
      bgColors,
      hideIndicatorExt == true ? [] : dataSeries,
      useIcons: useIndIcons,
      indicatorPrefix: indicatorPrefix,
      selectedIndicator: selectedIndicator,
      onIndicatorTap: chartDirection != Axis.horizontal ? onIndicatorTap : null,
      theme: theme,
      pageSize: pageSize,
    );
    List<String> chartLabels = isHalfArcChart ? [...pieLabels, ''] : pieLabels;

    List<PieChartSectionData> chartData = getPieChartSections(
      chartColors: bgColors,
      onChartColors: fgColors,
      isPieChart: donutCenterRadius == 0,
      chartLabels: chartLabels,
    );

    return [chartData, pieChartIndicators, chartLabels];
  }

  List<PieChartSectionData> getPieChartSections(
      {required List<Color> chartColors,
      required List<Color> onChartColors,
      required bool isPieChart,
      required List<String> chartLabels}) {
    List<PieChartSectionData> pieSections = [];
    double total = getListOfDoublesSum(dataSeries);
    List<double> chartSeries =
        isHalfArcChart ? getHalfArcChartValues(dataSeries) : dataSeries;

    int chartSeriesMax =
        isHalfArcChart ? chartSeries.length - 1 : chartSeries.length;

    for (int i = 0; i < chartSeries.length; i++) {
      double chartPercent = (chartSeries[i] / total) * 100;
      double actualPercent =
          i < dataSeries.length ? (dataSeries[i] / total) * 100 : 0;

      String percentTitle = "${actualPercent.toStringAsFixed(1)}%";
      String sectionTitle = hideIndicators == true && i < chartSeriesMax
          ? "${chartLabels[i]} • $percentTitle"
          : chartLabels[i];
      Color? textColor = i < chartSeriesMax ? onChartColors[i] : null;
      TextStyle chartTxtStyle = TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 11,
      );

      PieChartSectionData pieSection = PieChartSectionData(
        color: i < chartSeriesMax ? chartColors[i] : null,
        value: chartPercent,
        title: sectionTitle,
        titleStyle: chartTxtStyle,
        showTitle: hideIndicators,
        badgeWidget: hideIndicators == true
            ? null
            : Text(
                percentTitle,
                style: chartTxtStyle,
              ),
        radius: isPieChart
            ? chartLabels[i] == selectedIndicator
                ? chartHeight * 0.5
                : chartHeight * 0.47
            : chartLabels[i] == selectedIndicator
                ? 45
                : 40,
        badgePositionPercentageOffset: badgeOffset,
        titlePositionPercentageOffset: titleOffset,
      );
      pieSections.add(pieSection);
    }
    return pieSections;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageSize = MediaQuery.sizeOf(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    bool isHorizFormat = chartDirection == Axis.horizontal;

    var createChartRes = _createChartData(theme, pageSize);
    List<PieChartSectionData> pieSections = createChartRes[0];
    List<Widget> chartIndicators = createChartRes[1];
    List<String> chartLabels = createChartRes[2];

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          if (chartTitle != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                chartTitle!,
                style: textTheme.titleMedium!.copyWith(
                  color: colorScheme.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          isHorizFormat
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _getChartSection(
                        isHorizFormat: isHorizFormat,
                        context: context,
                        pieSections: pieSections,
                        sectionsSpace: sectionsSpace,
                        centerWidget: centerWidget,
                        chartLabels: chartLabels,
                      ),
                    ),
                    const SizedBox(width: 5),
                    hideIndicators == true
                        ? const SizedBox()
                        : _getIndicatorsSection(
                            context: context,
                            chartIndicators: chartIndicators,
                          ),
                  ],
                )
              : Column(
                  children: [
                    _getChartSection(
                      isHorizFormat: isHorizFormat,
                      context: context,
                      pieSections: pieSections,
                      sectionsSpace: sectionsSpace,
                      chartLabels: chartLabels,
                      centerWidget: centerWidget,
                    ),
                    const SizedBox(height: 10),
                    hideIndicators == true
                        ? const SizedBox()
                        : _getIndicatorsSection(
                            context: context,
                            chartIndicators: chartIndicators,
                          ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _getChartSection({
    required bool isHorizFormat,
    required BuildContext context,
    required List<PieChartSectionData> pieSections,
    required List<String> chartLabels,
    double? sectionsSpace,
    Widget? centerWidget,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: isHalfArcChart ? 0.5 : 1,
            child: SizedBox(
              height: isHalfArcChart ? chartHeight * 1.2 : chartHeight,
              child: PieChart(
                PieChartData(
                  sections: pieSections,
                  startDegreeOffset: 180,
                  sectionsSpace: sectionsSpace,
                  borderData: FlBorderData(show: false),
                  centerSpaceRadius: isHalfArcChart ? null : donutCenterRadius,
                  pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    if (event is FlLongPressEnd) {
                      if (pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null ||
                          onIndicatorTap == null) {
                        return;
                      }

                      int? touchedIndex =
                          pieTouchResponse.touchedSection?.touchedSectionIndex;

                      if (touchedIndex != null && touchedIndex != -1) {
                        onIndicatorTap!(chartLabels[touchedIndex]);
                      }
                    }
                  }),
                ),
              ),
            ),
          ),
        ),
        if (centerWidget != null) centerWidget
      ],
    );
  }

  Widget _getIndicatorsSection({
    required BuildContext context,
    required List<Widget> chartIndicators,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: chartIndicators.map((indicator) => indicator).toList(),
    );
  }

  List<double> getHalfArcChartValues(List<double> ogSeries) {
    List<double> values = [];
    double total = getListOfDoublesSum(dataSeries);
    for (var val in ogSeries) {
      values.add(val / 2);
    }
    values.add(total / 2);
    return values;
  }
}
